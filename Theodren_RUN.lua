include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')
include('utils.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode',
    'ParryTank', 'MagicTank', 'Defense', 'HybridDD'
    -- , 'FullDD'
  }
  WeaponMode = M{['description'] = 'Weapon Mode', 
    'Epeolatry',
    'Lionheart', 
    'Kaja chopper'
    --'Hepatizon Axe +1'
  }

  Runes = {
    current = 8,
    runes = {
      { name="Ignis", ele="Fire", resist="Ice" },
      { name="Gelus", ele="Ice", resist="Wind" },
      { name="Flabra", ele="Wind", resist="Stone" },
      { name="Tellus", ele="Stone", resist="Thunder" },
      { name="Sulpor", ele="Thunder", resist="Water" },
      { name="Unda", ele="Water", resist="Fire" },
      { name="Lux", ele="Light", resist="Dark" },
      { name="Tenebrae", ele="Dark", resist="Light" }
    }
  }
end

function define_spells()
  Spells_Enmity = S{
    "Flash", "Blank Gaze", "Jettatura", "Foil"
  }
  Spells_AoeEnmity = S{
    "Sheep Song", "Geist Wall", "Soporific", "Stinking Gas"
  }
end

function define_aliases()
  -- Modes
  send_command("bind ^f1 gs c cycle PrimaryMode")
  send_command("bind ^f2 gs c cycle WeaponMode")
  send_command("bind ^f3 gs c cycle_rune")
  -- send_command('bind !f9 input /item "Echo Drops" <me>')
  -- send_command('bind !f10 input /item "Remedy" <me>')
  -- send_command('bind !f11 input /item "Holy Water" <me>')
end

function define_gear()

end

