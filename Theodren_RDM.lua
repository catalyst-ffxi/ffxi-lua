include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')
include('utils.lua')

function define_modes()
  -- PrimaryMode = M{
  --   ['description'] = 'Primary Mode',
  --   'EnspellTP',
  --   'PhysicalTP',
  --   'MaxentiusTP',
  --   'EnspellDaggerTP'
  -- }

  PrimaryMode = M{
    ['description'] = 'Primary Mode',
    'CrocDaybreak',
    'CrocTauret',
    'Naegling',
    'Maxentius'
  }

  NukingMode = M{['description'] = 'Nuking Mode', 'Normal', 'MagicBurst'}
  Element = M{['description'] = 'Primary Element', 'Thunder', 'Blizzard', 'Fire', 'Aero', 'Water', 'Stone'}
  Gain = M{['description'] = 'Gain Spell', 'MND', 'INT', 'STR'}
  Hybrid = M(false, 'Hybrid')
  WeaponLock = M(true, 'WeaponLock')
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
  send_command("alias g15v2_m1g2 gs c cycle Hybrid")
  send_command("alias g15v2_m1g3 gs c cycle NukingMode")
  send_command("alias g15v2_m1g4 gs c cycle Element")
  send_command("alias g15v2_m1g5 gs c cycle WeaponLock")
end

