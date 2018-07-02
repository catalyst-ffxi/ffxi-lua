include('Modes.lua')

function define_modes()
  Capacity = M(false, 'Capacity Mantle')
  DummySongs = S{"Army's Paeon","Gold Capriccio","Shining Fantasia","Herb Pastoral","Goblin Gavotte"}
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
    -- main = "Kali"
    -- sub = ""
  }
  sets.Engaged = {

  }

  -- Magic
  sets.Magic = {}
  sets.Magic.Precast = {
    back = "Swith Cape"
  }
  sets.Magic.Healing = {

  }
  sets.Magic.HealingSelf = {

  }
  sets.Magic.Enhancing = {

  }
  sets.Magic.Enfeebling = {

  }

  -- Songs
  sets.Songs = {}
  sets.Songs.PreCast = set_combine(sets.Magic.Precast, {

  })
  sets.Songs.Dummy = {
    main = "Terpander"
  }
  sets.Songs.Potency = {
    -- main = "Gjallarhorn" -- TODO
    main = "Eminent Flute",
    neck = "Moonbow Whistle"
  }
  sets.Songs.List = {}
  sets.Songs.List.Finale = {}
  sets.Songs.List.Lullaby = {}
  sets.Songs.List.Madrigal = {}
  sets.Songs.List.March = {}
  sets.Songs.List.Minuet = {}
  sets.Songs.List.Scherzo = {}

  -- Abilities
  sets.JobAbility = {}

  -- Melee
  sets.WeaponSkill = set_combine(sets.Engaged, {

  })
end

function precast(spell)
  if spell.type == 'JobAbility' then
    equip(sets.JobAbility[spell.english])

  if spell.type == 'BardSong' then
    equip(sets.Songs.Precast)

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

  -- Bard Songs
  if spell.type == 'BardSong' then
    if DummySongs:contains(spell.english) then
      equip(sets.Songs.Dummy)
    else
      equip(sets.Songs.Pontency)
      for key, gear in pairs(sets.Songs.List) do
        if string.find(spell.english, k) then
          equip(gear)
          break
        end
      end
    end

  -- Cures
  elseif spell.skill == 'Healing Magic' then
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
  if player.in_combat then
    equip(sets.Idle)
  end
  if Capacity.value then
    equip({back = "Mecistopins Mantle"})
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
    equip(sets.Idle)
  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
    end
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
