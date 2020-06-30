include('Modes.lua')
include('augments_tadako.lua')

function define_modes()
  Capacity = M(false, 'Capacity Mantle')
  DummyIndex = 0
  SCRunning = false
end

function define_aliases()
  -- Self Buffs
  send_command('bind !f5 stoneskin')
  send_command('bind !f6 phalanx')
  send_command('bind !f7 blink')
  send_command('bind !f8 aquaveil')
end

function get_sets()
  -- send_command('lua load setlist')
  -- send_command('lua load dressup')
  define_modes()
  define_aliases()

  gear = {
  }

  -- Modes
  sets.Idle = {
    main="Queller Rod",
    sub="Genbu's Shield",
    head="Inyanga Tiara +2",
    neck="Loricate Torque +1",
    left_ear="Flashward Earring",
    right_ear="Etiolation Earring",
    body="Inyanga Jubbah +2",
    hands="Inyanga Dastanas +2",
    left_ring="Gelatinous Ring +1",
    right_ring="Warden's Ring",
    back="Solemnity Cape",
    waist="Fucho-no-Obi",
    legs="Inyanga Shalwar +2",
    feet="Inyanga Crackows +1"
  }
  sets.Engaged = {

  }

  -- Magic
  sets.Magic = {}
  sets.Magic.Precast = {
    -- main=gear.kali.refresh,
    head="Kaykaus Mitra",
    neck="Orunmila's torque",
    body="Inyanga Jubbah +2",
    hands=augments.telchine.gloves.enhancing,
    left_ring="Weatherspoon Ring",
    right_ring="Kishar Ring",
    left_ear="Loquacious earring",
    right_ear="Etiolation Earring",
    legs="Kaykaus Tights",
    -- back=gear.cape.fastCast,
    waist="Witful Belt"
  }
  sets.Magic.Healing = {
    main="Queller Rod",
    head="Kaykaus Mitra",
    neck="Incanter's Torque",
    left_ear="Novia Earring",
    right_ear="Mendicant's Earring",
    body="Vanya Robe",
    hands="Kaykaus Cuffs",
    left_ring="Lebeche Ring",
    right_ring="Haoma's Ring",
    back="Oretan. Cape +1",
    waist="Pythia Sash",
    legs="Kaykaus Tights",
    feet="Vanya Clogs"
  }
  sets.Magic.HealingPrecast = {
    head="Kaykaus Mitra",
    right_ear="Mendicant's Earring",
  }
  sets.Magic.HealingSelf = {
    waist="Chuq'aba belt"
  }
  sets.Magic.Cursna = {
    head="Kaykaus Mitra",                    -- Cursna/Skill
    neck="Malison Medallion",                -- Cursna
    left_ear="Loquacious earring",           -- FC
    right_ear="Etiolation Earring",          -- FC
    body="Inyanga Jubbah +2",                -- FC
    hands=augments.telchine.gloves.enhancing,-- FC
    left_ring="Haoma's Ring",                -- Cursna/Skill
    right_ring="Haoma's Ring",               -- Cursna/Skill
    back="Oretan. Cape +1",                  -- Cursna
    waist="Witful Belt",                     -- FC
    legs="Kaykaus Tights",                   -- FC
    feet="Vanya Clogs"                       -- Cursna/Skill
  }
  sets.Magic.Enhancing = {
    main="Gada",
    head=augments.telchine.head.enhancing,
    hands=augments.telchine.gloves.enhancing,
    body=augments.telchine.body.enhancing,
    legs=augments.telchine.legs.enhancing,
    feet=augments.telchine.feet.enhancing
  }
  sets.Magic.Enfeebling = {}

  -- Abilities
  sets.JobAbility = {}
  sets.WeaponSkill = {}
end

function precast(spell)
  if spell.type == 'JobAbility' then
    equip(sets.JobAbility[spell.english])

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.Precast)
    if string.find(spell.english, 'Cure') or string.find(spell.english, 'Curaga') then
      equip(sets.Magic.HealingPrecast)
    end

  elseif spell.type == 'WeaponSkill' then
    equip(sets.WeaponSkill)
    equip(sets.WeaponSkill[spell.english])
  end

  precast_cancelations(spell)
end

function precast_cancelations(spell)
  if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
    send_command('@wait 0.4; cancel 66; cancel 444; cancel 445')

  elseif spell.english == 'Spectral Jig' then
    cast_delay(0.25)
    send_command('@cancel 71;')
  end
end

function midcast(spell)
  eng = spell.english

  -- Cures
  if spell.skill == 'Healing Magic' then
    if eng == "Cursna" then
      equip(sets.Magic.Cursna)

    elseif string.find(eng, 'Cure') or string.find(eng, 'Curaga') then
      equip(sets.Magic.Healing)
      if spell.target.type == 'SELF' then
        equip(sets.Magic.HealingSelf)
      end
    end

  -- Buffs
  elseif spell.skill == 'Enhancing Magic' then
    equip(sets.Magic.Enhancing)

    if eng == 'Stoneskin' then
      equip(sets.Magic.EnhancingStoneskin)

    elseif eng == 'Phalanx' then
      equip(sets.Magic.EnhancingPhalanx)

    elseif string.find(eng, 'Regen') then
      equip(sets.Magic.EnhancingRegen)

    elseif eng == 'Refresh' then
      equip(sets.Magic.EnhancingRefresh)
      if spell.target.type == 'SELF' then
        equip(sets.Magic.EnhancingRefreshSelf)
      end
    end

  -- Enfeebles
  elseif spell.skill == 'Enfeebling Magic' then
    equip(sets.Magic.Enfeebling)
  end
end

function aftercast(spell)
  if player.status=='Engaged' then
    equip(sets.Engaged)
  else
    equip(sets.Idle)
  end
  if Capacity.value then
    equip({back = "Aptitude Mantle +1"})
  end
end

function status_change(new, old)
  if new == 'Resting' then
    equip(sets.Resting)
  elseif new == 'Engaged' then
    equip(sets.Engaged)
  else
    equip(sets.Idle)
  end
end

function self_command(commandArgs)
  local commandArgs = commandArgs
  if type(commandArgs) == 'string' then
    commandArgs = commandArgs:split(' ')
    if #commandArgs == 0 then
        return
    end
  end
  command = commandArgs[1]

  if command == 'mode' then
    if player.status=='Engaged' then
      equip(sets.Engaged)
    else
      equip(sets.Idle)
    end
  elseif command == 'cycle' then
    -- local mode = _G[commandArgs[2]]
    -- if mode ~= nil and mode._class == 'mode' then
    --   mode:cycle()
    --   add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
    -- end
    equip(sets.Idle)
  elseif command == 'idle' then
    equip(sets.Idle)
  elseif command == 'run' then
    equip(sets.MoveSpeed)
  end
end
