include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'Accuracy', 'Hybrid'}
  IdleMode = M{['description'] = 'Idle Mode', 'Idle', 'PDT'}
  NukingMode = M{['description'] = 'Nuking Mode', 'Normal', 'MagicBurst'}
  Element = M{['description'] = 'Primary Element', 'Thunder', 'Blizzard', 'Fire', 'Aero', 'Water', 'Stone'}
  WeaponLock = false
end

function define_aliases()
  -- Elements
  send_command('alias tier1 input /ma "'..Element.current..'" <t>')
  send_command('alias tier2 input /ma "'..Element.current..' II" <t>')
  send_command('alias tier3 input /ma "'..Element.current..' III" <t>')
  send_command('alias tier4 input /ma "'..Element.current..' IV" <t>')
  send_command('alias tier5 input /ma "'..Element.current..' V" <t>')
  send_command('alias enspell input /ma "En'..Element.current:lower()..'" <me>')

  -- Function Key Shortcuts
  -- Nukes
  send_command('bind ^f1 tier2')
  send_command('bind ^f2 tier3')
  send_command('bind ^f3 tier4')
  send_command('bind ^f4 tier5')

  -- Self Buffs
  send_command('bind ^f5 gainint')
  send_command('bind ^f6 gainmnd')
  send_command('bind ^f7 gaindex')
  send_command('bind ^f8 gainstr')
  send_command('bind !f5 stoneskin')
  send_command('bind !f6 phalanx')
  send_command('bind !f7 blink')
  send_command('bind !f8 aquaveil')

  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  send_command("alias g15v2_m1g2 gs c cycle IdleMode")
  send_command("alias g15v2_m1g3 gs c cycle NukingMode")
  send_command("alias g15v2_m1g4 gs c cycle Element")
  send_command("alias g15v2_m1g5 gs c WeaponLock")
end

function define_spells()
end