function get_sets()
  define_modes()
  define_aliases()
  define_spells()

  gear = {
    ogma = {
      tp={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
      reso={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
      dimi={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
      enmity={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Spell interruption rate down-10%',}, priority=5},
      tank={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
      parry={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
      fastCast={ name="Ogma's Cape", augments={'HP+60','HP+20','"Fast Cast"+10',}, priority=5},
    }
  }

  sets.Idle = {
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body={ name="Runeist Coat +3", priority=5 },
    hands="Erilaz Gauntlets +3",
    -- legs="Carmine Cuisses +1",
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck="Futhark Torque +2",
    waist="Flume Belt +1",
    left_ear={ name="Odnowa Earring +1", priority=5 },
    -- right_ear="Eabani Earring",
    right_ear="Erilaz Earring +1",
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", priority=5 },
    back=gear.ogma.tank
  }

  sets.IdlePhysical = {
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body={ name="Runeist Coat +3", priority=5 },
    hands="Nyame Gauntlets",
    -- legs="Carmine Cuisses +1",
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck="Futhark Torque +2",
    waist="Flume Belt +1",
    left_ear={ name="Odnowa Earring +1", priority=5 },
    right_ear="Eabani Earring",
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", priority=5 },
    back=gear.ogma.tank
  }
  sets.IdleMagic = {
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",                             -- 3%
    head="Nyame Helm",                                     -- 7%
    body={ name="Runeist Coat +3", priority=5 },
    hands="Erilaz Gauntlets +3",                           -- 11%
    legs="Eri. Leg Guards +3",                             -- 13%
    feet="Erilaz Greaves +3",                              -- 11%
    neck="Warder's Charm +1",
    waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", priority=5 },     -- 3%
    right_ear="Senare Earring",
    left_ring="Vexer Ring +1",
    right_ring="Shadow Ring",
    back=gear.ogma.tank                                    -- 10%
  }

  -- Modes
  --
  sets.modes = {}
  sets.modes.ParryTank = {
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Turms Mittens +1",
    legs="Eri. Leg Guards +3",
    feet="Turms Leggings +1",
    neck="Futhark Torque +2",
    waist="Flume Belt +1",
    left_ear={ name="Odnowa Earring +1", priority=5 },
    right_ear="Eabani Earring",
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", priority=5 },
    back=gear.ogma.parry
  }
  sets.modes.MagicTank = {
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +3",
    body="Erilaz Surcoat +3",
    hands="Erilaz Gauntlets +3",
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck="Warder's Charm +1",
    waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", priority=5 },
    right_ear="Sanare Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back=gear.ogma.tank
  }
  sets.modes.Defense = {
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", priority=5 },
    body={ name="Runeist Coat +3", priority=5 },
    hands={ name="Nyame Gauntlets", priority=5 },
    legs={ name="Nyame Flanchard", priority=5 },
    feet={ name="Nyame Sollerets", priority=5 },
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Eabani Earring",
    left_ring={ name="Moonlight Ring", priority=5 },
    right_ring={ name="Gelatinous Ring +1", priority=5 },
    back=gear.ogma.tank
  }
  sets.modes.HybridDD = {
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head={ name="Nyame Helm", priority=5 },
    body="Ashera Harness",
    hands={ name="Nyame Gauntlets", priority=5 },
    legs="Nyame Flanchard",
    feet={ name="Nyame Sollerets", priority=5 },
    neck="Anu Torque",
    waist="Sailfi Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring={ name="Moonlight Ring", priority=5 },
    right_ring={ name="Gelatinous Ring +1", priority=5 },
    back=gear.ogma.tp
  }
  sets.modes.FullDD = {
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head=augments.adhemar.head.pathA,
    body="Ashera Harness",
    hands="Adhemar Wristbands +1",
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epona's Ring",
    back=gear.ogma.tp
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.Resolution = {
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Nyame Mail",
    hands=augments.herc.hands.reso,
    legs="Nyame Flanchard",
    feet=augments.herc.feet.triple,
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back=gear.ogma.reso
  }
  sets.WS.Dimidiation = {
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back=gear.ogma.dimi
  }
  sets.WS['Ground Strike'] = {
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back=gear.ogma.reso
  }
  sets.WS.Shockwave = {
    ammo="Pemphredo Tathlum",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Dignitary's Earring",
    right_ear="Moonshade Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back=gear.ogma.tank
  }
  sets.WS['Armor Break'] = {
    ammo="Pemphredo Tathlum",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Dignitary's Earring",
    right_ear="Moonshade Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back=gear.ogma.tank
  }
  sets.WS['Savage Blade'] = {
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back=gear.ogma.reso
  }

  -- Job Abilities
  --
  sets.JAs = {}
  sets.JAs.Valiance = { body="Runeist Coat +3", legs="Futhark Trousers +3", back=gear.ogma.enmity }
  sets.JAs.Vallation = sets.JAs.Valiance
  sets.JAs.Pflug = { feet="Runeist Bottes +1" }
  sets.JAs.Gambit = { hands="Runeist Mitons +3" }
  sets.JAs.Rayke = { feet="Futhark Boots" }
  sets.JAs.Battuta = { head="Futhark Bandeau +3" }
  sets.JAs.Liement = { body="Futhark Coat +3" }
  sets.JAs['Elemental Sforzo'] = { body="Futhark Coat +3" }
  sets.JAs['Vivacious Pulse'] = {
    head="Erilaz Galea +3",
    neck="Incanter's Torque",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Altruistic Cape",
    legs="Runeist Trousers"
  }
  sets.JAs['One for All'] = {
    ammo="Sapience Orb",
    head="Carmine Mask +1",
    body="Runeist Coat +3",
    hands="Regal Gauntlets",
    legs="Carmine Cuisses +1",
    feet="Carmine Greaves +1",
    neck="Futhark Torque +2",
    waist="Plat. Mog. Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Etiolation Earring",
    left_ring="Moonlight Ring",
    right_ring="Gelatinous Ring +1",
    back=gear.ogma.enmity
  }
  sets.JAs.Lunge = {
    ammo="Pemphredo Tathlum",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Trux Earring",
    right_ear="Friomisi Earring",
    left_ring="Mujin Band",
    right_ring="Shiva Ring +1",
    back=gear.ogma.enmity
  }
  sets.JAs['Swipe'] = sets.JAs['Lunge']

  -- Magic
  --
  sets.Magic = {}
  sets.Magic.FastCast = {
    ammo="Sapience Orb",                -- 2
    head={ name="Runeist Bandeau +3", priority=5 }, -- 14
    body={ name="Erilaz Surcoat +3", priority=5 }, -- 10
    hands="Leyline Gloves",             -- 7
    legs="Agwu's Slops",                -- 6
    feet={ name="Carmine Greaves +1", priority=5 }, -- 8
    neck="Orunmila's Torque",           -- 5
    waist={ name="Plat. Mog. Belt", priority=5 }, -- HP
    lear="Loquacious earring",          -- 2
    rear={ name="Etiolation Earring", priority=5 }, -- 1
    lring="Weatherspoon Ring +1",       -- 6
    rring="Kishar Ring",                -- 4
    back=gear.ogma.fastCast,            -- 10
                                        -- 73
  }
  sets.Magic.FastCastEnhancing = set_combine(sets.Magic.FastCast, {
    waist="Siegel Sash",             -- 9
    legs="Futhark Trousers +3"       -- 15
                                     -- 89
  })
  -- Skill swaps for temper:
  -- head={ name="Carmine Mask +1", priority=5 }, -- 11
  -- hands={ name="Runeist Mitons +3", priority=5 }, -- 19
  -- legs={ name="Carmine Cuisses +1", priority=5 }, -- 18
  sets.Magic.Temper = {
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +3",          -- 15% duration
    body="Manasa Chasuble",          -- 12    
    hands={ name="Regal Gauntlets", priority=5 }, -- 20% duration
    legs="Futhark Trousers +3",      -- 30% duration
    feet={ name="Nyame Sollerets", priority=5 }, -- DT
    neck="Incanter's Torque",        -- 10
    waist="Olympus Sash",            -- 5
    left_ear="Andoaa Earring",       -- 5
    right_ear="Mimir Earring",       -- 10
    left_ring="Stikini Ring +1",     -- 8
    right_ring="Stikini Ring +1",    -- 8
    waist="Olympus Sash",            -- 5
    back="Merciful Cape"             -- 5
  }
  -- This hits enhancing skill cap (500) at ML30
  sets.Magic.Phalanx = {
    ammo="Staunch Tathlum +1",
    head="Futhark Bandeau +3",
    body=augments.herc.body.phalanx,
    hands=augments.taeon.hands.phalanx,
    legs=augments.taeon.legs.phalanx,
    feet=augments.taeon.feet.phalanx,
    neck="Incanter's Torque",        -- 10
    waist="Olympus Sash",            -- 5
    left_ear={ name="Odnowa Earring +1", priority=5 },
    right_ear="Mimir Earring",       -- 10
    left_ring={ name="Moonlight Ring", priority=5 },
    right_ring={ name="Gelatinous Ring +1", priority=5 },
    back="Merciful Cape"             -- 5
  }
  -- Phalanx+ gear for when others cast on me
  sets.Magic.PhalanxReceived = {
    head="Futhark Bandeau +3",
    body=augments.herc.body.phalanx,
    hands=augments.taeon.hands.phalanx,
    legs=augments.taeon.legs.phalanx,
    feet=augments.taeon.feet.phalanx,
    right_ear="Erilaz Earring +1"
  }

  sets.Magic.SpellInterrupt = {
    ammo="Staunch Tathlum +1",       -- 11, 3 DT
    head="Erilaz Galea +3",          -- 25
    body="Nyame Mail",               -- 9 DT
    hands="Regal Gauntlets",         -- 10
    legs="Carmine Cuisses +1",       -- 20
    feet="Nyame Sollerets",          -- 7 DT
    neck="Moonlight Necklace",       -- 15
    waist="Audumbla Sash",           -- 10 SID, 4 PDT
    left_ear="Odnowa Earring +1",    -- DT/HP
    right_ear="Magnetic Earring",    -- 8
    left_ring="Defending Ring",      -- 10 DT
    right_ring="Gelatinous Ring +1", -- 7 PDT
    back=gear.ogma.enmity            -- 10
                                     -- 8 Merit
                                     -- 107 Total SID
                                     -- 43 PDT
  }
  sets.Magic.EnhancingDuration = {
    ammo="Staunch Tathlum +1",       -- 11 SID, 3 DT
    head="Erilaz Galea +3",          -- 15%
    hands={ name="Regal Gauntlets", priority=5 }, -- 20%, 10 SID
    body="Nyame Mail",               -- 9 DT
    legs="Futhark Trousers +3",      -- 30%
    feet="Nyame Sollerets",          -- 7 DT
    neck="Moonlight Necklace",       -- 15
    waist="Audumbla Sash",           -- 10 SID, 4 PDT
    left_ear={ name="Odnowa Earring +1", priority=5 }, -- DT
    right_ear="Magnetic Earring",    -- 8 SID
    left_ring="Defending Ring",      -- 10 DT
    right_ring="Gelatinous Ring +1", -- 7 PDT
    back=gear.ogma.enmity            -- 10 SID
                                     -- 65% duration
                                     -- 43 PDT
                                     -- 49 SID
  }
  sets.Magic.Barspell = set_combine(sets.Magic.EnhancingDuration, {
    waist="Olympus Sash",            -- 5 skill
    right_ear="Mimir Earring",       -- 10 skill
    left_ring="Stikini Ring +1",     -- 8 skill
    right_ring="Stikini Ring +1",    -- 8 skill
  })
  sets.Magic.Refresh = set_combine(sets.Magic.EnhancingDuration, {
    head="Erilaz Galea +3",
    waist="Gishdubar Sash"
  })
  sets.Magic['Regen IV'] = set_combine(sets.Magic.EnhancingDuration, {
    head="Runeist Bandeau +3",
    neck="Sacro Gorget",
    waist="Sroda Belt",
    right_ear="Erilaz Earring +1"
  })
  sets.Magic.Stoneskin = set_combine(sets.Magic.EnhancingDuration, {
    waist="Siegel Sash"
  })
  -- sets.Magic['Healing Breeze'] = {
  --   ammo="Staunch Tathlum +1",       -- 11 sird, 3 DT
  --   head="Agwu's Cap",               -- 10 sird
  --   body="Vrikodara Jupon",          -- 13 cure
  --   hands="Regal Gauntlets",         -- 10 sird
  --   legs="Carmine Cuisses +1",       -- 20 sird
  --   feet="Taeon Boots",              -- 10 sird
  --   neck="Phalaina Locket",          -- 4 cure (+4 rec)
  --   waist="Sroda Belt",              -- 35 cure
  --   left_ear="Mendi. Earring",       -- 5 cure
  --   right_ear="Magnetic Earring",    -- 8 sird
  --   left_ring="Defending Ring",      -- 10 DT
  --   right_ring="Gelatinous Ring +1", -- 7 PDT
  --   back=gear.ogma.enmity            -- 10 sird
  -- }
  sets.Enmity = {
    ammo="Sapience Orb",
    head="Halitus Helm",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs={ name="Eri. Leg Guards +3", priority=3 },
    feet="Erilaz Greaves +3",
    neck="Moonlight Necklace",
    waist={ name="Kasiri Belt", priority=4 },
    left_ear="Trux Earring",
    right_ear={ name="Cryptic Earring", priority=2 },
    left_ring={ name="Eihwaz Ring", priority=5 },
    right_ring={ name="Supershear Ring", priority=1 },
    back=gear.ogma.enmity
  }

  -- Statuses
  --
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

  elseif spell.type == "JobAbility" or
     spell.type == "Ward" or
     spell.type == "Effusion" then
      equip(set_combine(sets.Enmity, sets.JAs[spell.english]))

  elseif spell.action_type == 'Magic' then
    if spell.skill == 'Enhancing Magic' then
      equip(sets.Magic.FastCastEnhancing)
    else
      equip(sets.Magic.FastCast)
      if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
        send_command('@wait 1.0; cancel 66; cancel 444; cancel 445')
      end
    end

  elseif spell.english == 'Spectral Jig' then
    cast_delay(0.5)
    send_command('@cancel 71;')
  end
end

function midcast(spell)
  if spell.action_type == 'Magic' then
    if Spells_Enmity:contains(spell.english) then
      equip(sets.Enmity)

    elseif Spells_AoeEnmity:contains(spell.english) then
      equip(sets.Magic.SpellInterrupt)

    elseif spell.english == "Temper" then
      equip(sets.Magic.Temper)
      if player.status ~= 'Engaged' and player.tp < 1000 then
        equip({main = "Pukulatmuj +1"})
      end

    elseif sets.Magic[spell.name] then
      equip(sets.Magic[spell.name])

    elseif string.find(spell.english, 'Bar') then
      equip(sets.Magic.Barspell)

    elseif spell.skill == 'Enhancing Magic' then
      equip(sets.Magic.EnhancingDuration)

    else
      equip(sets.Magic.SpellInterrupt)
    end
  end
end

function aftercast(spell)
  -- equip_set_for_current_mode()

  -- if player.status == 'Engaged' then
    equip_set_for_current_mode()
  -- else
  --   equip(set_combine(
  --     { main = { name=WeaponMode.current, priority=5 } }, sets.Idle
  --   ))
  -- end
end

function status_change(new, old)
  -- equip_set_for_current_mode()

  if new == 'Engaged' then
    equip_set_for_current_mode()
  else
    equip(set_combine(
      { main = { name=WeaponMode.current, priority=5 } }, sets.Idle
    ))
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
  elseif command == 'rune' then
    use_current_rune()
  elseif command == 'cycle_rune' then
    cycle_current_rune()
  elseif command == 'idle' then
    equip(set_combine(
      { main = { name=WeaponMode.current, priority=5 } }, sets.Idle
    ))
  end
end

function set_for_engaged()
  local set = set_combine(
    { main = { name=WeaponMode.current, priority=5 } },
    sets.modes[PrimaryMode.current]
  )
  if buffactive.Doom then
    set = set_combine(set, sets.Doom)
  end
  return set
end

function set_for_ws(named)
  if sets.WS[named] then
    return sets.WS[named]
  else
    return sets.WS.Resolution
  end
end

function equip_set_for_current_mode()
  equip(set_for_engaged())
end

function use_current_rune()
  local rune = Runes.runes[Runes.current]
  send_command("input /ja " .. rune.name .. " <me>")
end

function cycle_current_rune()
  Runes.current = Runes.current + 1
  if Runes.current > #Runes.runes then
    Runes.current = 1
  end
  local rune = Runes.runes[Runes.current]
  local str = "RUNE: " .. rune.name .. " [+>> " .. rune.ele .. "] [<<| " .. rune.resist .. "]"
  add_to_chat(122, str)
end
