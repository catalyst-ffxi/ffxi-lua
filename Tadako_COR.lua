include('Modes.lua')
include('augments_tadako.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'Hybrid'}
  Capacity = M(false, 'Capacity Mantle')
end

function define_aliases()
  send_command("bind ^f1 gs c cycle PrimaryMode")
end

function get_sets()
  define_modes()
  define_aliases()

  gear = {
    camulus = {
      tp={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},
      ws={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
      rangedTp={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
    }
  }

  sets.Idle = {
    main="Naegling",
    sub="Gleti's Knife",
    ranged="Molybdosis",
    ammo="Orichalc. Bullet",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Carmine Cuisses +1",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Flashward Earring",
    right_ear="Etiolation Earring",
    left_ring="Gelatinous Ring +1",
    right_ring="Purity Ring",
    back=gear.camulus.tp
  }

  sets.Engaged = {}
  sets.Engaged.Normal = {
    main="Naegling",
    sub="Gleti's Knife",
    ranged="Molybdosis",
    ammo="Orichalc. Bullet",
    head="Blistering Sallet +1",
    body="Adhemar Jacket",
    hands="Nyame Gauntlets",
    legs="Meg. Chausses +2",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Sailfi Belt +1",
    left_ear="Digni. Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back=gear.camulus.tp
  }
  sets.Engaged.Hybrid = {
    main="Naegling",
    sub="Gleti's Knife",
    ranged="Molybdosis",
    ammo="Orichalc. Bullet",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Meg. Chausses +2",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Sailfi Belt +1",
    left_ear="Digni. Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back=gear.camulus.tp
  }

  -- Weapon Skills
  sets.WS = {}
  sets.WS['Last Stand'] = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear="Moonshade earring",
    left_ring="Mummu Ring",
    right_ring="Dingir Ring",
    back=gear.camulus.ws
  }
  sets.WS['Leaden Salute'] = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    left_ring="Ilabrat Ring",
    right_ring="Dingir Ring",
    back=gear.camulus.ws
  }
  sets.WS['Wildfire'] = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    left_ring="Ilabrat Ring",
    right_ring="Dingir Ring",
    back=gear.camulus.ws
  }
  sets.WS['Savage Blade'] = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    left_ear="Ishvara Earring",
    right_ear="Moonshade Earring",
    left_ring="Shukuyu Ring",
    right_ring="Petrov Ring",
    back=gear.camulus.ws
  }

  -- Abilities
  sets.JA = {}
  sets.JA.PhantomRoll = {
    ranged="Compensator",
    head="Lanun Tricorne",
    neck="Regal Necklace",
    hands="Chasseur's Gants +2",
    right_ring="Luzaf's Ring",
    back="Camulus's Mantle",
  }
  sets.JA['Snake Eye'] = { legs = "Lanun Trews" }
  sets.JA['Random Deal'] = { body = "Commodore Frac" }
  sets.JA['Wild Card'] = { feet = "Lanun Bottes" }

  sets.JA.QuickDraw = { -- MACC+ Gear
    ammo="Orichalc. Bullet",
    head="Mummu Bonnet +2",
    body="Mummu Jacket +2",
    hands="Mummu Wrists +2",
    legs="Mummu Kecks +2",
    feet="Mummu Gamash. +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Gwati Earring",
    right_ear="Digni. Earring",
    left_ring="Weather. Ring",
    right_ring="Stikini Ring",
    back=gear.camulus.ws
  }

  -- Ranged Attacks
  sets.Preshot = {
    head=augments.taeon.head.snapshot,
    body="Pursuer's Doublet",
    hands=augments.taeon.hands.snapshot,
    legs="Adhemar Kecks",
    feet="Meg. Jam. +2",
    -- waist="Yemaya Belt",
    -- back="Camulus's Mantle"
  }
  sets.Ranged = {
    head="Meghanada Visor +2",
    body="Mummu Jacket +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Iskur Gorget",
    waist="Eschan Stone",
    left_ear="Suppanomimi",
    right_ear="Digni. Earring",
    left_ring="Mummu Ring",
    right_ring="Dingir Ring",
    back=gear.camulus.rangedTp
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.Precast = {
    body="Samnuha Coat",
    hands="Leyline Gloves",
    neck="Orunmila's torque",
    left_ring="Weatherspoon Ring",
    right_ring="Kishar Ring",
    left_ear="Loquacious earring",
    right_ear="Etiolation Earring"
  }
  sets.Magic.SpellInterrupt = {
  }
end

function precast(spell)
  if spell.type == 'CorsairRoll' then
    equip(sets.JA.PhantomRoll)

  elseif spell.english == "Double-Up" then
    equip({ rring="Luzaf's Ring" })

  elseif spell.type == 'CorsairShot' then
    equip(sets.JA.QuickDraw)

  elseif spell.type == 'JobAbility' then
    equip(sets.JA[spell.english])

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
  if player.status=='Engaged' then
    equip(sets.Engaged[PrimaryMode.current])
  else
    equip(sets.Idle)
  end
end

function status_change(new, old)
  if new == 'Resting' then
    equip(sets.Resting)
  elseif new == 'Engaged' then
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
    equip(sets.Engaged[PrimaryMode.current])
  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
      equip(sets.Engaged[mode.current])
    end
  elseif command == 'idle' then
    equip(sets.Idle)
  end
end
