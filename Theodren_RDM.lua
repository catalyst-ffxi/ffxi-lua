include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')
include('utils.lua')

function define_modes()
  PrimaryMode = M{
    ['description'] = 'Primary Mode',
    'CrocDaybreak',
    'CrocTauret',
    'Naegling',
    'Maxentius',
    'Tauret'
  }
  NukingMode = M{['description'] = 'Nuking Mode', 'MagicBurst', 'Normal'}
  Hybrid = M(false, 'Hybrid')
  WeaponLock = M(true, 'WeaponLock')
end

function define_aliases()
  -- Modes
  send_command("bind ^f1 gs c cycle PrimaryMode")
  send_command("bind ^f2 gs c cycle Hybrid")
  send_command("bind ^f3 gs c cycle NukingMode")
  send_command("bind ^f5 gs c cycle WeaponLock")
end

function get_sets()
  define_modes()
  define_aliases()

  gear = {
    sucellos = {
      nuke = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
      enfeeble = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%'}},
      singleWield = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
      dualWield = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10',}},
      cdc = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}},
      savage = { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
      sanguine = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}}
    },
    stikini = {
      left = { name="Stikini Ring +1", bag="wardrobe1" },
      right = { name="Stikini Ring +1", bag="wardrobe2" }
    }
  }

  -- Idle Sets
  sets.Idle = {
    ammo="Homiliary",               -- 1 Refresh
    head="Viti. Chapeau +3",        -- 3 Refresh
    body="Lethargy Sayon +3",       -- 4 Refresh, 14 DT
    hands="Nyame Gauntlets",        -- 7 DT
    legs="Carmine Cuisses +1",      -- Zoomies
    feet="Nyame Sollerets",         -- 7 DT
    neck="Loricate Torque +1",      -- 6 DT
    waist="Flume Belt +1",          -- 4 PDT
    left_ear="Eabani Earring",      -- Meva
    right_ear="Odnowa Earring +1",  -- 2 MDT, 3 DT
    left_ring=gear.stikini.left,    -- 1 Refresh
    right_ring=gear.stikini.right,  -- 1 Refresh
    back=gear.sucellos.enfeeble,    -- 10 PDT
  }                                 -- 10 Refresh, 51 PDT, 37 MDT

  -- Engaged sets
  sets.Engaged = {}
  sets.Engaged.Naegling = {
    main="Naegling",
    sub="Machaera +2",
    ammo="Coiste Bodhar",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Hetairoi Ring",
    right_ring="Chirich Ring +1",
    back=gear.sucellos.dualWield
  }
  sets.Engaged.Maxentius = set_combine(sets.Engaged.Naegling, {
    main="Maxentius"
  })
  sets.Engaged.Tauret = set_combine(sets.Engaged.Naegling, {
    main="Tauret",
    sub="Gleti's Knife"
  })
  sets.Engaged.CrocDaybreak = set_combine(sets.Engaged.Naegling, {
    main="Crocea Mors",
    sub="Daybreak",
    hands="Aya. Manopolas +2",
    waist="Orpheus's Sash"
  })
  sets.Engaged.CrocTauret = set_combine(sets.Engaged.CrocDaybreak, {
    sub="Tauret"
  })
  sets.Hybrid = {
    left_ring="Defending Ring"
    -- right_ring="Shadow Ring",
    -- neck="Warder's Charm +1"
  }

  -- Job Abilities
  sets.JAs = {}
  sets.JAs.Chainspell = { body="Vitiation Tabard +3" }

  -- Magic
  sets.Magic = {}
  sets.Magic.FastCast = {      -- 38 fc (base+jp)
    head="Atrophy Chapeau +3", -- 16 fc
    body="Viti. Tabard +3",    -- 15 fc
    hands="Leyline Gloves",    -- 7 fc
    right_ring="Weatherspoon Ring +1", -- 6 fc, 4 quick
    waist="Witful Belt",       -- 4 fc, 3 quick
    back="Perimede Cape"       -- 4 quick
  }                            -- 80 fc, 10 quick
  sets.Magic.SpellInterrupt = {
    ammo="Staunch Tathlum +1",       -- 11
    head=augments.taeon.head.SID,    -- 7
    body="Malignance Tabard",        -- DT
    hands="Malignance Gloves",       -- DT
    legs="Carmine Cuisses +1",       -- 20
    feet=augments.taeon.feet.phalanx,-- 9
    neck="Loricate Torque +1",       -- DT
    waist="Rumination Sash",         -- 10
    left_ear="Odnowa Earring +1",    -- DT
    right_ear="Magnetic Earring",    -- 8
    left_ring="Defending Ring",      -- DT
    right_ring="Gelatinous Ring +1", -- DT
    back=gear.sucellos.enfeeble      -- DT
  }

  -- Heals
  --
  -- Healing gear is tuned for ML38
  sets.Magic.Healing = {
    main="Septoptic +1",
    sub="Thuellaic Ecu +1",
    ammo="Pemphredo Tathlum",
    head="Kaykaus Mitra +1",
    body="Kaykaus Bliaut +1",
    hands="Kaykaus Cuffs +1",
    legs="Kaykaus Tights +1", 
    feet="Kaykaus Boots +1", 
    neck="Incanter's Torque",
    waist="Luminary Sash", -- TODO augment Shinjutsu-no-Obi +1
    left_ear="Meili Earring",
    right_ear="Magnetic Earring",
    left_ring=gear.stikini.left, -- TODO augment Mephitas Ring +1
    right_ring=gear.stikini.right,
    back="Aurist's Cape +1"
  }
  sets.Magic.HealingSelf = set_combine(
    sets.Magic.Healing, {
      neck="Phalaina Locket",     -- 4% self
      waist="Gishdubar Sash",     -- 10% self
      left_ring='Kunaji Ring',    -- 5% self
    }
  )

  sets.Magic.Cursna = {
    ammo="Sapience Orb",
    head="Vanya Hood",
    body="Viti. Tabard +3",
    hands="Leyline Gloves",  -- hieros mittens
    legs="Atrophy Tights +3",
    feet="Vanya Clogs",
    neck="Malison Medallion",
    waist="Witful Belt",
    left_ear="Malignance Earring",
    right_ear="Lethargy Earring +1",
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    back="Oretan. Cape +1",
  }

  -- Enhancing
  sets.Magic.EnhancingDuration = {
    main="Colada",
    sub="Ammurapi Shield",
    ammo="Sapience orb",
    head="Telchine Cap",
    body="Vitiation Tabard +3",
    hands="Atrophy Gloves +3",
    legs="Telchine Braconi",
    feet="Lethargy Houseaux +3",
    neck="Duelist's Torque +2",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Lethargy Earring +1",
    left_ring="Kishar Ring",
    right_ring="Weatherspoon Ring +1",
    back="Ghostfyre Cape"
  }
  sets.Magic.EnhancingComposure = {
    main="Colada",
    sub="Ammurapi Shield",
    ammo="Sapience orb",
    head="Lethargy Chappel +3",
    body="Lethargy Sayon +3",
    hands="Atrophy Gloves +3",
    legs="Lethargy Fuseau +3",
    feet="Lethargy Houseaux +3",
    neck="Duelist's Torque +2",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Lethargy Earring +1",
    left_ring="Kishar Ring",
    right_ring="Weatherspoon Ring +1",
    back="Ghostfyre Cape"
  }
  sets.Magic.Refresh = {
    head="Amalric Coif +1",
    body="Atrophy Tabard +3",
    legs="Lethargy Fuseau +3"
  }
  sets.Magic.RefreshSelf = {
    waist="Gishdubar sash",
  }
  sets.Magic.EnhancingSkill = {
    main="Pukulatmuj +1",
    sub="Forfend +1",
    head="Befouled Crown",
    body="Viti. Tabard +3",
    hands="Viti. Gloves +3",
    legs="Atrophy Tights +3",
    feet="Leth. Houseaux +1",
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ear="Mimir Earring",
    right_ear="Lethargy Earring +1",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back="Ghostfyre Cape",
  }
  sets.Magic.Phalanx = {
    main="Sakpata's Sword",
    sub="Ammurapi Shield",
    ammo="Sapience Orb",
    head=augments.taeon.head.SID,
    body="Chironic Doublet",
    hands=augments.taeon.hands.phalanx,
    legs=augments.taeon.legs.phalanx,
    feet=augments.taeon.feet.phalanx,
    neck="Loricate Torque +1",
    waist="Embla Sash",
    left_ear="Magnetic Earring",
    right_ear="Lethargy Earring +1",
    left_ring="Kishar Ring",
    right_ring=gear.stikini.right,
    back="Ghostfyre Cape"
  }
  sets.Magic.Aquaveil = {
    head="Amalric Coif +1"
  }
  sets.Magic.Stoneskin = {
    neck="Nodens Gorget",
    waist="Siegel Sash"
  }
  sets.Magic.Gain = {
    hands="Viti. Gloves +3"
  }
  sets.Magic.Regen = {
    main="Bolelabunga",
    body=augments.telchine.body.regen,
    feet="Bunzi's Sabots"
  }

  -- Enfeebles
  --
  -- Silence/Dispel/Gravity/Sleep/Frazzle2:
  sets.Magic.EnfeebleAccuracy = {
    main="Crocea Mors",
    sub="Daybreak",
    ranged="Ullr",
    head="Vitiation Chapeau +3",
    body="Atrophy Tabard +3",
    hands="Lethargy Gantherots +3",
    legs="Chironic Hose",
    feet="Vitiation Boots +3",
    neck="Duelist's Torque +2",
    waist="Obstinate Sash",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back="Aurist's Cape +1"
  }
  -- Slow2/Paralyze2/Addle2/Blind2:
  sets.Magic.EnfeeblePotency = {
    main="Bunzi's Rod",
    sub="Daybreak",
    ammo="Regal Gem",
    head="Vitiation Chapeau +3",
    body="Lethargy Sayon +3",
    hands="Lethargy Gantherots +3",
    legs="Chironic Hose",
    feet="Vitiation Boots +3",
    neck="Duelist's Torque +2",
    waist="Obstinate Sash",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Metamorph Ring +1",
    right_ring=gear.stikini.right,
    back=gear.sucellos.enfeeble
  }
  -- Frazzle III skill cap is 625
  sets.Magic.Frazzle3 = set_combine(sets.Magic.EnfeeblePotency, {
    -- main="Contemplator +1",
    -- sub="Enki Strap",
    right_ear="Vor Earring",
    left_ring=gear.stikini.left
  })
  -- Distract III skill cap is 610
  sets.Magic.Distract3 = set_combine(sets.Magic.EnfeeblePotency, {
    -- main="Contemplator +1",
    -- sub="Enki Strap"
    left_ring=gear.stikini.left
  })
  -- Max duration (Dia or Stymie'd debuffs):
  sets.Magic.EnfeebleMaxDuration = {
    main="Bunzi's Rod",
    sub="Daybreak",
    ammo="Regal Gem",
    head="Vitiation Chapeau +3",
    body="Lethargy Sayon +3",
    hands="Lethargy Gantherots +3",
    legs="Lethargy Fuseau +3",
    feet="Lethargy Houseaux +3",
    neck="Duelist's Torque +2",
    waist="Obstinate Sash",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Metamorph Ring +1",
    back=gear.sucellos.enfeeble
  }

  -- Nukes
  sets.Magic.Elemental = {}
  sets.Magic.Elemental.Normal = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Lethargy Chappel +3",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Lethargy Fuseau +3",
    feet="Lethargy Houseaux +3",
    neck="Sibyl Scarf",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring="Shiva Ring +1",
    back=gear.sucellos.nuke
  }
  sets.Magic.Elemental.MagicBurst = {
    main="Bunzi's Rod",         -- MB +10
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Ea Hat +1",           -- MB +7 | MB II +7
    body="Ea Houppe. +1",      -- MB +8 | MB II +8
    hands="Bunzi's Gloves",     --       | MB II +5
    legs="Lethargy Fuseau +3",  -- MB +15
    feet="Lethargy Houseaux +3",
    neck="Sibyl Scarf",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring="Metamorph Ring +1",
    back=gear.sucellos.nuke
  }

