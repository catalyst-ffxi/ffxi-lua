include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')
include('utils.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Tank', 'HybridHeavy', 'HybridLight', 'FullDD'}
  WeaponMode = M{['description'] = 'Weapon Mode', 'Epeo', 'Lionheart', 'Hepatizon'}

  Runes = {
    current = 1,
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

function define_binds()
  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  send_command("alias g15v2_m1g2 gs c cycle WeaponMode")
  send_command("alias g15v2_m1g3 gs c cycle_rune")
  -- send_command('bind !f9 input /item "Echo Drops" <me>')
  -- send_command('bind !f10 input /item "Remedy" <me>')
  -- send_command('bind !f11 input /item "Holy Water" <me>')
end

function define_gear()

end

function get_sets()
  define_modes()
  define_binds()
  define_spells()

  gear = {
    ogma = {
      tp={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
      reso={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
      dimi={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
      enmity={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Spell interruption rate down-10%',}},
      tank={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
    }
  }

  -- Weapons
  --
  sets.weapons = {
    Lionheart = { main="Lionheart" },
    Epeo = { main="Epeolatry" },
    Hepatizon = { main="Hepatizon Axe +1" }
  }
  -- sets.weapons.Lionheart = {
  --   main="Lionheart",
  --   -- sub="Utu Grip"
  -- }
  -- sets.weapons.Epeo = {
  --   main="Epeolatry",
  --   -- sub="Alber Strap"
  -- }
  -- sets.weapons.Hepatizon = {
  --   main="Hepatizon Axe +1"
  -- }

  -- Modes
  --
  sets.modes = {}
  sets.modes.FullDD = {
    sub="Utu Grip",
    ammo="Yamarang",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands=augments.herc.hands.triple,
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
  sets.modes.HybridLight = {
    sub="Utu Grip",
    ammo="Yamarang",
    head="Adhemar Bonnet +1",
    body="Ayanmo Corazza +2",          -- 6 PDT
    hands=augments.herc.hands.triple,  -- 2 PDT
    legs="Meg. Chausses +2",           -- 6 PDT
    feet=augments.herc.feet.triple,    -- 2 PDT
    neck="Loricate Torque +1",         -- 6 PDT
    waist="Ioskeha Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",        -- 5 DT
    right_ring="Moonlight Ring",       -- 5 DT
    back=gear.ogma.tp                  -- 10 PDT
  }                                    -- 43 PDT
  sets.modes.HybridHeavy = {
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",         -- 3 DT
    head="Aya. Zucchetto +2",          -- 3 DT
    body="Ayanmo Corazza +2",          -- 6 PDT
    hands="Turms Mittens +1",
    legs="Meg. Chausses +2",           -- 6 PDT
    feet="Turms Leggings +1",
    neck="Loricate Torque +1",         -- 6 PDT
    waist="Ioskeha Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",        -- 10 DT
    right_ring="Moonlight Ring",        -- 4 DT
    back=gear.ogma.tp                  -- 10 PDT
  }                                    -- 49 PDT
  sets.modes.Tank = {
    sub="Alber Strap",
    ammo="Staunch Tathlum +1",
    head="Turms Cap +1",
    body="Futhark Coat +3",
    hands="Turms Mittens +1",
    legs="Eri. Leg Guards +1",
    feet="Turms Leggings +1",
		neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back=gear.ogma.tank
  }

  -- Idle Sets
  sets.Idle = {}
  sets.Idle.Normal = {}
  sets.Idle.Kite = {}
  sets.Idle.Refresh = {}

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.Resolution = {
    ammo="Knobkierrie",
    head=augments.herc.head.reso,
    body=augments.herc.body.reso,
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
    head=augments.herc.head.wsDex,
    body="Meghanada cuirie +2",
    hands="Meg. Gloves +2",
    legs=augments.herc.legs.wsDex,
    feet=augments.herc.feet.wsDex,
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring +1",
    back=gear.ogma.dimi
  }
  sets.WS['Ground Strike'] = {
    ammo="Knobkierrie",
    head=augments.herc.head.reso,
    body=augments.herc.body.reso,
    hands="Meg. Gloves +2",
    legs=augments.herc.legs.wsDex,
    feet=augments.herc.feet.reso,
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring +1",
    back=gear.ogma.reso
  }
  sets.WS.Shockwave = {
    ammo="Yamarang",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Dignitary's Earring",
    right_ear="Moonshade Earring",
    left_ring="Flamma Ring",
    right_ring="Karieyh Ring +1",
    back=gear.ogma.tank
  }
  sets.WS['Armor Break'] = {
    ammo="Pemphredo Tathlum",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Dignitary's Earring",
    right_ear="Moonshade Earring",
    left_ring="Stikini Ring +1",
    right_ring="Karieyh Ring +1",
    back=gear.ogma.tank
  }

  -- Job Abilities
  --
  sets.JAs = {}
  sets.JAs.Valiance = { body="Runeist Coat +1", back="Ogma's Cape" }
  sets.JAs.Vallation = sets.JAs.Valiance
  sets.JAs.Pflug = { feet="Runeist Bottes +1" }
  sets.JAs.Gambit = { hands="Runeist's Mitons +2" }
  sets.JAs.Rayke = { feet="Futhark Boots" }
  sets.JAs.Battuta = { head="Futhark Bandeau +2" }
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
    ammo="Staunch Tathlum +1",
    head={ name="Carmine Mask", augments={'HP+60','STR+10','INT+10',}},
    body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
    hands="Turms Mittens +1",
    legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}},
    feet="Turms Leggings +1",
    neck="Sanctity Necklace",
    waist="Kasiri Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Etiolation Earring",
    left_ring="Eihwaz Ring",
    right_ring="Moonlight Ring",
    back=gear.ogma.tank
  }

  -- Magic
  --
  sets.Magic = {}
  sets.Magic.FastCast = {
    ammo="Sapience Orb",                -- 2
    head="Runeist's Bandeau +2",        -- 12
    neck="Orunmila's Torque",           -- 5
    lear="Loquacious earring",          -- 2
    rear="Etiolation Earring",          -- 1
    body="Taeon Tabard",                -- 8
    hands="Leyline Gloves",             -- 7
    lring="Rahab Ring",                 -- 2
    rring="Kishar Ring",                -- 4
    back=gear.ogma.tank,                -- 10
    waist="Kasiri Belt",                -- HP
    legs="Aya. Cosciales +2",           -- 6
    feet="Carmine Greaves +1"           -- 8
                                        -- 67
  }
  sets.Magic.FastCastEnhancing = set_combine(sets.Magic.FastCast, {
    waist="Siegel Sash",             -- 9
    legs="Futhark Trousers +3"       -- 15
                                     -- 85
  })
  -- head=augments.taeon.head.SID,    -- 7
  sets.Magic.SpellInterrupt = {
    ammo="Staunch Tathlum +1",       -- 11, 3 DT
    head="Futhark Bandeau +2",       -- 5 PDT
    neck="Moonlight Necklace",       -- 15
    lear="Odnowa Earring +1",        -- MDT/HP
    rear="Magnetic Earring",         -- 8
    body="Futhark Coat +3",          -- 9 DT
    hands="Rawhide Gloves",          -- 15
    left_ring="Defending Ring",      -- 10 DT
    right_ring="Moonlight Ring",     -- 5 DT
    back=gear.ogma.enmity,           -- 10
    waist="Audumbla Sash",           -- 10 SID, 4 PDT
    legs="Carmine Cuisses +1",       -- 20
    feet=augments.taeon.feet.phalanx -- 9
                                      -- 8 Merit
                                      -- 106 Total
                                      -- 36 PDT
  }
  sets.Magic.Utsusemi = { -- mix of FC, SID, and DT
    ammo="Staunch Tathlum +1",          -- 11 SID, 3 DT
    head="Runeist's Bandeau +2",        -- 12 FC
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
    head="Carmine Mask",            -- 10
    neck="Incanter's Torque",       -- 10
    left_ear="Andoaa Earring",      -- 5
    right_ear="Mimir Earring",      -- 10
    body="Manasa Chasuble",         -- 12
    hands="Runeist's Mitons +2",    -- 17
    left_ring="Stikini Ring +1",    -- 8
    right_ring="Stikini Ring +1",   -- 8
    back="Merciful Cape",           -- 5
    waist="Olympus Sash",           -- 5
    legs="Carmine Cuisses +1"       -- 18
  }
  sets.Magic.Phalanx = set_combine(sets.Magic.EnhancingSkill, {
    head="Futhark Bandeau +2",
    body=augments.herc.body.phalanx,
    hands=augments.taeon.hands.phalanx,
    legs=augments.taeon.legs.phalanx,
    feet=augments.taeon.feet.phalanx
  })
  sets.Magic.EnhancingDuration = {
    head="Erilaz Galea +1",
    hands="Regal Gauntlets",
    legs="Futhark Trousers +3"
  }
  sets.Magic.Barspell = set_combine(
    sets.Magic.EnhancingSkill,
    sets.Magic.EnhancingDuration
  )
  sets.Magic.Refresh = set_combine(sets.Magic.EnhancingDuration, {
    head="Erilaz Galea +1",
    waist="Gishdubar Sash"
  })
  sets.Magic['Regen IV'] = set_combine(sets.Magic.EnhancingDuration, {
    head="Runeist's Bandeau +2"
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
      equip(sets.Enmity)
      equip(sets.JAs[spell.english])

  elseif spell.action_type == 'Magic' then
    if spell.skill == 'Enhancing Magic' then
      equip(sets.Magic.FastCastEnhancing)

    elseif string.find(spell.english, 'Utsusemi') then
      if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
        send_command('@wait 1.0; cancel 66; cancel 444; cancel 445')
      end

    else
      equip(sets.Magic.FastCast)
    end

  elseif spell.english == 'Spectral Jig' then
    cast_delay(0.5)
    send_command('@cancel 71;')
  end

  maintain_reraise_equip()
end

function midcast(spell)
  if spell.action_type == 'Magic' then
    equip(sets.Magic.SpellInterrupt)

    if sets.Magic[spell.name] then
      equip(sets.Magic[spell.name])

    elseif Spells_Enmity:contains(spell.english) then
      equip(sets.Enmity)

    elseif Spells_AoeEnmity:contains(spell.english) then
      equip(sets.AoeEnmity)

    elseif spell.english == "Temper" then
      equip(sets.Magic.EnhancingSkill)

    elseif string.find(spell.english, 'Bar') then
      equip(sets.Magic.Barspell)

    elseif spell.skill == 'Enhancing Magic' then
      equip(sets.Magic.EnhancingDuration)

    elseif string.find(spell.english, 'Utsusemi') then
      equip(sets.Magic.Utsusemi)
    end

    if buffactive['Embolden'] then
      equip(sets.Magic.EnhancingDuration)
    end
  end
end

function aftercast(spell)
  equip_set_for_current_mode()
  maintain_reraise_equip()
end

function status_change(new, old)
  if new == 'Engaged' then
    equip_set_for_current_mode()
    maintain_reraise_equip()
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
    equip({ legs="Carmine Cuisses +1" })
  end
end

function set_for_engaged()
  local set = set_combine(
    sets.modes[PrimaryMode.current],
    sets.weapons[WeaponMode.current]
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
  maintain_reraise_equip()
end

function maintain_reraise_equip()
  if player.equipment.rear == 'Reraise Earring' then
    equip({rear = 'Reraise Earring'})
  end
  if player.equipment.lear == 'Reraise Earring' then
    equip({lear = 'Reraise Earring'})
  end
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
