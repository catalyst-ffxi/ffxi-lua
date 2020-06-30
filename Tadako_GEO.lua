include('Modes.lua')
include('augments_tadako.lua')

function define_modes()
end

function define_aliases()
  -- Self Buffs
  send_command('bind !f5 stoneskin')
  send_command('bind !f6 phalanx')
  send_command('bind !f7 blink')
  send_command('bind !f8 aquaveil')
end

function get_sets()
  define_modes()
  define_aliases()

  gear = {}

  -- Modes
  sets.Idle = {
    main="Solstice",
    sub="Genbu's Shield",
    range="Dunna",
    head="Merlinic Hood",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +1",
    legs="Assiduity Pants",
    feet="Vanya Clogs",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Flashward Earring",
    right_ear="Etiolation Earring",
    left_ring="Gelatinous Ring +1",
    right_ring="Purity Ring",
    back="Nantosuelta's Cape"
  }
  sets.Engaged = {
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.Precast = {
    main="Solstice",                          -- 5 FC
    sub="Genbu's Shield",
    -- ammo="Sapience Orb",                      -- 2 FC
    head="Merlinic Hood",                     -- 8 FC
    --body="",
    hands=augments.telchine.gloves.enhancing, -- 4 FC
    -- legs="Kaykaus Tights",                    -- 6 FC
    feet="Merlinic Crackows",                 -- 5 FC
    neck="Orunmila's torque",                 -- 5 FC
    waist="Witful Belt",                      -- 3 FC
    left_ear="Loquacious earring",            -- 2 FC
    right_ear="Etiolation Earring",           -- 1 FC
    left_ring="Weatherspoon Ring",            -- 5 FC
    right_ring="Kishar Ring",                 -- 4 FC
    -- back="Nantosuelta's Cape",                -- 10 FC
  }                                           -- 55 FC
  sets.Magic.Healing = {
    main="Gada",                     -- 18
    -- head="Kaykaus Mitra",            -- 10
    neck="Incanter's Torque",
    left_ear="Novia Earring",
    right_ear="Regal Earring",
    body="Vanya Robe",               -- 7
    -- hands="Kaykaus Cuffs",           -- 10
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    -- back="Lugh's Cape",
    waist="Pythia Sash",
    -- legs="Kaykaus Tights",           -- 10
    feet="Vanya Clogs"               -- 5
  }
  sets.Magic.HealingPrecast = {
    -- head="Kaykaus Mitra",
    right_ear="Mendicant's Earring",
  }
  sets.Magic.HealingSelf = {
    waist="Chuq'aba belt"
  }
  sets.Magic.Cursna = {
    -- head="Kaykaus Mitra",                    -- Cursna/Skill
    neck="Malison Medallion",                -- Cursna
    left_ear="Loquacious earring",           -- FC
    right_ear="Etiolation Earring",          -- FC
    -- body="Inyanga Jubbah +2",                -- FC
    hands=augments.telchine.gloves.enhancing,-- FC
    left_ring="Haoma's Ring",                -- Cursna/Skill
    right_ring="Haoma's Ring",               -- Cursna/Skill
    back="Oretan. Cape +1",                  -- Cursna
    waist="Witful Belt",                     -- FC
    -- legs="Kaykaus Tights",                   -- FC
    feet="Vanya Clogs"                       -- Cursna/Skill
  }
  sets.Magic.Enhancing = {
    main="Gada",
    head=augments.telchine.head.enhancing,
    hands=augments.telchine.gloves.enhancing,
    body=augments.telchine.body.enhancing,
    legs=augments.telchine.legs.enhancing,
    feet=augments.telchine.feet.enhancing,
    waist="Embla Sash"
  }
  sets.Magic.EnhancingRegen = {
    main="Bolelabunga"
  }
  sets.Magic.Enfeebling = {

  }
  sets.Magic.Geomancy = {
    main="Solstice",
    sub="Genbu's Shield",
    range="Dunna",
    feet="Medium's Sabots",
    neck="Incanter's Torque",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back="Lifestream Cape"
  }


  -- Abilities
  sets.JobAbility = {}

  -- Melee
  sets.WeaponSkill = set_combine(sets.Engaged, {

  })
end

function precast(spell)
  if spell.type == 'JobAbility' then
    equip(sets.JobAbility[spell.english])

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.Precast)

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

  -- Geomancy
  elseif spell.skill == 'Geomancy' then
    equip(sets.Magic.Geomancy)
  end
end

function aftercast(spell)
  if player.status=='Engaged' then
    equip(sets.Engaged)
  else
    equip(sets.Idle)
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
