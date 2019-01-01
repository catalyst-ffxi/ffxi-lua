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
    ammo="Jukukik Feather",
    main={ name="Enchufla", augments={'DMG:+15','STR+15','Accuracy+10',}},
    sub={ name="Skinflayer", augments={'Crit.hit rate+2','DEX+12','Accuracy+13','Attack+13','DMG:+6',}},
    head="Mummu Bonnet",
    body="Adhemar Jacket",
    hands="Mummu Wrists",
    legs="Mummu Kecks",
    feet="Mummu Gamashes +1",
    neck="Loricate Torque +1",
    waist="Windbuffet Belt",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Mummu Ring",
    right_ring="Fortified Ring",
    back="Solemnity Cape",
  }
  sets.Engaged = {
    ammo="Jukukik Feather",
    main={ name="Enchufla", augments={'DMG:+15','STR+15','Accuracy+10',}},
    sub={ name="Skinflayer", augments={'Crit.hit rate+2','DEX+12','Accuracy+13','Attack+13','DMG:+6',}},
    head="Mummu Bonnet",
    body="Adhemar Jacket",
    hands="Mummu Wrists",
    legs="Mummu Kecks",
    feet="Mummu Gamashes +1",
    neck="Sanctity Necklace",
    waist="Windbuffet Belt",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Mummu Ring",
    right_ring="Fortified Ring",
    back="Solemnity Cape",
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.Precast = {
    left_ring = "Prolix Ring",
    waist = "Witful Belt"
  }
  sets.Magic.Healing = {
  }
  sets.Magic.HealingSelf = {

  }
  sets.Magic.Enhancing = {

  }
  sets.Magic.Enfeebling = {

  }

  -- Abilities
  sets.JobAbility = {}

  -- Melee
  sets.WeaponSkill = {
    ammo="Jukukik Feather",
    head="Mummu Bonnet",
    body="Mummu Jacket",
    hands="Mummu Wrists",
    legs="Mummu Kecks",
    feet="Mummu Gamash. +1",
    neck="Sanctity Necklace",
    waist="Windbuffet Belt",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Mummu Ring",
    right_ring="Ramuh Ring",
    back="Solemnity Cape",
  }
  sets.WeaponSkill['Evisceration'] = {

  }
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
    -- equip(sets.Idle)
  end
  -- if Capacity.value then
--   if true then
--     equip({back = "Aptitude Mantle +1"})
--   end
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
