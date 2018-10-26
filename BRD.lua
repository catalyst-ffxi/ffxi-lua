include('Modes.lua')

function define_modes()
  Capacity = M(false, 'Capacity Mantle')
  DummySongs = S{"Swift Etude", "Bewitching Etude", "Enchanting Etude", "Warding Round"}
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
    main = "Kali",
    sub = "Genbu's Shield",
    -- ranged = "Gjallarhorn",
    head = "Inyanga Tiara +1",
    neck = "Loricate Torque +1",
    left_ear = "Flashward Earring",
    right_ear = "Etiolation Earring",
    body = "Inyanga Jubbah +1",
    hands = "Inyanga Dastanas +1",
    left_ring = "Fortified Ring",
    right_ring = "Inyanga Ring",
    back = "Intarabus's Cape",
    -- waist = "Witful Belt",
    waist = "Fucho-no-Obi",
    legs = "Inyanga Shalwar +2",
    feet = "Inyanga Crackows +1"
  }
  sets.Engaged = {
    -- main="Skinflayer",
    main = "Kali",
    sub="Genbu's Shield",
    -- ranged="Gjallarhorn",
    head="Aya. Zucchetto +1",
    body="Ayanmo Corazza",
    hands="Aya. Manopolas +1",
    legs="Ayanmo Cosciales",
    feet="Aya. Gambieras +1",
    neck="Sanctity Necklace",
    waist="Windbuffet Belt",
    left_ear="Flashward Earring",
    right_ear="Brutal Earring",
    left_ring="Ayanmo Ring",
    right_ring="Enlivened Ring",
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.Precast = {
    main = "Kali",
    body = "Inyanga Jubbah +1",
    hands = { name="Telchine Gloves", augments={'"Fast Cast"+4',}},
    left_ring = "Weatherspoon Ring",
    right_ring = "Prolix Ring",
    left_ear = "Loquacious earring",
    right_ear = "Etiolation Earring",
    legs = "Kaykaus Tights",
    back = "Intarabus's Cape",
    waist = "Witful Belt"
  }
  sets.Magic.Healing = {
    hands={ name="Telchine Gloves", augments={'"Cure" potency +5%',}},
    legs = "Kaykaus Tights"
  }
  sets.Magic.HealingSelf = {
    waist="Chuq'aba belt"
  }
  sets.Magic.Cursna = {
    lring = "Ephedra Ring",
    rring = "Ephedra Ring",
    feet = "Vanya Clogs"
  }
  sets.Magic.Enhancing = {

  }
  sets.Magic.Enfeebling = {
    main = "Kali",
    -- range="Gjallarhorn",
    head="Inyanga Tiara +1",
    body="Fili Hongreline",
    hands="Inyanga Dastanas +1",
    legs="Fili Rhingrave",
    feet="Inyan. Crackows +1",
    neck="Moonbow Whistle",
    left_ear="Gwati Earring",
    right_ear="Hermetic Earring",
    left_ring="Weatherspoon Ring",
    right_ring="Inyanga Ring",
    waist="Porous Rope",
    back="Intarabus's Cape"
  }

  -- Songs
  sets.Songs = {}
  sets.Songs.Precast = set_combine(sets.Magic.Precast, {
    head = "Fili Calot",
    neck = "Aoidos' Matinee",
    feet = { name="Telchine Pigaches", augments={'Song spellcasting time -7%',}}
  })
  sets.Songs.Dummy = {
    ranged = "Terpander",
    neck = "Loricate Torque +1",
    body = "Inyanga Jubbah +1"
  }
  sets.Songs.Potency = {
    main="Kali",
    ranged="Gjallarhorn",
    neck="Moonbow Whistle",
    body="Fili Hongreline",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2"
  }
  sets.Songs.Accuracy = {
    main="Kali",
    ranged="Gjallarhorn",
    head="Inyanga Tiara +1",
    body="Fili Hongreline",
    hands="Brioso Cuffs +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle",
    left_ear="Gwati Earring",
    right_ear="Hermetic Earring",
    left_ring="Weatherspoon Ring",
    right_ring="Inyanga Ring",
    waist="Porous Rope",
    back="Intarabus's Cape",
  }
  sets.Songs.List = {}
  sets.Songs.List.Ballad = { legs = "Fili Rhingrave" }
  sets.Songs.List.Elegy = { }
  sets.Songs.List.Finale = {}
  sets.Songs.List.Lullaby = { hands = "Brioso Cuffs +2" }
  sets.Songs.List.Madrigal = { head = "Fili Calot" }
  sets.Songs.List.March = { hands = "Fili Manchettes" }
  sets.Songs.List.Mambo = { }
  sets.Songs.List.Mazurka = { }
  sets.Songs.List.Minne = { }
  sets.Songs.List.Minuet = { body = "Fili Hongreline" }
  sets.Songs.List.Paeon = { }
  sets.Songs.List.Scherzo = { }
  -- feet = "Fili Cothurnes"
  sets.Songs.List.Threnody = { }

  -- Abilities
  sets.JobAbility = {}

  -- Melee
  sets.WeaponSkill = set_combine(sets.Engaged, {

  })
end

function precast(spell)
  if spell.type == 'JobAbility' then
    equip(sets.JobAbility[spell.english])

  elseif spell.type == 'BardSong' then
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
    -- add_to_chat(122, spell.english)
    if DummySongs:contains(spell.english) then
      equip(sets.Songs.Dummy)
    elseif spell.target.type == 'MONSTER' then
      equip(sets.Songs.Accuracy)
    else
      equip(sets.Songs.Potency)
    end
    for key, gear in pairs(sets.Songs.List) do
      if string.find(spell.english, key) then
        equip(gear)
        break
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
  if player.status=='Engaged' then
    equip(sets.Engaged)
  elseif player.in_combat then
  -- else
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