function get_sets()
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
    body="Atrophy Tabard +3",       -- 3 Refresh
    hands="Nyame Gauntlets",        -- 7 DT
    legs="Carmine Cuisses +1",      -- Zoomies
    feet="Nyame Sollerets",         -- 7
    neck="Loricate Torque +1",      -- 6 DT
    waist="Flume Belt +1",          -- 4 PDT
    left_ear="Eabani Earring",      -- Meva
    right_ear="Odnowa Earring +1",  -- 2 MDT, 3 DT
    left_ring="Defending Ring",     -- 10 DT
    right_ring="Gelatinous Ring +1",-- 7 PDT
    back=gear.sucellos.enfeeble,    -- 10 PDT
  }                                 -- 8 Refresh, 50 PDT, 27 MDT

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
  sets.Magic.Healing = {
    ammo="Regal Gem",             -- MND
    head="Vanya Hood",            -- 10%, Skill
    body="Kaykaus Bliaut +1",     -- CP II
    hands="Kaykaus Cuffs +1",     -- 11%, MND
    legs="Atrophy Tights +3",     -- 12%, Skill
    feet="Vanya Clogs",           -- 5%, Skill
    neck="Incanter's Torque",     -- Skill
    waist="Obstinate Sash",       -- MND
    left_ear="Regal Earring",     -- MND
    right_ear="Mendi. Earring",   -- 5%
    left_ring=gear.stikini.left,  -- Skill, MND
    right_ring=gear.stikini.right,-- Skill, MND
    back=gear.sucellos.enfeeble   -- 10%
  }
  sets.Magic.HealingSelf = {
    ammo="Regal Gem",           -- MND
    head="Vanya Hood",          -- 10%, Skill
    body="Kaykaus Bliaut +1",   -- CP II
    hands="Kaykaus Cuffs +1",   -- 11%, MND
    legs="Atrophy Tights +3",   -- 12%, Skill
    feet="Vanya Clogs",         -- 5%, Skill
    neck="Phalaina Locket",     -- 4% self
    waist="Gishdubar Sash",     -- 10% self
    left_ear="Regal Earring",   -- MND
    right_ear="Mendi. Earring", -- 5%
    left_ring='Kunaji Ring',    -- 5% self
    right_ring=gear.stikini.right,-- Skill, MND
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
    main="Colada",
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
    right_ring="Weatherspoon Ring +1",
    back="Ghostfyre Cape"
  }
  sets.Magic.EnhancingComposure = {
    main="Colada",
    sub="Ammurapi Shield",
    ammo="Sapience orb",
    head="Lethargy Chappel +1",
    body="Lethargy Sayon +1",
    hands="Atrophy Gloves +3",
    legs="Lethargy Fuseau +1",
    feet="Lethargy Houseaux +1",
    neck="Duelist's Torque +2",
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Weatherspoon Ring +1",
    back="Ghostfyre Cape"
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
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
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
    sub="Daybreak",
    ammo="Regal Gem",
    head="Atrophy Chapeau +3",
    body="Atrophy Tabard +3",
    hands="Kaykaus Cuffs +1",
    legs="Chironic Hose",
    feet="Vitiation Boots +3",
    neck="Duelist's Torque +2",
    waist="Obstinate Sash",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back=gear.sucellos.enfeeble -- MND+20/Macc+30
  }
  -- Slow2/Paralyze2/Addle2/Blind2:
  sets.Magic.EnfeeblePotency = {
    main="Naegling",
    sub="Daybreak",
    ammo="Regal Gem",
    head="Vitiation Chapeau +3",
    body="Lethargy Sayon +1",
    hands="Kaykaus Cuffs +1",
    legs="Chironic Hose",
    feet="Vitiation Boots +3",
    neck="Duelist's Torque +2",
    waist="Obstinate Sash",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back=gear.sucellos.enfeeble
  }
  -- Distract3/Frazzle3:
  -- sets.Magic.EnfeebleSkill = set_combine(sets.Magic.EnfeeblePotency, {
  --   main="Contemplator +1",
  --   sub="Mephitis Grip",
  --   waist="Rumination Sash",
  --   right_ear="Vor Earring"
  -- })
  -- Frazzle III skill cap is 625
  sets.Magic.Frazzle3 = set_combine(sets.Magic.EnfeeblePotency, {
    main="Contemplator +1",
    sub="Mephitis Grip",
    right_ear="Vor Earring"
  })
  -- Distract III skill cap is 610
  sets.Magic.Distract3 = set_combine(sets.Magic.EnfeeblePotency, {
    main="Contemplator +1",
    sub="Enki Strap"
  })

  -- Dia (maximize duration):
  sets.Magic.EnfeebleDia = {
    ammo="Regal Gem",
    head="Lethargy Chappel +1",
    body="Lethargy Sayon +1",
    hands="Lethargy Gantherots +1",
    legs="Lethargy Fuseau +1",
    feet="Lethargy Houseaux +1",
    waist="Obstin. Sash",
    left_ring="Kishar Ring"
  }

  -- Nukes
  sets.Magic.Elemental = {}
  sets.Magic.Elemental.Normal = {
    main={ name="Daybreak", priority=2 },
    sub={ name="Ammurapi Shield", priority=1 },
    ammo="Pemphredo Tathlum",
    head="C. Palug Crown",
    body="Amalric Doublet +1",
    hands="Amalric Gages +1",
    legs="Amalric Slops +1",
    feet="Amalric Nails +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring="Shiva Ring +1",
    back=gear.sucellos.nuke
  }
  sets.Magic.Elemental.MagicBurst = set_combine(sets.Magic.Elemental.Normal, {
    main="Maxentius",           -- MB +4
    head="Ea Hat",              -- MB +6 | MB II +6
    neck="Mizu. Kubikazari",    -- MB +10|
    body="Ea Houppelande",      -- MB +8 | MB II +8
    hands="Amalric Gages +1",   --       | MB II +5
    rring="Mujin Band",         --       | MB II +5
    legs="Ea Slops",            -- MB +7 | MB II +7
    feet="Jhakri Pigaches +2",  -- MB +7
  })                            -- MB +42| MB II +31

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
    waist="Obstinate Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",-- 4 fc
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back=gear.sucellos.nuke
  }                             -- 40 + 30 + 8 = 78 fc
  sets.Magic['Absorb-TP'] = sets.Magic.Stun
  sets.Magic.Aspir = {
    main="Crocea Mors",
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head="Atrophy Chapeau +3",
    body="Atrophy Tabard +3",
    hands="Jhakri Cuffs +2",
    legs="Chironic Hose",
    -- feet=augments.merlinic.crackows.nuke,
    feet="Vitiation Boots +3",
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back=gear.sucellos.nuke
  }
  sets.Magic.Drain = sets.Magic.Aspir
  sets.Magic.Bio = { -- DOT depends on dark magic skill, but attack down is static
    neck="Erra Pendant",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
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
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Duelist's Torque +2",
    waist="Sailfi Belt +1",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring="Shukuyu Ring",
    right_ring="Epaminondas's Ring",
    back=gear.sucellos.savage
  }
  sets.WS['Black Halo'] = {
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Duelist's Torque +2",
    waist="Sailfi Belt +1",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring="Shukuyu Ring",
    right_ring="Epaminondas's Ring",
    back=gear.sucellos.savage
  }
  sets.WS['Circle Blade'] = sets.WS['Savage Blade']
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
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back=gear.sucellos.enfeeble
  }
  sets.WS['Chant du Cygne'] = {
    ammo="Yetshila +1",
    head="Malignance Chapeau",     -- Blistering Sallet +1 augmented
    body="Ayanmo Corazza +2",
    hands="Malignance Gloves",
    legs="Ayanmo Cosciales +2",    -- Zoar Subligar +1 augmented
    feet="Thereoid Greaves",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Mache Earring +1",
    right_ear="Sherida Earring",
    left_ring="Begrudging Ring",
    right_ring="Ilabrat Ring",
    back=gear.sucellos.singleWield -- Crit cape
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
    left_ring="Freke Ring",
    right_ring="Archon Ring",
    back=gear.sucellos.sanguine
  }
  sets.WS['Seraph Blade'] = {
    ammo="Pemphredo Tathlum",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Jhakri Cuffs +2",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Moonshade earring",
    left_ring="Freke Ring",
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
    right_ear="Enervating Earring",
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

  elseif spell.skill == 'Enhancing Magic' then
    local set

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
    elseif eng == 'Aquaveil' then
      equip(sets.Magic.Aquaveil)
    elseif eng == 'Stoneskin' then
      equip(sets.Magic.Stoneskin)
    elseif string.find(eng, 'Gain-') then
      equip(sets.Magic.Gain)
    elseif eng == 'Phalanx' then
      equip(sets.Magic.Phalanx)
    elseif starts_with(eng, 'En') or string.find(eng, 'Temper') then
      if dual_wield_job() == true then
        equip(set_combine(sets.Magic.EnhancingSkill, { sub="Pukulatmuj" }))
      else
        equip(sets.Magic.EnhancingSkill)
      end
    end

  elseif spell.skill == 'Enfeebling Magic' then
    equip(set_for_enfeeble(eng))

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
  if WeaponLock.value and player.status == 'Engaged' then
    equip({ main=player.equipment.main, sub=player.equipment.sub })
  end
end

function set_for_enhancing(target, name)
  local set
end

function set_for_enfeeble(name)
  local set

  -- Dias (Max duration)
  if S{'Dia', 'Dia II', 'Dia III'}:contains(name) then
    set = sets.Magic.EnfeebleDia

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

  -- Sabotuer bonus
  if buffactive['Saboteur'] then
    set = set_combine(set, { hands="Lethargy Gantherots +1" })
  end

  -- Equip shield of not able to dual wield
  if dual_wield_job() == false and set.sub == 'Daybreak' then
    set.sub = 'Ammurapi Shield'
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

  elseif command == 'run' then
    equip(set_for_current_mode())

  elseif command == 'savage_black_halo' then
    if player.equipment.main == 'Maxentius' then
      send_command('@input /ws "Black Halo" <t>')
      -- add_to_chat(122, 'Black Halo')
    else
      send_command('@input /ws "Savage Blade" <t>')
      -- add_to_chat(122, 'Savage Blade')
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
    -- if player.equipment.ranged ~= 'Ullr' then
      -- set.ammo = 'Homiliary'
    -- end
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