-- hands="Bunzi's Gloves",     -- MB +8 | MB II +4

  -- Dark
  sets.Magic.Stun = {
    main="Crocea Mors",            -- 20 fc
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head="Atrophy Chapeau +3",     --16 fc
    body="Atrophy Tabard +3",
    hands="Lethargy Gantherots +3",
    legs="Lethargy Fuseau +3",
    feet="Lethargy Houseaux +3",
    neck="Duelist's Torque +2",
    waist="Obstinate Sash",
    left_ear="Regal Earring",
    right_ear="Lethargy Earring +1",-- 8 fc
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back=gear.sucellos.enfeeble     -- 10 fc
  }                                 -- 
  sets.Magic['Absorb-TP'] = set_combine(sets.Magic.Stun, {
    neck="Erra Pendant"
  })
  sets.Magic.Aspir = sets.Magic['Absorb-TP']
  sets.Magic.Drain = sets.Magic['Absorb-TP']

  sets.Magic.Bio = { -- DOT depends on dark magic skill, but attack down is static
    neck="Erra Pendant",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back="Perimede Cape"
  }

  -- Weapon Skill
  sets.WS = {}
  sets.WS['Savage Blade'] = {
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Lethargy houseaux +3 ",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring="Metamorph Ring +1",
    right_ring="Epaminondas's Ring",
    back=gear.sucellos.savage
  }
  sets.WS['Black Halo'] = {
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Lethargy houseaux +3 ",
    neck="Duelist's Torque +2",
    waist="Sailfi Belt +1",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring="Metamorph Ring +1",
    right_ring="Epaminondas's Ring",
    back=gear.sucellos.savage
  }
  sets.WS['Circle Blade'] = sets.WS['Savage Blade']
  sets.WS.Requiescat = {
    ammo="Regal Gem",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Lethargy houseaux +3 ",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back=gear.sucellos.enfeeble
  }
  sets.WS['Chant du Cygne'] = {
    ammo="Yetshila +1",
    head="Malignance Chapeau",     -- Blistering Sallet +1 augmented
    body="Ayanmo Corazza +2",
    hands="Bunzi's Gloves",
    legs="Ayanmo Cosciales +2",    -- Zoar Subligar +1 augmented
    feet="Thereoid Greaves",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Mache Earring +1",
    right_ear="Sherida Earring",
    left_ring="Begrudging Ring",
    right_ring="Ilabrat Ring",
    back=gear.sucellos.cdc
  }
  sets.WS.Evisceration = sets.WS['Chant du Cygne']
  sets.WS['Sanguine Blade'] = {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Nyame Mail",
    hands="Jhakri Cuffs +2",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Metamorph Ring +1",
    right_ring="Archon Ring",
    back=gear.sucellos.sanguine
  }
  sets.WS['Seraph Blade'] = {
    ammo="Pemphredo Tathlum",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Jhakri Cuffs +2",
    legs="Nyame Flanchard",
    feet="Lethargy houseaux +3 ",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Moonshade earring",
    left_ring="Metamorph Ring +1",
    right_ring="Weatherspoon Ring +1",
    back=gear.sucellos.sanguine
  }
  sets.WS['Flash Nova'] = sets.WS['Seraph Blade']
  sets.WS['Red Lotus Blade'] = set_combine(sets.WS['Seraph Blade'], { right_ring="Epaminondas's Ring" })
  sets.WS['Burning Blade'] = sets.WS['Red Lotus Blade']
  sets.WS['Aeolian Edge'] = sets.WS['Red Lotus Blade']
  sets.WS['Death Blossom'] = sets.WS['Savage Blade']
  sets.WS['Empyreal Arrow'] = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ilabrat Ringlet",
    back=gear.sucellos.savage
  }
