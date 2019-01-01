include('Modes.lua')

function define_modes()
  Capacity = M(false, 'Capacity Mantle')
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
    main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genbu's Shield",
    range="Dunna",
    head="Jhakri Coronal",
    body="Jhakri Robe",
    hands="Jhakri Cuffs",
    legs="Jhakri Slops",
    feet="Jhakri Pigaches",
    neck="Loricate Torque +1",
    waist="Witful Belt",
    left_ear="Flashward Earring",
    right_ear="Novia Earring",
    left_ring="Fortified Ring",
    right_ring="Vertigo Ring",
    back="Solemnity Cape",
  }
  sets.Engaged = {
  }

  -- Magic
--   sets.Magic = {}
--   sets.Magic.Precast = {
--     main = "Kali",
--     body = "Inyanga Jubbah",
--     hands = { name="Telchine Gloves", augments={'"Fast Cast"+4',}},
--     left_ring = "Prolix Ring",
--     legs = "Kaykaus Tights",
--     back = "Intarabus's Cape",
--     waist = "Witful Belt"
--   }
--   sets.Magic.Healing = {
--     hands={ name="Telchine Gloves", augments={'"Cure" potency +5%',}},
--     legs = "Kaykaus Tights"
--   }
--   sets.Magic.HealingSelf = {

--   }
--   sets.Magic.Enhancing = {

--   }
--   sets.Magic.Enfeebling = {

--   }

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
  maintain_reraise_equip()
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

  maintain_reraise_equip()
end

function aftercast(spell)
  if player.status=='Engaged' then
    equip(sets.Engaged)
  else
    equip(sets.Idle)
  end
  -- if Capacity.value then
  if true then
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

-- If currently wearing an RR earing, keep it on to avoid reseting the countdown
--
function maintain_reraise_equip()
  if player.equipment.rear == 'Reraise Earring' then
    equip({rear = 'Reraise Earring'})
  end
  if player.equipment.lear == 'Reraise Earring' then
    equip({lear = 'Reraise Earring'})
  end
end
