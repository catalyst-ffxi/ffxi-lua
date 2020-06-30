include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'HybridLight', 'HybridHeavy', 'FullPDT'}
end

function define_binds()
  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  send_command('alias g15v2_m1g2 input /equip main "Dojikiri Yasutsuna"; @wait 0.5; input /equip sub "Utu Grip"')
end

function get_sets()

  define_modes()
  define_binds()

  gear = {
    smertrios = {
      ws = { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
      tp = { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
  }

  sets.modes = {}
  sets.modes.Normal = {
    main="Dojikiri Yasutsuna",    -- 10 STP
    sub="Utu Grip",
    ammo="Aurgelmir Orb +1",         -- 4 STP
    head="Flam. Zucchetto +2",    -- 6 STP
    neck="Samurai's Nodowa +1",   -- 11 STP
    lear="Dedition Earring",      -- 8 STP
    rear="Brutal Earring",        -- 1 STP
    body="Ken. Samue +1",
    hands="Wakido Kote +3",       -- 7 STP
    lring="Chirich Ring +1",      -- 6 STP
    rring="Niqmaddu Ring",
    back=gear.smertrios.tp,
    waist="Ioskeha Belt +1",
    legs="Ken. Hakama +1",
    feet="Ryuo Sune-Ate +1"       -- 5 STP
  }                               -- 58 STP
  sets.modes.HybridLight = set_combine(sets.modes.Normal, {
    rring="Defending Ring",       -- 10 DT
  })                              -- 20 PDT
  sets.modes.HybridHeavy = set_combine(sets.modes.Normal, {
    ammo="Staunch Tathlum +1",    -- 3 DT
    neck="Loricate Torque +1",    -- 6 DT
    rring="Defending Ring",       -- 10 DT
  })                              -- 29 PDT
  sets.modes.FullPDT = set_combine(sets.modes.Normal, {
    ammo="Staunch Tathlum +1",    -- 3 DT
    neck="Loricate Torque +1",    -- 6 DT
    lring="Gelatinous Ring +1",   -- 7 PDT
    rring="Defending Ring",       -- 10 DT
    waist="Flume Belt +1",        -- 4 PDT
    left_ear="Genmei Earring"     -- 2 PDT
  })                              -- 42 PDT
  sets.modes.SB = {
    main="Dojikiri Yasutsuna",
    sub="Utu Grip",
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Ken. Samue +1",          -- 12 SB
    hands="Wakido Kote +3",
    legs="Ken. Hakama +1",         -- 10 SB
    feet="Ryuo Sune-Ate +1",       -- 8 SB
    neck="Samurai's Nodowa +1",
    waist="Ioskeha Belt +1",
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Chirich ring +1",   -- 10 SB
    right_ring="Niqmaddu Ring",    -- 5 SB II
    back=gear.smertrios.tp
  }                                -- Auspice: 10 SB

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS['Tachi: Fudo'] = {
    ammo="Knobkierrie",
    head=augments.valorous.mask.ws,
    neck="Samurai's Nodowa +1",
    lear="Thrud Earring",
    rear="Moonshade earring",
    body="Sakonji Domaru +3",
    hands=augments.valorous.mitts.ws,
    lring="Regal Ring",
    rring="Niqmaddu Ring",
    back=gear.smertrios.ws,
    waist="Sailfi Belt +1",
    legs="Wakido Haidate +3",
    feet=augments.valorous.greaves.ws
  }
  sets.WS['Tachi: Shoha'] = {
    ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    neck="Samurai's Nodowa +1",
    lear="Thrud Earring",
    rear="Moonshade earring",
    body="Sakonji Domaru +3",
    hands=augments.valorous.mitts.ws,
    lring="Regal Ring",
    rring="Niqmaddu Ring",
    back=gear.smertrios.ws,
    waist="Sailfi Belt +1",
    legs="Wakido Haidate +3",
    feet="Flam. Gambieras +2"
  }
  sets.WS['Tachi: Ageha'] = {
    ammo="Pemphredo Tathlum",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Flam. Manopolas +2",
    legs="Flamma Dirs +2",
    feet="Flam. Gambieras +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Dignitary's Earring",
    right_ear="Moonshade Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back=gear.smertrios.ws,
  }

  -- Job Abilities
  --
  sets.JAs = {}
  sets.JAs.Meditate = {
    head="Wakido Kabuto +1",
    hands="Sakonji Kote +3",
    back=gear.smertrios.tp
  }
  sets.JAs['Warding Circle'] = {
    head="Wakido Kabuto +1"
  }
  sets.JAs.Provoke = {
    ammo="Sapience Orb",           -- 2
    head="Halitus Helm",           -- 8
    left_ear="Trux Earring",       -- 5
    right_ear="Cryptic Earring",   -- 4
    body="Emet Harness +1",        -- 10
    hands="Kurys Gloves",          -- 9
    left_ring="Supershear Ring",   -- 5
    right_ring="Eihwaz Ring",      -- 5
    waist="Kasiri Belt",           -- 3
  }

  -- Magic
  --
  sets.FastCast = {
    ammo="Sapience Orb",                -- 2
    neck="Orunmila's Torque",           -- 5
    hands="Leyline Gloves",             -- 7
    lear="Loquacious earring",          -- 2
    rear="Etiolation Earring",          -- 1
    rring="Weatherspoon Ring +1",                 -- 2
  }
  sets.Doom = {
    neck="Nicander's Necklace",
    left_ring="Purity Ring",
    right_ring="Blenmot's Ring",
    waist="Gishdubar Sash"
  }
end

function precast(spell)
  if spell.type == 'WeaponSkill' then
    equip(set_for_ws(spell.english))
  elseif spell.type == 'JobAbility' then
    if sets.JAs[spell.english] then
      equip(sets.JAs[spell.english])
    end
    if spell.english == 'Third Eye' and not (buffactive['Seigan']) then
      cast_delay(1.3)
      send_command('@input /ja "Seigan" <me>')
    end
  elseif spell.action_type == 'Magic' then
    equip(sets.FastCast)
    if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
      send_command('@wait 3.3; cancel 66; cancel 444; cancel 445')
    end
  elseif spell.english == 'Spectral Jig' then
    cast_delay(0.5)
    send_command('@cancel 71;')
  elseif spell.english == 'Ranged' then
    equip(sets.JAs.ranged)
  end
end

function midcast(spell)
end

function aftercast(spell)
  equip_set_for_current_mode()
end

function status_change(new, old)
  if new == 'Engaged' then
    equip_set_for_current_mode()
  end
end

function buff_change(buff, gain, bufftable)
  if buff:lower() == "doom" then
    if gain then
      equip(sets.Doom)
      -- send_command("input /party Help, I'm DOOMED!")
      -- send_command('input /item "Holy Water" <me>')
    else
      equip_set_for_current_mode()
      -- send_command('input /party Doom OFF!')
    end
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
    equip_set_for_current_mode()
  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
      equip_set_for_current_mode()
    end
  end
end

function set_for_engaged()
  local set = sets.modes[PrimaryMode.current]
  if buffactive.Doom then
    set = set_combine(set, sets.Doom)
  end
  return set
end

function set_for_ws(named)
  if sets.WS[named] then
    return sets.WS[named]
  else
    return sets.WS['Tachi: Fudo']
  end
end

function equip_set_for_current_mode()
  equip(set_for_engaged())
end
