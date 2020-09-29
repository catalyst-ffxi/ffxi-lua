include('Modes.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'FullDD', 'Hybrid'}
end

function define_aliases()
end

function get_sets()
  define_modes()
  define_aliases()

  gear = {}

  -- Modes
  sets.Idle = {}
  sets.Engaged = {}
  sets.Engaged.FullDD = {
    main="Aeneas",
    sub="Taming Sari",
    ammo="Aurgelmir Orb",
    head="Skormoth Mask",
    body="Adhemar Jacket",
    hands=augments.herc.hands.tp,
    legs="Samnuha Tights",
    feet=augments.herc.feet.tp,
    neck="Iskur Gorget",
    waist="Sailfi Belt +1",
    left_ear="Suppanomimi",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Hetairoi Ring",
    back="Senuna's mantle",
  }
  sets.Engaged.Hybrid = {
    main="Aeneas",
    sub="Taming Sari",
    ammo="Aurgelmir Orb",
    head="Skormoth Mask",
    body="Adhemar Jacket",
    hands=augments.herc.hands.tp,  -- 2 PDT
    legs="Meg. Chausses +2",       -- 6 PDT
    feet=augments.herc.feet.tp,    -- 2 PDT
    neck="Loricate Torque +1",     -- 6 DT
    waist="Sailfi Belt +1",
    left_ear="Suppanomimi",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Moonbeam Ring",    -- 4 DT
    back="Senuna's mantle",        -- 10 PDT
  }                                -- 30 PDT

  -- Magic
  sets.Magic = {}
  sets.Magic.Precast = {
    body="Samnuha Coat",
    hands="Leyline Gloves",
    neck="Orunmila's torque",
    left_ring="Weatherspoon Ring",
    left_ear="Loquacious earring",
    right_ear="Etiolation Earring"
  }
  sets.Magic.SpellInterrupt = {
    hands="Herculean Gloves",
    legs="Meg. Chausses +2",
    feet="Herculean Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ring="Gelatinous Ring +1",
    right_ring="Moonbeam Ring",
    back="Senuna's mantle",
  }

  -- Abilities
  sets.JobAbility = {}

  -- Melee
  sets.WS = {}
  sets.WS.Rudra = {
    head=augments.herc.head.ws,
    body="Meg. Cuirie +1",
    hands="Meg. Gloves +2",
    legs=augments.herc.legs.ws,
    feet=augments.herc.feet.ws,
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Apate Ring",
    back="Senuna's mantle",
  }
  sets.WS.Evisceration = {
    head="Adhemar bonnet",
    body="Meg. Cuirie +1",
    hands="Meg. Gloves +2",
    legs=augments.herc.legs.crit,
    feet=augments.herc.feet.crit,
    neck="Soil Gorget",
    waist="Shadow Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Begrudging Ring",
    back="Senuna's mantle",
  }
end

function precast(spell)
  if spell.type == 'JobAbility' then
    equip(sets.JobAbility[spell.english])

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.Precast)

  elseif spell.type == 'WeaponSkill' then
    equip(sets.WS[spell.english] or sets.WS.Rudra)

  elseif spell.english == "Ranged" then
    equip(sets.Preshot)
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
  if spell.english == 'Ranged' then
    equip(sets.Ranged)

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.SpellInterrupt)
  end
end

function aftercast(spell)
  if player.status == 'Engaged' then
    equip(sets.Engaged[PrimaryMode.current])
  else
    equip(sets.Idle)
  end
end

function status_change(new, old)
  if new == 'Engaged' then
    equip(sets.Engaged[PrimaryMode.current])
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
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
      equip(sets.Engaged[mode.current])
    end
  elseif command == 'idle' then
    equip(sets.Idle)
  elseif command == 'run' then
    equip(sets.MoveSpeed)
  end
end