end

function precast(spell)
  precast_cancelations(spell)

  if spell.type == 'WeaponSkill' then
    equip(sets.WS[spell.english] or sets.WS['Savage Blade'])

    if spell.english == 'Sanguine Blade' or
       spell.english == 'Seraph Blade' or
       spell.english == 'Red Lotus Blade' or
       spell.english == 'Burning Blade' then
      equip_elemental_waist(spell)
    end

  elseif spell.type == "JobAbility" then
    equip(sets.JAs[spell.english])

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.FastCast)
    if spell.english == 'Dispelga' then
      equip({ main = "Daybreak" })
    end
  end

  -- If engaged, don't allow weapons to swap
  if WeaponLock.value and player.status == 'Engaged' then
    equip({ main=player.equipment.main, sub=player.equipment.sub })
  end
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

  if string.find(eng, 'Cure') and spell.target.type == 'SELF' then
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
    equip(set_combine(sets.Magic.SpellInterrupt, sets.Magic.FastCast))

  elseif spell.skill == 'Enhancing Magic' then
    equip(set_for_enhancing(spell))
    -- local set

    -- if spell.target.type ~= 'SELF' and buffactive['Composure'] then
    --   -- Maximize duration for others
    --   equip(sets.Magic.EnhancingComposure)
    -- else
    --   -- Maximize duration for self
    --   equip(sets.Magic.EnhancingDuration)
    -- end

    -- -- Add spell-specific enhancements
    -- if string.find(eng, 'Refresh') then
    --   equip(sets.Magic.Refresh)
    --   if spell.target.type == 'SELF' then
    --     equip(sets.Magic.RefreshSelf)
    --   end
    -- elseif eng == 'Aquaveil' then
    --   equip(sets.Magic.Aquaveil)
    -- elseif eng == 'Stoneskin' then
    --   equip(sets.Magic.Stoneskin)
    -- elseif string.find(eng, 'Gain-') then
    --   equip(sets.Magic.Gain)
    -- elseif eng == 'Phalanx' then
    --   equip(sets.Magic.Phalanx)
    -- elseif starts_with(eng, 'En') or string.find(eng, 'Temper') then
    --   equip(sets.Magic.EnhancingSkill)
    -- end

  elseif spell.skill == 'Enfeebling Magic' then
    equip(set_for_enfeeble(eng))

  elseif spell.skill == 'Elemental Magic' then
    equip(sets.Magic.Elemental[NukingMode.current])
    equip_elemental_waist(spell)
    if spell.element == 'Earth' then
      equip({neck = 'Quanpur Necklace'})
    end

  elseif S{'Bio', 'Bio II', 'Bio III'}:contains(eng) then
    equip(sets.Magic.Bio)

  elseif sets.Magic[spell.name] then
    equip(sets.Magic[spell.name])

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.SpellInterrupt)
  end

  -- If engaged, don't allow weapons to swap
  if WeaponLock.value and player.status == 'Engaged' then
    equip({ main=player.equipment.main, sub=player.equipment.sub })
  end
