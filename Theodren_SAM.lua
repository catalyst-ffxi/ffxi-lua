include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'HybridLight', 'HybridHeavy', 'Accuracy'}
  TreasureHunter = M(false, 'Treasure Hunter')
end

function define_binds()
  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  send_command('alias g15v2_m1g2 input /equip main "Dojikiri Yasutsuna"; @wait 0.5; input /equip sub "Utu Grip"')
  send_command("alias g15v2_m1g3 gs c cycle TreasureHunter")
end

function get_sets()

  define_modes()
  define_binds()

  gear = {
    valorous = {
      mask = {
        ws = { name="Valorous Mask", augments={'Accuracy+15','Weapon skill damage +3%','STR+11','Attack+14',}},
        treasure = { name="Valorous Mask", augments={'INT+2','Pet: Attack+5 Pet: Rng.Atk.+5','"Treasure Hunter"+2','Accuracy+5 Attack+5',}},
      },
      mitts = {
        ws = { name="Valorous Mitts", augments={'Weapon skill damage +4%','STR+11','Accuracy+1','Attack+11',}},
        treasure = { name="Valorous Mitts", augments={'Attack+5','Pet: STR+6','"Treasure Hunter"+2','Accuracy+14 Attack+14','Mag. Acc.+9 "Mag.Atk.Bns."+9',}}
      },
      greaves = {
        ws = { name="Valorous Greaves", augments={'Weapon skill damage +3%','STR+14','Accuracy+3',}}
      }
    },
    smertrios = {
      ws = { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
      tp = { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
  }

  sets.modes = {}
  sets.modes.Normal = {
    main="Dojikiri Yasutsuna",    -- 10 STP
    sub="Utu Grip",
    ammo="Aurgelmir Orb",         -- 4 STP
    head="Flam. Zucchetto +2",    -- 6 STP
    neck="Samurai's Nodowa +1",   -- 11 STP
    lear="Dedition Earring",      -- 8 STP
    rear="Brutal Earring",        -- 1 STP
    body="Ken. Samue +1",
    hands="Wakido Kote +3",       -- 7 STP
    lring="Flamma Ring",          -- 5 STP
    rring="Niqmaddu Ring",
    back=gear.smertrios.tp,
    waist="Ioskeha Belt +1",
    legs="Ken. Hakama +1",
    feet="Ryuo Sune-Ate +1"       -- 5 STP
  }                               -- 57 STP
  sets.modes.HybridLight = set_combine(sets.modes.Normal, {
    rring="Defending Ring",       -- 10 DT
  })                              -- 20 PDT
  sets.modes.HybridHeavy = set_combine(sets.modes.Normal, {
    ammo="Staunch Tathlum +1",    -- 3 DT
    neck="Loricate Torque +1",    -- 6 DT
    lring="Gelatinous Ring +1",   -- 7 PDT
    rring="Defending Ring",       -- 10 DT
    waist="Flume Belt +1"         -- 4 PDT
  })                              -- 40 PDT
  sets.modes.Accuracy = set_combine(sets.modes.Normal, {
    lear="Telos Earring",
    rear="Dignitary's Earring",
    rring="Regal Ring",
    feet="Flam. Gambieras +2"
  })

  -- Modifiers
  sets.TreasureHunter = {
    head=augments.valorous.mask.treasure,
    hands=augments.valorous.mitts.treasure,
    waist="Chaac belt"
  }

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
    rring="Karieyh Ring +1",
    back=gear.smertrios.ws,
    waist="Fotia Belt",
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
    lring="Flamma Ring",
    rring="Niqmaddu Ring",
    back=gear.smertrios.ws,
    waist="Fotia Belt",
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
    left_ring="Flamma Ring",
    right_ring="Karieyh Ring +1",
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
    rring="Rahab Ring",                -- 2
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
  if TreasureHunter.value then
    set = set_combine(set, sets.TreasureHunter)
  end
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