function get_sets()

  define_modes()
  define_aliases()

  gear = {
    sucellos = {
      nuke = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
      enfeeble = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Cure" potency +10%','Phys. dmg. taken-10%',}},
      melee = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
      cdc = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}},
      savage = { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
    }
  }

  -- Idle Sets
  sets.Idle = {
    ammo="Homiliary",
    head="Viti. Chapeau +3",
    neck="Loricate Torque +1",
    left_ear="Genmei Earring",
    right_ear="Etiolation Earring",
    body="Atrophy Tabard +3",
    hands="Viti. Gloves +3",
    left_ring="Gelatinous Ring +1",
    right_ring="Defending Ring",
    back=gear.sucellos.enfeeble,
    waist="Fucho-no-Obi",
    legs="Carmine Cuisses +1",
    feet="Chironic Slippers"
  }
  sets.PDT = {
    ammo="Staunch Tathlum +1",
    head="Aya. Zucchetto +2",
    neck="Loricate Torque +1",
    left_ear="Genmei Earring",
    right_ear="Odnowa Earring +1",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    left_ring="Gelatinous Ring +1",
    right_ring="Defending Ring",
    back=gear.sucellos.enfeeble,
    waist="Flume Belt +1",
    legs="Carmine Cuisses +1",
    feet="Aya. Gambieras +2",
  }

  -- Engaged sets
  sets.Engaged = {}
  sets.Engaged.Normal = {
    -- main="Vitiation Sword",
    main="Naegling",
    sub="Ammurapi Shield",
    ammo="Ginsen",
    head=augments.taeon.head.tp,
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs=augments.taeon.legs.triple,
    feet="Carmine Greaves +1",
    neck="Anu Torque",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Hetairoi Ring",
    right_ring="Petrov Ring",
    back=gear.sucellos.melee
  }
  sets.Engaged.Hybrid = {
    -- main="Vitiation Sword",
    main="Naegling",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",      -- 3 DT
    head="Aya. Zucchetto +2",       -- 3 DT
    body="Ayanmo Corazza +2",       -- 6 DT
    hands="Aya. Manopolas +2",      -- 3 DT
    legs=augments.taeon.legs.triple,
    feet="Carmine Greaves +1",
    neck="Loricate Torque +1",      -- 6 DT
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Gelatinous Ring +1", -- 7 PDT
    right_ring="Defending Ring",    -- 10 DT
    back=gear.sucellos.melee        -- 10 PDT
  }                                 -- 48 PDT
  sets.Engaged.Accuracy = {
    -- main="Vitiation Sword",
    main="Naegling",
    sub="Ammurapi Shield",
    ammo="Ginsen",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Carmine Cuisses +1",
    feet="Carmine Greaves +1",
    -- neck="Sanctity Necklace",
    neck="Lissome Necklace",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back=gear.sucellos.melee
  }
  sets.Engaged.DualWield = {
    sub="Kaja Knife",
    left_ear="Suppanomimi"
  }

  -- Job Abilities
  sets.JAs = {}
  sets.JAs.Chainspell = { body="Vitiation Tabard +3" }
  sets.JAs.Saboteur = { hands="Lethargy Gantherots +1" }

  -- Magic
  sets.Magic = {}
  sets.Magic.FastCast = {
    ammo="Impatiens",
    head="Atro. Chapeau +2",
    body="Viti. Tabard +3",
    hands="Leyline Gloves",
    legs="Aya. Cosciales +2",
    feet="Carmine Greaves +1",
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back="Perimede Cape"
  }
  sets.Magic.SpellInterrupt = {
    ammo="Staunch Tathlum +1",       -- 11
    head=augments.taeon.head.SID,    -- 7
    neck="Loricate Torque +1",       -- DT
    -- lear="Halasz Earring",           -- 5
    rear="Magnetic Earring",         -- 8
    hands="Chironic Gloves",         -- 20
    left_ring="Gelatinous Ring +1",      -- DT
    right_ring="Defending Ring",      -- PDT
    waist="Rumination Sash",         -- 10
    legs="Carmine Cuisses +1",       -- 20
    feet=augments.taeon.feet.phalanx -- 9
  }

  -- Heals
  sets.Magic.Healing = {
    ammo="Regal Gem",
    head="Vanya Hood",
    body="Vanya Robe",
    hands="Kaykaus Cuffs +1",
    legs="Atrophy Tights +2",
    feet="Vanya Clogs",
    neck="Incanter's Torque",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Mendi. Earring",
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    back=gear.sucellos.enfeeble
  }
  sets.Magic.HealingSelf = {
    neck="Phalaina Locket",      -- 4% self
    left_ring='Kunaji Ring',     -- 5% self
    waist="Gishdubar Sash"       -- 10% self
  }
  sets.Magic.Cursna = {
    ammo="Sapience Orb",
    head="Vanya Hood",
    body="Vanya Robe",
    hands="Leyline Gloves",  -- Pick up some vanya cuffs for healing skill
    legs="Atrophy Tights +2",
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
    -- main="Vitiation Sword",
    main="Naegling",
    sub="Ammurapi Shield",
    head="Telchine Cap",
    neck="Duelist's Torque +1",
    body="Vitiation Tabard +3",
    hands="Atrophy Gloves +3",
    back=gear.sucellos.enfeeble,
    legs="Telchine Braconi",
    feet="Lethargy Houseaux +1"
  }
  sets.Magic.EnhancingComposure = {
    -- main="Vitiation Sword",
    main="Naegling",
    sub="Ammurapi Shield",
    head="Lethargy Chappel +1",
    neck="Duelist's Torque +1",
    body="Lethargy Sayon +1",
    hands="Atrophy Gloves +3",
    back=gear.sucellos.enfeeble,
    legs="Lethargy Fuseau +1",
    feet="Lethargy Houseaux +1"
  }
  sets.Magic.Refresh = {
    head="Amalric Coif",
    body="Atrophy Tabard +3",
    legs="Lethargy Fuseau +1"
  }
  sets.Magic.RefreshSelf = {
    waist="Gishdubar sash",
  }
  sets.Magic.Regen = { -- Full set of telchine regen gear would be nice to have
    body="Telchine Chasuble"
  }
  sets.Magic.EnhancingSkill = {
    head="Befouled Crown",
    body="Viti. Tabard +3",
    hands="Viti. Gloves +3",
    legs="Atrophy Tights +2",
    feet="Leth. Houseaux +1",
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ear="Augment. Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
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
    head="Amalric Coif"
  }
  sets.Magic.Stoneskin = {
    neck="Nodens Gorget",
    waist="Siegel Sash"
  }
  sets.Magic.Gain = {
    hands="Viti. Gloves +3"
  }

  -- Enfeebles
  sets.Magic.EnfeebleAccuracy = {
    -- main="Vitiation Sword",
    main="Naegling",
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head="Viti. Chapeau +3",
    body="Atrophy Tabard +3",
    hands="Kaykaus Cuffs +1",
    legs="Chironic Hose",
    feet="Vitiation Boots +3",
    neck="Duelist's Torque +1",
    waist="Rumination Sash",
    left_ear="Regal Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back=gear.sucellos.enfeeble
  }
  sets.Magic.EnfeeblePotency = set_combine(sets.Magic.EnfeebleAccuracy, {
    body="Lethargy Sayon +1"
  })
  sets.Magic.FrazzleDistract3 = set_combine(sets.Magic.EnfeebleAccuracy, {
    main=augments.grio.enfeeble,
    sub="Mephitis Grip",
    body="Lethargy Sayon +1",
    hands="Leth. Gantherots +1",
    legs="Psycloth Lappas"
  })
  sets.Magic.EnfeebleDuration = set_combine(sets.Magic.EnfeebleAccuracy, {
    left_ring="Kishar Ring"
  })

  -- Nukes
  sets.Magic.Elemental = {}
  sets.Magic.Elemental.Normal = {
    main=augments.grio.nuke,
    sub="Enki Strap",
    ammo="Ombre Tathlum +1",
    head=augments.merlinic.hood.nuke,
    body="Merlinic Jubbah",
    hands=augments.chironic.gloves.nuke,
    legs=augments.merlinic.shalwar.macc,
    feet="Vitiation Boots +3",
    neck="Sanctity Necklace",
    waist="Refoccilation Stone",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring",
    right_ring="Strendu Ring",
    back=gear.sucellos.nuke
  }
  sets.Magic.Elemental.MagicBurst = set_combine(sets.Magic.Elemental.Normal, {
    head="Ea Hat",              -- MB +6 | MB II +6
    neck="Mizu. Kubikazari",    -- MB +10|
    body="Ea Houppelande",      -- MB +8 | MB II +8
    hands="Amalric Gages",      --       | MB II +5
    lring="Mujin Band",         --       | MB II +5
    rring="Locus Ring",         -- MB +5 |
    legs="Ea Slops",            -- MB +7 | MB II +7
    feet="Jhakri Pigaches +2",  -- MB +7
  })                            -- MB +43| MB II +31

  -- Dark
  sets.Magic.Stun = {
    -- main="Vitiation Sword",
    main="Naegling",
    sub="Ammurapi Shield",
    ammo="Regal Gem",  -- Ambu bow actually provides more MACC if you have it
    head="Atrophy Chapeau +2",
    body="Atrophy Tabard +3",
    hands="Kaykaus Cuffs +1",
    legs="Chironic Hose",  -- MACC augments
    feet=augments.merlinic.crackows.nuke, -- MACC augmwnts
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back=gear.sucellos.nuke -- MACC augmwnts
  }
  sets.Magic['Bio III'] = {}  -- TODO

  -- Enmity...?!
  --
  sets.Enmity = {
    ammo="Sapience Orb",           -- 2
    head="Halitus Helm",           -- 8
    -- neck="Moonlight Necklace",     -- 15
    left_ear="Trux Earring",       -- 5
    right_ear="Friomisi Earring",  -- 2
    body="Emet Harness +1",        -- 10
    -- hands="Nilas Gloves",          -- 5
    left_ring="Supershear Ring",   -- 5
    right_ring="Eihwaz Ring",      -- 5
    -- back=gear.ogma.enmity,         -- 10
    waist="Kasiri Belt",           -- 3
    -- legs="Eri. Leg Guards +1",     -- 11
    -- feet="Erilaz Greaves +1"       -- 6
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
    waist="Prosilio Belt +1",
    left_ear="Sherida Earring",
    right_ear="Moonshade Earring",
    left_ring="Shukuyu Ring",
    right_ring="Karieyh Ring +1",
    back=gear.sucellos.enfeeble
  }
  sets.WS['Chant du Cygne'] = {
    ammo="Yetshila",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Atrophy Gloves +3",
    legs=augments.taeon.legs.triple,
    feet="Thereoid Greaves",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Hetairoi Ring",
    right_ring="Ilabrat Ring",
    back=gear.sucellos.savage
  }
  sets.WS['Sanguine Blade'] = {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    neck="Sanctity Necklace",
    lear="Regal Earring",
    rear="Friomisi earring",
    body=augments.merlinic.jubbah,
    hands="Jhakri Cuffs +2",
    lring="Archon Ring",
    rring="Karieyh Ring +1",
    back=gear.sucellos.nuke,  -- TODO: INT/MAB/WSD Cape
    waist="Refoccilation Stone",
    legs="Jhakri slops +2",
    feet="Vitiation Boots +3"
  }