end

function set_for_enfeeble(name)
  local set

  -- Maximixe duration
  if buffactive['Styme'] or S{'Dia', 'Dia II', 'Dia III'}:contains(name) then
    set = sets.Magic.EnfeebleMaxDuration
  
  -- Dispelga (Macc + Daybreak)
  elseif name == 'Dispelga' then
    set = set_combine(sets.Magic.EnfeebleAccuracy, { main = "Daybreak", sub = "Ammurapi Shield" })

  -- Frazzle skill cap
  elseif S{'Frazzle III', 'Poison II'}:contains(name) then
    set = sets.Magic.Frazzle3

  -- Distract skill cap
  elseif name == 'Distract III' then
    set = sets.Magic.Distract3

  -- General potency spells
  elseif S{'Paralyze', 'Paralyze II', 'Slow', 'Slow II', 'Addle', 'Addle II', 'Blind', 'Blind II'}:contains(name) then
    set = sets.Magic.EnfeeblePotency

  -- Spells that only need accuracy
  else
    set = sets.Magic.EnfeebleAccuracy
  end

  -- Equip shield if not able to dual wield
  if dual_wield_job() == false and set.main ~= 'Contemplator +1' then
    set.sub = 'Ammurapi Shield'
  end

  if set.ranged == 'Ullr' and WeaponLock.value and player.status == 'Engaged' then
    set.ranged = ''
    set.ammo = 'Regal Gem'
  end

  return set
