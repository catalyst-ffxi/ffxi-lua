include('Modes.lua')
include('augments.lua')
include('utils.lua')

function define_modes()
  NukingMode = M{['description'] = 'Nuking Mode', 'MagicBurst', 'FreeNuke'}
  Element = M{['description'] = 'Primary Element', 'Thunder', 'Blizzard', 'Fire', 'Aero', 'Water', 'Stone'}
end

function define_aliases()
  send_command("bind ^f1 gs c cycle NukingMode")
  send_command("alias auto_aspir gs c auto_aspir")
end

function get_sets()

  define_modes()
  define_aliases()

  gear = {
    taranus = {
      nuke={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
      fastCast={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
    },
    stikini = {
      left = { name="Stikini Ring +1", bag="wardrobe1" },
      right = { name="Stikini Ring +1", bag="wardrobe2" }
    }
  }

  -- Mode Sets
  --
  sets.Idle = {
    main="Mpaca's Staff",
    sub="Enki Strap",
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Wicce Coat +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Wicce Sabots +3",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Odnowa Earring +1",
    right_ear="Etiolation Earring",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back=gear.taranus.nuke
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.FastCast = {
    main="Mpaca's Staff",          -- 5
    sub="Enki Strap",
    ammo="Sapience Orb",           -- 2
    head="Amalric Coif +1",        -- 11
    body="Agwu's Robe",            -- 8
    hands="Agwu's Gages",          -- 6
    legs="Agwu's Slops",           -- 7
    feet="Amalric Nails +1",       -- 6
    neck="Orunmila's Torque",      -- 5
    waist="Embla Sash",            -- 5
    left_ear="Malignance Earring", -- 4
    right_ear="Loquacious earring",-- 2
    left_ring="Kishar Ring",       -- 4
    back=gear.taranus.fastCast,    -- 10
  }                                -- 75 fc
  sets.Magic.QuickCast = set_combine(sets.Magic.FastCast, {
    right_ring="Weatherspoon Ring +1",-- 6 FC 4 QC
  })
  sets.Magic.SpellInterrupt = {}
  sets.Magic.Dark = {
    ammo="Pemphredo Tathlum",
    head="Amalric Coif +1",
    body="Wicce Coat +3",
    hands="Agwu's Gages",
    legs="Spaekona's Tonban +2",
    feet="Wicce Sabots +3",
    neck="Erra Pendant",
    waist="Sacro Cord",
    lear="Digni. Earring",
    rear="Regal Earring",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back=gear.taranus.nuke
  }
  sets.Magic.DrainAspir = set_combine(sets.Magic.Dark, {
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    feet="Agwu's Pigaches"
  })
  sets.Magic.Elemental = {}
  sets.Magic.Elemental.FreeNuke = {
    ammo="Pemphredo Tathlum",
    head="Wicce Petasos +3",
    body="Wicce Coat +3",
    hands="Agwu's Gages",
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck="Src. Stole +2",
    waist="Sacro Cord",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Metamorph Ring +1",
    right_ring="Freke Ring",
    back=gear.taranus.nuke
  }
  sets.Magic.Elemental.MagicBurst = {
    ammo="Pemphredo Tathlum",
    head="Ea Hat +1",           -- MB +7 | MB II +7
    body="Wicce Coat +3",       --       | MB II +5
    hands="Agwu's Gages",       -- MB +8 | MB II +5
    legs="Wicce Chausses +3",   -- MB +15
    feet="Wicce Sabots +3",     --
    neck="Src. Stole +2",       -- MB +6
    waist="Sacro Cord",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Metamorph Ring +1",
    right_ring="Freke Ring",
    back=gear.taranus.nuke      -- MB +5
  }                             -- MB +41| MB II +17
  sets.Magic.ElementalDebuff = {
    ammo="Pemphredo Tathlum",
    head="Wicce Petasos +2",
    body="Wicce Coat +3",
    hands="Archmage's Gloves +3",
    legs="Archmage's Tonban +3",
    feet="Archmage's Sabots +3",
    neck="Src. Stole +2",
    waist="Sacro Cord",
    left_ear="Malignance Earring",
    right_ear="Crep. Earring",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back=gear.taranus.nuke
  }
  sets.Magic.Enfeebling = {
    ammo="Pemphredo Tathlum",
		head="Wicce Petasos +2",
		body="Wicce Coat +3",
    hands="Agwu's Gages",
    legs="Wicce Chausses +3",
    feet="Agwu's Pigaches",
    neck="Src. Stole +2",
    waist="Sacro Cord",
    left_ear="Malignance Earring",
    right_ear="Crep. Earring",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back=gear.taranus.nuke
  }

  -- Enhancing Magic
  --
  sets.Magic.Enhancing = {
    head="Telchine Cap",
    body=augments.telchine.body.duration,
    hands="Telchine Gloves",
    legs="Telchine Braconi",
    feet="Telchine Pigaches",
    waist="Embla Sash"
  }
  sets.Magic.Refresh = set_combine(sets.Magic.Enhancing, {
    head="Amalric Coif +1",
    waist="Gishdubar sash"
  })
  sets.Magic.Stoneskin = set_combine(sets.Magic.Enhancing, {
    neck="Nodens Gorget",
    waist="Siegel Sash"
  })
  sets.Magic.Healing = {
    ammo="Pemphredo Tathlum",
    head="Vanya Hood",
    body="Vanya Robe", -- *
    hands="Telchine Gloves",
    legs="Vanya Slops", -- *
    feet="Vanya Clogs",
    neck="Incanter's Torque",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Mendi. Earring",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back="Solemnity Cape" -- *
  }
  sets.Magic.HealingSelf = set_combine(sets.Magic.Healing, {
    neck="Phalaina Locket",      -- 4% self
    left_ring='Kunaji Ring',     -- 5% self
    waist="Gishdubar Sash"       -- 10% self
  })

  -- Melee
  sets.Engaged = {
    main="Mpaca's Staff",
    sub="Enki Strap",
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Petrov Ring",
    right_ring="Chirich Ring +1",
    back="Taranus's Cape"
  }
  sets.WS = {}
  sets.WS.Myrkr = {
    ammo="Strobilus",
    head="Pixie Hairpin +1",
    body="Ea Houppe. +1",
    hands="Agwu's Gages",
    legs="Psycloth Lappas",
    feet="Amalric Nails +1",
    neck="Dualism Collar +1",
    waist="Shinjutsu-no-Obi +1",
    left_ear="Moonshade Earring",
    right_ear="Etiolation Earring",
    left_ring="Metamorph Ring +1",
    right_ring="Mephitas's Ring +1",
    back="Bane Cape"
  }
  sets.WS['Black Halo'] = {
    -- ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring="Metamorph Ring +1",
    right_ring="Epaminondas's Ring",
    back="Taranus's Cape"
  }
  sets.WS.Vidohunir = {
    ammo="Pemphredo Tathlum",
    head="Wicce Petasos +3",
    body="Wicce Coat +3",
    hands="Wicce Gloves +3",
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck="Src. Stole +2",
    waist="Sacro Cord",
    left_ear="Malignance Earring",
    right_ear="Moonshade Earring",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back=gear.taranus.nuke
  }

  -- JAs
  sets.JAs = {}
  sets.JAs.Manafont = { body="Archmage's Coat" }
  sets.JAs['Mana Wall'] = { feet="Wicce Sabots +3" }
end

function precast(spell)
  precast_cancelations(spell)

  if spell.action_type == 'Magic' then
    if not (spell.skill == 'Elemental Magic' and NukingMode.current == 'MagicBurst') then
      equip(sets.Magic.QuickCast)
    else
      equip(sets.Magic.FastCast)
    end

  elseif sets.JAs[spell.english] then
    equip(sets.JAs[spell.english])

  elseif spell.type == 'WeaponSkill' then
    if sets.WS[spell.english] then
      equip(sets.WS[spell.english])
    end
  end

end

function precast_cancelations(spell)
  if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
    send_command('@wait 0.4; cancel 66; cancel 444; cancel 445')

  elseif string.find(spell.english, 'storm') and buffactive['Light Arts'] and not buffactive['Accession'] then
    cast_delay(1.3)
    send_command('@input /ja "Accession" <me>')

  elseif spell.english == 'Spectral Jig' then
    cast_delay(0.25)
    send_command('@cancel 71;')
  end
end

function midcast(spell)
  eng = spell.english

  if sets.Magic[spell.name] then
    equip(sets.Magic[spell.name])

  elseif string.find(eng, 'Cure') and spell.target.type == 'SELF' then
    equip(sets.Magic.HealingSelf)
    if get_total_element_intensity('Light') > 0 then
      equip({waist="Hachirin-no-Obi"})
    end

  elseif string.find(eng, 'Cure') or string.find(eng, 'Curaga') then
    equip(sets.Magic.Healing)
    if get_total_element_intensity('Light') > 0 then
      equip({waist="Hachirin-no-Obi"})
    end

  elseif string.find(eng, 'Raise') then
    equip(sets.Magic.FastCast)

  elseif spell.skill == 'Enhancing Magic' then
    equip(sets.Magic.Enhancing)

  elseif spell.skill == 'Enfeebling Magic' then
    equip(sets.Magic.Enfeebling)

  elseif spell.skill == 'Dark Magic' then
    if string.find(spell.english, 'Drain') or string.find(spell.english, 'Aspir') then
      equip(sets.Magic.DrainAspir)
    else
      equip(sets.Magic.Dark)
    end

  elseif S{'Shock', 'Rasp', 'Choke', 'Frost', 'Burn', 'Drown'}:contains(eng) then
    equip(sets.Magic.ElementalDebuff)

  elseif spell.skill == 'Elemental Magic' then
    equip(sets.Magic.Elemental[NukingMode.current])
    equip_elemental_waist(spell)
    if player.mp < 500 then
      equip({body = "Spaekona's Coat +3"})
    end
  
  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.SpellInterrupt)
  end
end

function chat(msg)
  add_to_chat(122, msg)
end

function aftercast(spell)
  if player.status == 'Engaged' then
    equip(sets.Engaged)
  else
    equip(sets.Idle)
  end
end

function status_change(new, old)
  if new == 'Resting' then
    equip(sets.Idle)
  elseif new == 'Engaged' then
    equip(sets.Engaged)
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
      if mode.description == 'Primary Mode' then
        equip(sets.modes[mode.current])
      elseif mode.description == 'Primary Element' then
        define_aliases()
      end
    end
  elseif command == 'idle' then
    equip(sets.Idle)
  elseif command == 'auto_aspir' then
    auto_aspir()
  end
end

function auto_aspir()
  local spell_recasts = windower.ffxi.get_spell_recasts()
  local aspir_1 = spell_recasts[247]
  local aspir_2 = spell_recasts[248]
  local aspir_3 = spell_recasts[881]

  if aspir_3 == 0 then
    send_command('@input /ma "Aspir III" <t>')
  elseif aspir_2 == 0 then
    send_command('@input /ma "Aspir II" <t>')
  elseif aspir_1 == 0 then
    send_command('@input /ma "Aspir" <t>')
  end
end
