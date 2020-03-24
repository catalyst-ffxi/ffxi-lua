include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')
include('utils.lua')

function define_modes()
  PrimaryMode = M{
    ['description'] = 'Primary Mode',
    'EnspellTP',
    'EnspellHybrid',
    'PhysicalTP',
    'PhysicalHybrid',
    'Accuracy',
    'EnspellAcc'
  }
  MainHand = M{
    ['description'] = 'MainHand',
    'Crocea Mors',
    'Naegling',
    'Maxentius',
    'Qutrub Knife'
  }
  OffHand = M{
    ['description'] = 'OffHand',
    'Daybreak',
    'Tauret',
    'Ternion Dagger +1',
    'Machaera +2',
    'Norgish Dagger'
  }
  NukingMode = M{['description'] = 'Nuking Mode', 'Normal', 'MagicBurst'}
  Element = M{['description'] = 'Primary Element', 'Thunder', 'Blizzard', 'Fire', 'Aero', 'Water', 'Stone'}
  Gain = M{['description'] = 'Gain Spell', 'MND', 'INT', 'STR'}
  WeaponLock = true
end

function define_aliases()
  -- Elements
  send_command('alias tier1 input /ma "'..Element.current..'" <t>')
  send_command('alias tier2 input /ma "'..Element.current..' II" <t>')
  send_command('alias tier3 input /ma "'..Element.current..' III" <t>')
  send_command('alias tier4 input /ma "'..Element.current..' IV" <t>')
  send_command('alias tier5 input /ma "'..Element.current..' V" <t>')
  send_command('alias enspell input /ma "En'..Element.current:lower()..'" <me>')
  send_command('alias gain input /ma "Gain-'..Gain.current..'" <me>')

  -- Function Key Shortcuts
  -- Nukes
  send_command('bind ^f1 tier2')
  send_command('bind ^f2 tier3')
  send_command('bind ^f3 tier4')
  send_command('bind ^f4 tier5')

  -- Self Buffs
  send_command('bind ^f5 gain')
  send_command('bind ^f6 temper2')
  send_command('bind ^f7 enspell')
  send_command('bind !f5 stoneskin')
  send_command('bind !f6 phalanx')
  send_command('bind !f7 blink')
  send_command('bind !f8 aquaveil')

  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  send_command("alias g15v2_m1g2 gs c cycle IdleMode")
  send_command("alias g15v2_m1g3 gs c cycle NukingMode")
  send_command("alias g15v2_m1g4 gs c cycle Element")
  send_command("alias g15v2_m1g5 gs c cycle MainHand")
  send_command("alias g15v2_m1g6 gs c cycle OffHand")

  -- send_command("alias g15v2_m1g5 gs c WeaponLock")
  -- send_command("alias g15v2_m1g6 gs c cycle Gain")
  -- send_command("alias ullr gs c Ullr")

  -- send_command('bind !f9 input /item "Echo Drops" <me>')
  -- send_command('bind !f10 input /item "Remedy" <me>')
  -- send_command('bind !f11 input /item "Holy Water" <me>')
end

function define_spells()
end

