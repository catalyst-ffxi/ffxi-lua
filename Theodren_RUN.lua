include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')
include('utils.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Tank', 'NyameTank', 'HybridDD', 'FullDD'}
  WeaponMode = M{['description'] = 'Weapon Mode', 
    'Epeolatry', 'Lionheart', 'Hepatizon Axe +1'
  }
  IdleMode = M(false, 'IdleMode')

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
      enmity={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Spell interruption rate down-10%',}},
      tank={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
      fastCast={ name="Ogma's Cape", augments={'HP+60','HP+20','"Fast Cast"+10',}},
    }
  }

  sets.Idle = {
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Runeist's Coat +3",   
    hands="Nyame Gauntlets",
    legs="Carmine Cuisses +1",
    feet="Nyame Sollerets",
		neck="Futhark Torque +2",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Eabani Earring",
    left_ring="Moonlight Ring",
    right_ring="Warden's Ring +1",
    back=gear.ogma.tank
  }

  -- Modes
  --
  sets.modes = {}
  sets.modes.Tank = {
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Turms Cap +1",
    body="Runeist's Coat +3",
    hands="Turms Mittens +1",
    legs="Eri. Leg Guards +1",
    feet="Turms Leggings +1",
		neck="Futhark Torque +2",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back=gear.ogma.tank
  }
  sets.modes.NyameTank = {
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Turms Mittens +1",
    legs="Nyame Flanchard",
    feet="Turms Leggings +1",
		neck="Futhark Torque +2",
    waist="Engraved Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back=gear.ogma.tank
  }
  sets.modes.NyameTank2 = {
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Turms Mittens +1",
    legs="Nyame Flanchard",
    feet="Turms Leggings +1",
		neck="Futhark Torque +2",
    waist="Engraved Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Eabani Earring",
    left_ring="Gelatinous Ring +1",
    right_ring="Warden's Ring",
    back=gear.ogma.tank
  }
  sets.modes.HybridDD = {
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Adhemar Bonnet +1",
    body="Ayanmo Corazza +2",
    hands="Adhemar Wristbands +1",
    legs="Meg. Chausses +2",
    feet=augments.herc.feet.triple,
    neck="Anu Torque",
    waist="Sailfi Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back=gear.ogma.tp
  }
  -- sets.modes.HybridDD = {
  --   sub="Utu Grip",
  --   ammo="Coiste Bodhar",
  --   head="Nyame Helm",
  --   body="Ayanmo Corazza +2",
  --   hands="Nyame Gauntlets",
  --   legs="Meg. Chausses +2",
  --   feet="Nyame Sollerets",
  --   neck="Anu Torque",
  --   waist="Sailfi Belt +1",
  --   left_ear="Brutal Earring",
  --   right_ear="Sherida Earring",
  --   left_ring="Moonlight Ring",
  --   right_ring="Moonlight Ring",
  --   back=gear.ogma.tp
  -- }
  sets.modes.FullDD = {
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
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
    legs="Meg. Chausses +2",
    feet=augments.herc.feet.triple,
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back=gear.ogma.reso
  }
  sets.WS.Dimidiation = {
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Meg. Gloves +2",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Regal Ring",
    back=gear.ogma.dimi
  }
  sets.WS['Ground Strike'] = {
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Meg. Gloves +2",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Regal Ring",
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
    hands="Meg. Gloves +2",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Caro Necklace",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Regal Ring",
    right_ring="Epaminondas's Ring",
    back=gear.ogma.reso
  }

  -- Job Abilities
  --
  sets.JAs = {}
  sets.JAs.Valiance = { body="Runeist's Coat +3", legs="Futhark Trousers +3", back=gear.ogma.enmity }
  sets.JAs.Vallation = sets.JAs.Valiance
  sets.JAs.Pflug = { feet="Runeist Bottes +1" }
  sets.JAs.Gambit = { hands="Runeist's Mitons +3" }
  sets.JAs.Rayke = { feet="Futhark Boots" }
  sets.JAs.Battuta = { head="Futhark Bandeau +3" }
  sets.JAs.Liement = { head="Futhark Coat +3" }
  sets.JAs['Elemental Sforzo'] = { body="Futhark Coat +3" }
  sets.JAs['Vivacious Pulse'] = {
    head="Erilaz Galea +1",
    neck="Incanter's Torque",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Altruistic Cape",
    legs="Runeist Trousers"
  }
  sets.JAs['One for All'] = {
    ammo="Sapience Orb",
    head="Carmine Mask +1",
    body="Runeist's Coat +3",
    hands="Regal Gauntlets",
    legs="Carmine Cuisses +1",
    feet="Carmine Greaves +1",
    neck="Futhark Torque +2",
    waist="Kasiri Belt",
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

  -- 2533, 2812

  -- Magic
  --
  sets.Magic = {}
  sets.Magic.FastCast = {
    ammo="Sapience Orb",                -- 2
    head="Runeist's Bandeau +3",        -- 14
    neck="Orunmila's Torque",           -- 5
    lear="Loquacious earring",          -- 2
    rear="Etiolation Earring",          -- 1
    body="Taeon Tabard",                -- 8
    hands="Leyline Gloves",             -- 7
    lring="Weatherspoon Ring +1",       -- 6
    rring="Kishar Ring",                -- 4
    back=gear.ogma.fastCast,            -- 10
    waist="Kasiri Belt",                -- HP
    legs="Aya. Cosciales +2",           -- 6
    feet="Carmine Greaves +1"           -- 8
                                        -- 71
  }
  sets.Magic.FastCastEnhancing = set_combine(sets.Magic.FastCast, {
    waist="Siegel Sash",             -- 9
    legs="Futhark Trousers +3"       -- 15
                                     -- 89
  })
  sets.Magic.SpellInterrupt = {
    ammo="Staunch Tathlum +1",       -- 11, 3 DT
    head="Futhark Bandeau +3",       -- 5 PDT
    neck="Moonlight Necklace",       -- 15
    lear="Odnowa Earring +1",        -- DT/HP
    rear="Magnetic Earring",         -- 8
    body="Futhark Coat +3",          -- 9 DT
    hands="Regal Gauntlets",         -- 10
    left_ring="Defending Ring",      -- 10 DT
    right_ring="Gelatinous Ring +1", -- 7 PDT
    back=gear.ogma.enmity,           -- 10
    waist="Audumbla Sash",           -- 10 SID, 4 PDT
    legs="Carmine Cuisses +1",       -- 20
    feet=augments.taeon.feet.phalanx -- 10
                                      -- 8 Merit
                                      -- 102 Total
                                      -- 41 PDT
  }
  sets.Magic.Utsusemi = { -- mix of FC, SID, and DT
    ammo="Staunch Tathlum +1",          -- 11 SID, 3 DT
    head="Runeist's Bandeau +3",        -- 12 FC
    neck="Moonlight Necklace",          -- 15 SID
    lear="Loquacious earring",          -- 2 FC
    rear="Magnetic Earring",            -- 8 SID
    body="Taeon Tabard",                -- 8 FC
    hands="Leyline Gloves",             -- 7 FC
    lring="Defending Ring",             -- 10 DT
    right_ring="Kishar Ring",           -- 4 FC
    back=gear.ogma.tank,                -- 10 FC, 5 DT
    waist="Audumbla Sash",              -- 10 SID, 4 PDT
    legs="Carmine Cuisses +1",          -- 20 SID
    feet="Carmine Greaves +1"           -- 8 FC
  }
  sets.Magic.EnhancingSkill = {
    ammo="Staunch Tathlum +1",
    head="Carmine Mask +1",          -- 11
    body="Manasa Chasuble",          -- 12
    hands="Runeist's Mitons +3",     -- 19
    legs="Carmine Cuisses +1",       -- 18
    feet=augments.taeon.feet.phalanx,-- SIRD
    neck="Incanter's Torque",        -- 10
    waist="Olympus Sash",            -- 5
    left_ear="Andoaa Earring",       -- 5
    right_ear="Mimir Earring",       -- 10
    left_ring="Stikini Ring +1",     -- 8
    right_ring="Stikini Ring +1",    -- 8
    waist="Olympus Sash",            -- 5
    back="Merciful Cape"             -- 5
  }
  sets.Magic.Phalanx = set_combine(sets.Magic.EnhancingSkill, {
    head="Futhark Bandeau +3",
    body=augments.herc.body.phalanx,
    hands=augments.taeon.hands.phalanx,
    legs=augments.taeon.legs.phalanx,
    feet=augments.taeon.feet.phalanx,
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1"
  })
  sets.Magic.EnhancingDuration = set_combine(sets.Magic.SpellInterrupt, {
    head="Erilaz Galea +1",
    hands="Regal Gauntlets",
    legs="Futhark Trousers +3"
  })
  sets.Magic.Barspell = sets.Magic.EnhancingSkill
  sets.Magic.Refresh = set_combine(sets.Magic.EnhancingDuration, {
    head="Erilaz Galea +1",
    waist="Gishdubar Sash"
  })
  sets.Magic['Regen IV'] = set_combine(sets.Magic.EnhancingDuration, {
    head="Runeist's Bandeau +3"
  })

  -- Upgrades:
  --
  -- feet="Ahosi Leggings"       -- 7
  --
  sets.Enmity = {
    ammo="Sapience Orb",           -- 2
    head="Halitus Helm",           -- 8
    neck="Moonlight Necklace",     -- 15
    left_ear="Trux Earring",       -- 5
    right_ear="Cryptic Earring",   -- 4
    body="Emet Harness +1",        -- 10
    hands="Kurys Gloves",          -- 9
    left_ring="Supershear Ring",   -- 5
    right_ring="Eihwaz Ring",      -- 5
    back=gear.ogma.enmity,         -- 10
    waist="Kasiri Belt",           -- 3
    legs="Eri. Leg Guards +1",     -- 11
    feet="Erilaz Greaves +1"       -- 6
  }
  sets.AoeEnmity = set_combine(sets.Magic.SpellInterrupt, {
    body="Emet Harness +1"
  })

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
      -- equip(sets.Enmity)
      -- equip(sets.JAs[spell.english])

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
    if sets.Magic[spell.name] then
      equip(sets.Magic[spell.name])

    elseif Spells_Enmity:contains(spell.english) then
      equip(sets.Enmity)

    elseif Spells_AoeEnmity:contains(spell.english) then
      equip(sets.AoeEnmity)

    elseif spell.english == "Temper" then
      equip(sets.Magic.EnhancingSkill)
      -- if player.status ~= 'Engaged' and player.tp < 1000 then
      --   equip({main = "Pukulatmuj +1"})
      -- end

    elseif string.find(spell.english, 'Bar') then
      equip(sets.Magic.Barspell)

    elseif spell.skill == 'Enhancing Magic' then
      equip(sets.Magic.EnhancingDuration)

    elseif string.find(spell.english, 'Utsusemi') then
      equip(sets.Magic.Utsusemi)

    else
      equip(sets.Magic.SpellInterrupt)
    end

    if buffactive['Embolden'] then
      equip(sets.Magic.EnhancingDuration)
    end
  end
end

function aftercast(spell)
  if player.status == 'Engaged' then
    equip_set_for_current_mode()
  else
    equip(sets.Idle)
  end

  -- if new == 'Engaged' then
  --   equip_set_for_current_mode()
  -- end

  -- equip_set_for_current_mode()
end

function status_change(new, old)
  if new == 'Engaged' then
    equip_set_for_current_mode()
  else
    equip(sets.Idle)
  end
end

-- function buff_change(buff, gain, bufftable)
--   handle_doom(buff, gain)
--   if buff:lower() == "doom" then
--     if gain then
--       equip(sets.Doom)
--       send_command("input /party Help, I'm DOOMED!")
--       send_command('input /item "Holy Water" <me>')
--     else
--       equip_set_for_current_mode()
--       send_command("input /party Doom OFF!")
--     end
--   end
-- end

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
  elseif command == 'run' then
    equip(sets.Idle)
    -- equip({ legs="Carmine Cuisses +1" })
  end
end

function set_for_engaged()
  local set = set_combine(
    sets.modes[PrimaryMode.current],
    { main = WeaponMode.current }
  )
  -- if player.status ~= 'Engaged' then
  --   set = set_combine(set, sets.Idle)
  -- end
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