end

function precast(spell)
  precast_cancelations(spell)

  if spell.type == 'WeaponSkill' then
    equip(sets.WS[spell.english] or sets.WS['Savage Blade'])

    -- Use elemental obi if using Sanguine in dark day / weather
    if spell.english == 'Sanguine Blade' and (
      world.weather_element == "Dark" or world.day_element == "Dark"
    ) then
      equip({ waist = "Anrin Obi" })
    end

  elseif spell.type == "JobAbility" then
    equip(sets.JAs[spell.english])

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.FastCast)
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
  if spell.action_type == 'Magic' then
    equip(sets.Magic.SpellInterrupt)
  end

  eng = spell.english

  if string.find(eng, 'Cure') or string.find(eng, 'Curaga') then
    equip(sets.Magic.Healing)
    if spell.target.type == 'SELF' then
      equip(sets.Magic.HealingSelf)
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
      equip(sets.Magic.EnhancingSkill)
    end

  elseif spell.skill == 'Enfeebling Magic' then
    if S{'Paralyze', 'Slow II', 'Addle II', 'Dia III'}:contains(eng) then
      equip(sets.Magic.EnfeeblePotency)
    elseif S{'Distract III', 'Frazzle III'}:contains(eng) then
      equip(sets.Magic.FrazzleDistract3)
    elseif S{'Sleep', 'Sleep II', 'Sleepga'}:contains(eng) then
      equip(sets.Magic.EnfeebleDuration)
    else
      equip(sets.Magic.EnfeebleAccuracy)
    end
    if buffactive['Saboteur'] then -- Empy gloves enhance spells when Sabo is up
      equip(sets.JAs.Saboteur)
    end

  elseif spell.skill == 'Elemental Magic' then
    equip(sets.Magic.Elemental[NukingMode.current])

  elseif sets.Magic[spell.name] then
    equip(sets.Magic[spell.name])
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

  elseif command == 'WeaponLock' then
    WeaponLock = not WeaponLock
    if WeaponLock == true then
      equip(set_for_engaged())
      add_to_chat(122, 'Weapons Locked')
      disable('main', 'sub')
    else
      add_to_chat(122, 'Weapons Unlocked')
      enable('main', 'sub')
    end

  elseif command == 'run' then
    equip(set_for_current_mode())
  end
end

function set_for_current_mode()
  if player.status == 'Engaged' then
    return set_for_engaged()
  else
    return sets[IdleMode.current]
  end
end

function set_for_engaged()
  local set = sets.Engaged[PrimaryMode.current]

  if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
    set = set_combine(set, sets.Engaged.DualWield)
  end

  return set
end

function set_for_idle()
  -- local set = sets.Idle
  -- local set = sets.PDT
  -- if player.mpp <= 50 then
  --   set.waist = "Fucho-no-Obi"
  -- end
  -- return set
end