end

function set_for_enhancing(spell)
  local set
  local name = spell.name

  if spell.target.type ~= 'SELF' and buffactive['Composure'] then
    -- Maximize duration for others
    set = sets.Magic.EnhancingComposure
  else
    -- Maximize duration for self
    set = sets.Magic.EnhancingDuration
  end

  if string.find(name, 'Refresh') then
    set = set_combine(set, sets.Magic.Refresh)
    if spell.target.type == 'SELF' then
      set = set_combine(set, sets.Magic.RefreshSelf)
    end

  elseif name == 'Aquaveil' then
    set = set_combine(set, sets.Magic.Aquaveil)

  elseif name == 'Stoneskin' then
    set = set_combine(set, sets.Magic.Stoneskin)

  elseif string.find(name, 'Gain-') then
    set = set_combine(set, sets.Magic.Gain)

  elseif name == 'Phalanx' then
    set = set_combine(set, sets.Magic.Phalanx)

  elseif name == 'Regen II' then
    set = set_combine(set, sets.Magic.Regen)

  elseif starts_with(name, 'En') or string.find(name, 'Temper') then
    set = set_combine(set, sets.Magic.EnhancingSkill)
  end

  return set
end

function starts_with(str, start)
  return str:sub(1, #start) == start
end

function aftercast(spell)
  equip(set_for_current_mode())
end

function status_change(new, old)
  equip(set_for_current_mode())
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
    equip(set_for_engaged())

  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
      equip(set_for_engaged())
      define_aliases()
    end

  elseif command == 'idle' then
    equip(set_for_current_mode())

  elseif command == 'savage_black_halo' then
    if player.equipment.main == 'Maxentius' then
      send_command('@input /ws "Black Halo" <t>')
    elseif player.equipment.main == 'Tauret' then
      send_command('@input /ws "Evisceration" <t>')
    else
      send_command('@input /ws "Savage Blade" <t>')
    end
  end
end

function set_for_current_mode()
  if player.status == 'Engaged' then
    return set_for_engaged()
  else
    local set = sets.Idle
    if player.mpp < 50 then
      set.waist = 'Fucho-no-Obi'
    end
    return set
  end
end

function set_for_engaged()
  local set = sets.Engaged[PrimaryMode.current]

  -- Equip shield and back if single wielding
  if dual_wield_job() == false then
    set = set_combine(set, {
      sub="Ammurapi Shield",
      back=gear.sucellos.singleWield
    })
  end

  -- Equip additional DT gear
  if Hybrid.value == true then
    set = set_combine(set, sets.Hybrid)
  end

  -- Equip elemental obi if enspell matches day/weather
  if set.waist == "Orpheus's Sash" then
    local element = active_enspell()
    if element ~= nil then
      local intensity = get_total_element_intensity(element)
      if intensity >= 2 then
        set.waist = "Hachirin-no-Obi"
      end
    end
  end

  return set
end

function active_enspell()
  if buffactive['Enstone'] then
    return 'Earth'
  elseif buffactive['Enwater'] then
    return 'Water'
  elseif buffactive['Enaero'] then
    return 'Wind'
  elseif buffactive['Enblizzard'] then
    return 'Ice'
  elseif buffactive['Enfire'] then
    return 'Fire'
  elseif buffactive['Enthunder'] then
    return 'Lightning'
  end
end
