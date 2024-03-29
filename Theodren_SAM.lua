include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')
include('organizer-lib')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode',
    'FullDD', 'HybridLight', 'HybridHeavy',
    -- 'HybridSB'
    -- 'Tatenashi'
  }
  WeaponMode = M{['description'] = 'Weapon Mode',
    'Dojikiri Yasutsuna',
    'Shining One',
    -- 'Soboro Sukehiro',
    -- 'Amanomurakumo'
  }
end

function define_aliases()
  send_command("bind ^f1 gs c cycle PrimaryMode")
  send_command("bind ^f2 gs c cycle WeaponMode")
end

function get_sets()

  define_modes()
  define_aliases()

  gear = {
    smertrios = {
      ws = { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
      tp = { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
  }

  sets.Idle = {
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",     -- 3 DT
    head="Wakido Kabuto +3",       -- Regain
    body="Nyame Mail",             -- 9 DT
    hands="Nyame Gauntlets",       -- 7 DT
    legs="Nyame Flanchard",        -- 8 DT
    feet="Nyame Sollerets",        -- 7 DT
    neck="Warder's Charm +1",      -- Resists
    waist="Flume Belt +1",         -- 4 PDT
    left_ear="Eabani Earring",     -- 8 Meva
    right_ear="Odnowa Earring +1", -- 3 DT
    left_ring="Gelatinous Ring +1",-- 7 PDT
    right_ring="Purity Ring",      -- 10 Meva
    back=gear.smertrios.tp         -- 10 PDT
  }

  sets.modes = {}
  sets.modes.FullDD = {
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Kasuga Domaru +3",
    hands="Tatena. Gote +1",
    legs="Kasuga Haidate +3",
    feet="Ryuo Sune-Ate +1",
    neck="Sam. Nodowa +2",
    waist="Sailfi Belt +1",
    left_ear="Schere Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Niqmaddu Ring",
    back=gear.smertrios.tp
  }
  sets.modes.HybridLight = {
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Kasuga Kabuto +3",       -- 9 DT
    body="Kasuga Domaru +3",       -- 14 DT
    hands="Tatena. Gote +1",
    legs="Kasuga Haidate +3",      -- 11 DT
    feet="Ryuo Sune-Ate +1",
    neck="Sam. Nodowa +2",
    waist="Sailfi Belt +1",
    left_ear="Schere Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Niqmaddu Ring",
    back=gear.smertrios.tp         -- 10 PDT
  }                                -- 44 PDT
  sets.modes.HybridHeavy = {
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Kasuga Kabuto +3",       -- 9 DT
    body="Kasuga Domaru +3",       -- 14 DT
    hands="Mpaca's Gloves",        -- 8 PDT
    legs="Kasuga Haidate +3",      -- 11 DT
    feet="Ken. Sune-Ate +1",       -- Meva
    neck="Sam. Nodowa +2",
    waist="Sailfi Belt +1",
    left_ear="Schere Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Niqmaddu Ring",
    back=gear.smertrios.tp         -- 10 PDT
  }                                -- 52 PDT

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS['Tachi: Fudo'] = {
    ammo="Knobkierrie",
    head="Mpaca's Cap",
    body="Nyame Mail",
    hands="Kasuga Kote +3",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sam. Nodowa +2",
    waist="Sailfi Belt +1",
    left_ear="Thrud Earring",
    right_ear="Moonshade earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back=gear.smertrios.ws
  }
  sets.WS['Tachi: Shoha'] = {
    ammo="Knobkierrie",
    head="Mpaca's Cap",
    body="Nyame Mail",
    hands="Kasuga Kote +3",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sam. Nodowa +2",
    waist="Sailfi Belt +1",
    left_ear="Thrud Earring",
    right_ear="Moonshade earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back=gear.smertrios.ws
  }
  sets.WS['Tachi: Ageha'] = {
    ammo="Pemphredo Tathlum",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Kasuga Kote +3",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Dignitary's Earring",
    right_ear="Moonshade Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back=gear.smertrios.ws,
  }
  sets.WS['Tachi: Jinpu'] = {
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sam. Nodowa +2",
    waist="Orpheus's Sash",
    left_ear="Friomisi earring",
    right_ear="Moonshade earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back=gear.smertrios.ws
  }
  sets.WS['Tachi: Kagero'] = sets.WS['Tachi: Jinpu']
  sets.WS['Tachi: Goten'] = sets.WS['Tachi: Jinpu']
  sets.WS['Tachi: Koki'] = set_combine(sets.WS['Tachi: Jinpu'], {
    right_ring="Weatherspoon Ring +1"
  })
  sets.WS['Raiden Thrust'] = sets.WS['Tachi: Jinpu']
  sets.WS['Thunder Thrust'] = sets.WS['Tachi: Jinpu']
  sets.WS['Tachi: Kaiten'] = sets.WS['Tachi: Fudo']
  sets.WS['Impulse Drive'] = sets.WS['Tachi: Fudo']
  sets.WS['Empyreal Arrow'] = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sam. Nodowa +2",
    waist="Fotia Belt",
    left_ear="Thrud earring",
    right_ear="Moonshade earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back=gear.smertrios.ws  
  }

  -- Job Abilities
  --
  sets.JAs = {}
  sets.JAs.Meditate = {
    head="Wakido Kabuto +3",
    hands="Sakonji Kote +3",
    back=gear.smertrios.tp
  }
  sets.JAs['Warding Circle'] = {
    head="Wakido Kabuto +3"
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
    rring="Weatherspoon Ring +1",       -- 6
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
    if player.equipment.main ~= 'Soboro Sukehiro' then
      equip(set_for_ws(spell.english))
    end
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

  return set_combine(
    set, { main = WeaponMode.current }
  )
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