function get_sets()
  send_command('lua load debuffed')
  define_modes()
  define_aliases()

  gear = {
    sucellos = {
      nuke = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
      enfeeble = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Cure" potency +10%','Phys. dmg. taken-10%',}},
      singleWield = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
      dualWield = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10',}},
      cdc = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}},
      savage = { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
      sanguine = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}},
    }
  }

  -- Idle Sets
  sets.Idle = {
    ammo="Homiliary",               -- 1 Refresh
    head="Viti. Chapeau +3",        -- 3 Refresh
    neck="Loricate Torque +1",      -- 6 DT
    left_ear="Genmei Earring",      -- 2 PDT
    right_ear="Etiolation Earring", -- 3 MDT
    body="Atrophy Tabard +3",       -- 3 Refresh
    hands="Viti. Gloves +3",        -- malig gloves plz
    left_ring="Defending Ring",     -- 10 DT
    right_ring="Gelatinous Ring +1",-- 7 PDT
    back=gear.sucellos.enfeeble,    -- 10 PDT
    waist="Fucho-no-Obi",           -- 1 Refresh
    legs="Carmine Cuisses +1",      -- Zoomies
    feet="Malignance Boots",        -- 4 DT
  }                                 -- 8 Refresh, 39 PDT, 22 MDT

  -- Engaged sets
  sets.Engaged = {}
  sets.Engaged.EnspellTP = {
    ammo="Aurgelmir Orb",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Aya. Manopolas +2",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Orpheus's Sash",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Hetairoi Ring",
    right_ring="Chirich Ring +1",
    back=gear.sucellos.singleWield
  }
  sets.Engaged.EnspellHybrid = set_combine(sets.Engaged.EnspellTP, {
    left_ring="Defending Ring"
  })
  sets.Engaged.PhysicalTP = {
    ammo="Aurgelmir Orb",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands=augments.taeon.hands.tp, -- malig gloves would be nice
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Dedition Earring",
    right_ear="Sherida Earring",
    left_ring="Hetairoi Ring",
    right_ring="Chirich Ring +1",
    back=gear.sucellos.singleWield
  }
  sets.Engaged.PhysicalHybrid = set_combine(sets.Engaged.PhysicalTP, {
    left_ring="Defending Ring"
  })
  sets.Engaged.Accuracy = {
    ammo="Aurgelmir Orb",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Aya. Manopolas +2",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Ilabrat Ring",
    right_ring="Chirich Ring +1",
    back=gear.sucellos.singleWield
  }
  -- Special set for doing enspells with 1 DMG daggers
  sets.Engaged.EnspellAcc = {
    ranged="Ullr",
    head="Malignance Chapeau",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Hetairoi Ring",
    right_ring="Stikini Ring +1",
    back=gear.sucellos.singleWield
  }

  -- Job Abilities
  sets.JAs = {}
  sets.JAs.Chainspell = { body="Vitiation Tabard +3" }
  sets.JAs.Saboteur = { hands="Lethargy Gantherots +1" }

  -- Magic
  sets.Magic = {}
  sets.Magic.FastCast = {      -- 38 fc (base+jp)
    ammo="Impatiens",          -- 2 quick
    head="Atrophy Chapeau +3", -- 16 fc
    body="Viti. Tabard +3",    -- 15 fc
    hands="Leyline Gloves",    -- 7 fc
    legs="Aya. Cosciales +2",  -- 6 fc
    feet="Carmine Greaves +1", -- 8 fc
    neck="Orunmila's Torque",  -- 5 fc
    waist="Witful Belt",       -- 4 fc, 3 quick
    left_ear="Loquac. Earring",-- 2 fc
    right_ear="Malignance Earring",-- 4 fc
    left_ring="Kishar Ring",   -- 4 fc
    right_ring="Rahab Ring",   -- 2 fc
    back="Perimede Cape"       -- 4 quick
  }                            -- capped fc, 9 quick
  sets.Magic.SpellInterrupt = {
    ammo="Staunch Tathlum +1",       -- 11
    head=augments.taeon.head.SID,    -- 7
    neck="Loricate Torque +1",       -- DT
    rear="Magnetic Earring",         -- 8
    left_ring="Defending Ring",     -- PDT
    right_ring="Gelatinous Ring +1",  -- DT
    waist="Rumination Sash",         -- 10
    legs="Carmine Cuisses +1",       -- 20
    feet=augments.taeon.feet.phalanx -- 9
  }

  -- Heals
  --
  -- TODO: Make sets for engaged (no weapon swap) vs backline mage
  -- sets.Magic.Healing2 = { Self={}, Others={} }
  -- sets.Magic.Healing2.Others.Engaged = {
  --   ammo="Regal Gem",             -- MND
  --   head="Vanya Hood",            -- 10%, Skill
  --   body="Viti. Tabard +3",       -- Skill
  --   hands="Kaykaus Cuffs +1",     -- 11%, MND
  --   legs="Atrophy Tights +3",     -- 12%, Skill
  --   feet="Vanya Clogs",           -- 5%, Skill
  --   neck="Incanter's Torque",     -- Skill
  --   waist="Luminary Sash",        -- MND
  --   left_ear="Regal Earring",     -- MND
  --   right_ear="Mendi. Earring",   -- 5%
  --   left_ring="Stikini Ring +1",  -- Skill, MND
  --   right_ring="Stikini Ring +1", -- Skill, MND
  --   back=gear.sucellos.enfeeble   -- 10%
  -- }
  -- sets.Magic.Healing2.Others.Backline = {
  --   main="Daybreak",
  --   sub="Ammurapi"
  --   ammo="Regal Gem",             -- MND
  --   head="Vanya Hood",            -- 10%, Skill
  --   body="Viti. Tabard +3",       -- Skill
  --   hands="Kaykaus Cuffs +1",     -- 11%, MND
  --   legs="Atrophy Tights +3",     -- 12%, Skill
  --   feet="Vanya Clogs",           -- 5%
  --   neck="Incanter's Torque",     -- Skill
  --   waist="Luminary Sash",        -- MND
  --   left_ear="Regal Earring",     -- MND
  --   right_ear="Mendi. Earring",   -- 5%
  --   left_ring="Stikini Ring +1",  -- Skill, MND
  --   right_ring="Stikini Ring +1", -- Skill, MND
  --   back=gear.sucellos.enfeeble   -- 10%
  -- }
  -- sets.Magic.Healing2.Self.Engaged = {}
  -- sets.Magic.Healing2.Self.Backline = {}
  --
  sets.Magic.Healing = {
    ammo="Regal Gem",             -- MND
    head="Vanya Hood",            -- 10%, Skill
    body="Viti. Tabard +3",       -- Skill
    hands="Kaykaus Cuffs +1",     -- 11%, MND
    legs="Atrophy Tights +3",     -- 12%, Skill
    feet="Vanya Clogs",           -- 5%, Skill
    neck="Incanter's Torque",     -- Skill
    waist="Luminary Sash",        -- MND
    left_ear="Regal Earring",     -- MND
    right_ear="Mendi. Earring",   -- 5%
    left_ring="Stikini Ring +1",  -- Skill, MND
    right_ring="Stikini Ring +1", -- Skill, MND
    back=gear.sucellos.enfeeble   -- 10%
  }
  sets.Magic.HealingSelf = {
    ammo="Regal Gem",           -- MND
    head="Vanya Hood",          -- 10%, Skill
    body="Viti. Tabard +3",     -- Skill
    hands="Kaykaus Cuffs +1",   -- 11%, MND
    legs="Atrophy Tights +3",   -- 12%, Skill
    feet="Vanya Clogs",         -- 5%, Skill
    neck="Phalaina Locket",     -- 4% self
    waist="Gishdubar Sash",     -- 10% self
    left_ear="Regal Earring",   -- MND
    right_ear="Malignance Earring",-- MND
    left_ring='Kunaji Ring',    -- 5% self
    right_ring="Stikini Ring +1",-- Skill, MND
    back=gear.sucellos.enfeeble -- 10%
  }
  sets.Magic.Cursna = {
    ammo="Sapience Orb",
    head="Vanya Hood",
    body="Viti. Tabard +3",
    hands="Leyline Gloves",  -- hieros mittens
    legs="Atrophy Tights +3",
    feet="Vanya Clogs",
    neck="Malison Medallion",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    back="Oretan. Cape +1",
  }

  -- Enhancing
  sets.Magic.EnhancingDuration = {
    main=augments.colada.enhancing,
    sub="Ammurapi Shield",
    ammo="Sapience orb",
    head="Telchine Cap",
    body="Vitiation Tabard +3",
    hands="Atrophy Gloves +3",
    legs="Telchine Braconi",
    feet="Lethargy Houseaux +1",
    neck="Duelist's Torque +2",
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Rahab Ring",
    back=gear.sucellos.enfeeble
  }
  sets.Magic.EnhancingComposure = {
    main=augments.colada.enhancing,
    sub="Ammurapi Shield",
    ammo="Sapience orb",
    head="Lethargy Chappel +1",
    body="Lethargy Sayon +1",
    hands="Atrophy Gloves +3",
    back=gear.sucellos.enfeeble,
    legs="Lethargy Fuseau +1",
    feet="Lethargy Houseaux +1",
    neck="Duelist's Torque +2",
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Rahab Ring",
    back=gear.sucellos.enfeeble
  }
  sets.Magic.Refresh = {
    head="Amalric Coif +1",
    body="Atrophy Tabard +3",
    legs="Lethargy Fuseau +1"
  }
  sets.Magic.RefreshSelf = {
    waist="Gishdubar sash",
  }
  sets.Magic.Regen = {
    body="Telchine Chasuble"
  }
  sets.Magic.EnhancingSkill = {
    main="Pukulatmuj +1",
    sub="Ammurapi Shield",
    head="Befouled Crown",
    body="Viti. Tabard +3",
    hands="Viti. Gloves +3",
    legs="Atrophy Tights +3",
    feet="Leth. Houseaux +1",
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Ghostfyre Cape",
  }
  sets.Magic.Phalanx = set_combine(sets.Magic.EnhancingSkill, {
    head=augments.taeon.head.SID,
    body="Chironic Doublet",
    hands=augments.taeon.hands.phalanx,
    legs=augments.taeon.legs.phalanx,
    feet=augments.taeon.feet.phalanx
  })
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

  -- Enfeebles
  --
  -- Silence/Dispel/Gravity/Sleep/Frazzle2:
  sets.Magic.EnfeebleAccuracy = {
    main="Crocea Mors",
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head="Vitiation Chapeau +3",
    body="Atrophy Tabard +3",
    hands="Kaykaus Cuffs +1",
    legs="Chironic Hose",
    feet="Vitiation Boots +3",
    neck="Duelist's Torque +2",
    waist="Luminary Sash",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back=gear.sucellos.enfeeble -- MND+20/Macc+30
  }
  -- Slow2/Paralyze2/Addle2/Blind2:
  sets.Magic.EnfeeblePotency = set_combine(sets.Magic.EnfeebleAccuracy, {
    main="Naegling",
    body="Lethargy Sayon +1",
  })
  -- Distract3/Frazzle3:
  sets.Magic.EnfeebleSkill = set_combine(sets.Magic.EnfeebleAccuracy, {
    main=augments.grio.enfeeble,
    sub="Mephitis Grip",
    body="Lethargy Sayon +1",
    hands="Leth. Gantherots +1",
    legs="Psycloth Lappas",
    waist="Rumination Sash",
    left_ear="Enfeebling Earring",
    right_ear="Vor Earring"
  })
  -- Dia:
  sets.Magic.EnfeebleDuration = set_combine(sets.Magic.EnfeebleAccuracy, {
    body="Lethargy Sayon +1",
    left_ring="Kishar Ring"
  })
  -- Dia (with composure active):
  sets.Magic.EnfeebleDurationComposure = set_combine(sets.Magic.EnfeebleAccuracy, {
    head="Lethargy Chappel +1",
    body="Lethargy Sayon +1",
    hands="Lethargy Gantherots +1",
    legs="Lethargy Fuseau +1",
    feet="Lethargy Houseaux +1",
    left_ring="Kishar Ring"
  })

  -- Nukes
  sets.Magic.Elemental = {}
  sets.Magic.Elemental.Normal = {
    main="Maxentius",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +2",
    body="Amalric Doublet +1",
    hands="Amalric Gages +1",
    legs="Amalric Slops +1",
    feet="Vitiation Boots +3",
    neck="Sanctity Necklace",
    waist="Refoccilation Stone",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Shiva Ring +1",
    right_ring="Strendu Ring",
    back=gear.sucellos.nuke
  }
  sets.Magic.Elemental.MagicBurst = set_combine(sets.Magic.Elemental.Normal, {
    head="Ea Hat",              -- MB +6 | MB II +6
    neck="Mizu. Kubikazari",    -- MB +10|
    body="Ea Houppelande",      -- MB +8 | MB II +8
    hands="Amalric Gages +1",      --    | MB II +5
    lring="Mujin Band",         --       | MB II +5
    rring="Locus Ring",         -- MB +5 |
    legs="Ea Slops",            -- MB +7 | MB II +7
    feet="Jhakri Pigaches +2",  -- MB +7
  })                            -- MB +43| MB II +31

  -- Dark
  sets.Magic.Stun = {
    main="Crocea Mors",        -- 20 fc
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head="Atrophy Chapeau +3", --16 fc
    body="Atrophy Tabard +3",
    hands="Kaykaus Cuffs +1",
    legs="Chironic Hose",
    feet="Vitiation Boots +3",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",-- 4 fc
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back=gear.sucellos.nuke
  }                             -- 40 + 30 + 8 = 78 fc
  sets.Magic.Aspir = {
    main="Crocea Mors",
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head="Atrophy Chapeau +3",
    body="Atrophy Tabard +3",
    hands="Merlinic Dastanas",
    legs="Chironic Hose",
    feet=augments.merlinic.crackows.nuke,
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back=gear.sucellos.nuke
  }
  sets.Magic.Drain = sets.Magic.Aspir
  sets.Magic.Bio = { -- DOT depends on dark magic skill, but attack down is static
    neck="Erra Pendant",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Perimede Cape"
  }

  -- Enmity...?! Why not!
  --
  sets.Enmity = {
    ammo="Sapience Orb",           -- 2
    head="Halitus Helm",           -- 8
    left_ear="Trux Earring",       -- 5
    right_ear="Friomisi Earring",  -- 2
    body="Emet Harness +1",        -- 10
    left_ring="Supershear Ring",   -- 5
    right_ring="Eihwaz Ring",      -- 5
    waist="Kasiri Belt",           -- 3
  }
  sets.Magic['Kurayami: Ichi'] = sets.Enmity
  sets.Magic['Hojo: Ichi'] = sets.Enmity
  sets.Magic['Dokumori: Ichi'] = sets.Enmity
  sets.Magic['Jubaku: Ichi'] = sets.Enmity

  -- Weapon Skill
  sets.WS = {}
  sets.WS['Savage Blade'] = {
    ammo="Regal Gem",
    head="Viti. Chapeau +3",
    body="Viti. Tabard +3",
    hands="Atrophy Gloves +3",
    legs="Jhakri slops +2",
    feet="Jhakri pigaches +2",
    neck="Caro Necklace",
    waist="Prosilio Belt +1",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring="Shukuyu Ring",
    right_ring="Karieyh Ring +1",
    back=gear.sucellos.savage
  }
  sets.WS.Requiescat = {
    ammo="Regal Gem",
    head="Viti. Chapeau +3",
    body="Jhakri Robe +2",
    hands="Atrophy Gloves +3",
    legs="Jhakri slops +2",
    feet="Vitiation Boots +3",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring="Stikini Ring +1",
    right_ring="Karieyh Ring +1",
    back=gear.sucellos.enfeeble
  }
  sets.WS['Chant du Cygne'] = { -- yes this set needs work!
    ammo="Yetshila +1",
    head="Malignance Chapeau",
    body="Ayanmo Corazza +2",
    hands="Atrophy Gloves +2",
    legs="Ayanmo Cosciales +2",
    feet="Thereoid Greaves",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Petrov Ring",
    right_ring="Ilabrat Ring",
    back=gear.sucellos.singleWield
  }
  sets.WS['Sanguine Blade'] = {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    neck="Sanctity Necklace",
    lear="Regal Earring",
    rear="Malignance Earring",
    body="Amalric Doublet +1",
    hands="Jhakri Cuffs +2",
    lring="Archon Ring",
    rring="Karieyh Ring +1",
    back=gear.sucellos.sanguine,
    waist="Orpheus's Sash",
    legs="Amalric Slops +1",
    feet="Vitiation Boots +3"
  }
  sets.WS['Seraph Blade'] = {
    ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +2",
    neck="Sanctity Necklace",
    lear="Malignance Earring",
    rear="Moonshade earring",
    body="Amalric Doublet +1",
    hands="Jhakri Cuffs +2",
    lring="Strendu Ring",
    rring="Karieyh Ring +1",
    back=gear.sucellos.sanguine,
    waist="Orpheus's Sash",
    legs="Amalric Slops +1",
    feet="Vitiation Boots +3"
  }
  sets.WS['Red Lotus Blade'] = sets.WS['Seraph Blade']
  sets.WS['Burning Blade'] = sets.WS['Seraph Blade']
  sets.WS['Aeolian Edge'] = sets.WS['Seraph Blade']
  sets.WS['Death Blossom'] = {  -- Macc+ build
    ammo="Regal Gem",
    head="Viti. Chapeau +3",
    body="Atrophy Tabard +3",
    hands="Jhakri Cuffs +2",
    legs="Chironic Hose",
    feet="Vitiation Boots +3",
    neck="Dls. Torque +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring="Stikini Ring +1",
    right_ring="Karieyh Ring +1",
    back=gear.sucellos.sanguine,
  }
  sets.WS['Black Halo'] = {
    ammo="Regal Gem",
    head="Viti. Chapeau +3",
    body="Viti. Tabard +3",
    hands="Atrophy Gloves +3",
    legs="Jhakri slops +2",
    feet="Jhakri pigaches +2",
    neck="Duelist's Torque +2",
    waist="Prosilio Belt +1",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring="Shukuyu Ring",
    right_ring="Karieyh Ring +1",
    back=gear.sucellos.savage
  }
  sets.WS['Empyreal Arrow'] = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Carmine Fin. Ga. +1",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Telos Earring",
    right_ear="Enervating Earring",
    left_ring="Karieyh Ring +1",
    right_ring="Arvina Ringlet +1",
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
  if WeaponLock and player.status == 'Engaged' then
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

  elseif string.find(eng, 'Cure') or string.find(eng, 'Curaga') then
    equip(sets.Magic.Healing)
    if get_total_element_intensity('Light') > 0 then
      equip({waist="Hachirin-no-Obi"})
    end

  elseif spell.skill == 'Enhancing Magic' then
    if spell.target.type ~= 'SELF' and buffactive['Composure'] then
      -- Maximize duration for others
      equip(sets.Magic.EnhancingComposure)
    else
      -- Maximize duration for self
      equip(sets.Magic.EnhancingDuration)
    end

    -- Add spell-specific enhancements
    if string.find(eng, 'Refresh') then
      equip(sets.Magic.Refresh)
      if spell.target.type == 'SELF' then
        equip(sets.Magic.RefreshSelf)
      end
    elseif string.find(eng, 'Regen') then
      equip(sets.Magic.Regen)
    elseif eng == 'Phalanx' then
      equip(sets.Magic.Phalanx)
    elseif eng == 'Aquaveil' then
      equip(sets.Magic.Aquaveil)
    elseif eng == 'Stoneskin' then
      equip(sets.Magic.Stoneskin)
    elseif string.find(eng, 'Gain-') then
      equip(sets.Magic.Gain)
    elseif starts_with(eng, 'En') or string.find(eng, 'Temper') then
      if dual_wield_job() == true then
        equip(set_combine(sets.Magic.EnhancingSkill, { sub="Pukulatmuj" }))
      else
        equip(sets.Magic.EnhancingSkill)
      end
    end

  elseif spell.skill == 'Enfeebling Magic' then
    if S{'Paralyze', 'Paralyze II', 'Slow', 'Slow II', 'Addle', 'Addle II', 'Blind', 'Blind II'}:contains(eng) then
      equip(sets.Magic.EnfeeblePotency)
    elseif S{'Distract III', 'Frazzle III', 'Poison II'}:contains(eng) then
      equip(sets.Magic.EnfeebleSkill)
    elseif S{'Dia', 'Dia II', 'Dia III', 'Bind'}:contains(eng) then
      if buffactive['Composure'] then
        equip(sets.Magic.EnfeebleDurationComposure)
      else
        equip(sets.Magic.EnfeebleDuration)
      end
    else
      equip(sets.Magic.EnfeebleAccuracy)
    end
    if buffactive['Saboteur'] and S{'Dispel', 'Dispelga', 'Silence'}:contains(eng) == false then
      equip(sets.JAs.Saboteur)
    end
    if spell.english == 'Dispelga' then
      equip({ main = "Daybreak" })
    end

  elseif spell.skill == 'Elemental Magic' then
    equip(sets.Magic.Elemental[NukingMode.current])
    equip_elemental_waist(spell)

  elseif S{'Bio', 'Bio II', 'Bio III'}:contains(eng) then
    equip(sets.Magic.Bio)

  elseif sets.Magic[spell.name] then
    equip(sets.Magic[spell.name])

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.SpellInterrupt)
  end

  -- If engaged, don't allow weapons to swap
  if WeaponLock and player.status == 'Engaged' then
    equip({ main=player.equipment.main, sub=player.equipment.sub })
  end
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

  elseif command == 'run' then
    equip(set_for_current_mode())
  end
end

function set_for_current_mode()
  if player.status == 'Engaged' then
    return set_for_engaged()
  else
    return sets.Idle
  end
end

function set_for_engaged()
  local set = sets.Engaged[PrimaryMode.current]

  -- Equip selected weapons
  if dual_wield_job() then
    set = set_combine(set, {
      main=MainHand.current,
      sub=OffHand.current,
      back=gear.sucellos.dualWield
    })
  else
    set = set_combine(set, {
      main=MainHand.current,
      sub="Ammurapi Shield",
      back=gear.sucellos.singleWield
    })
  end

  -- Equip elemental obi if enspell matches day/weather
  local element = active_enspell()
  if element ~= nil then
    local intensity = get_total_element_intensity(element)
    if intensity >= 2 then
      set = set_combine(set, { waist="Hachirin-no-Obi" })
    end
  end

  return set
end

function dual_wield_job()
  return player.sub_job == 'NIN' or player.sub_job == 'DNC'
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
