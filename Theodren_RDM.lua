include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Caster', 'Melee', 'Accuracy', 'Hybrid'}
  EnfeebleMode = M{['description'] = 'Enfeebling Mode', 'Potency', 'Accuracy'}
  NukingMode = M{['description'] = 'Nuking Mode', 'Normal', 'MagicBurst'}
  Element = M{['description'] = 'Primary Element', 'Thunder', 'Blizzard', 'Fire', 'Aero', 'Water', 'Stone'}
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
  send_command("alias g15v2_m1g3 gs c cycle NukingMode")
  send_command("alias g15v2_m1g4 gs c cycle Element")
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
      cdc = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
    }
  }

  -- Idle Sets
  sets.modes = {}
  sets.modes.Caster = {
    main="Contemplator",
    sub="Enki Strap",
    ammo="Homiliary",
    head="Viti. Chapeau +3",
    neck="Loricate Torque +1",
    left_ear="Genmei Earring",
    right_ear="Etiolation Earring",
    body="Atrophy Tabard +3",
    hands="Viti. Gloves +2",
    lring="Gelatinous Ring +1",
    rring="Defending Ring",
    back=gear.sucellos.enfeeble,
    waist="Flume Belt +1",
    legs="Carmine Cuisses +1",
    feet="Chironic Slippers"
  }
  sets.modes.Melee = {
    main="Vitiation Sword",
    sub=augments.colada.stp,
    ammo="Ginsen",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands=augments.chironic.gloves.melee,
    legs=augments.taeon.legs.triple,
    feet="Carmine Greaves +1",
    neck="Lissome Necklace",
    waist="Sarissapho. Belt",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Hetairoi Ring",
    right_ring="Petrov Ring",
    back=gear.sucellos.melee
  }
  sets.modes.Hybrid = {
    main="Vitiation Sword",
    sub=augments.colada.stp,
    ammo="Staunch Tathlum +1",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Genmei Earring",
    right_ear="Sherida Earring",
    left_ring="Hetairoi Ring",
    right_ring="Defending Ring",
    back=gear.sucellos.melee
  }
  sets.modes.Accuracy = {
    main="Vitiation Sword",
    sub=augments.colada.stp,
    ammo="Ginsen",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Carmine Cuisses +1",
    feet="Carmine Greaves +1",
    neck="Sanctity Necklace",
    waist="Sarissapho. Belt",
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Ayanmo Ring",
    right_ring="Ilabrat Ring",
    back=gear.sucellos.melee
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
    legs="Lengo Pants",
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
    lear="Halasz Earring",           -- 5
    rear="Magnetic Earring",         -- 8
    hands="Chironic Gloves",         -- 20
    left_ring="Defending Ring",      -- DT
    right_ring="Warden's Ring",      -- PDT
    waist="Rumination Sash",         -- 10
    legs="Carmine Cuisses +1",       -- 20
    feet=augments.taeon.feet.phalanx -- 9
  }

  -- Heals
  sets.Magic.Healing = {
    main="Serenity",  -- Overcapped on Potency, but staff is ignored
    sub="Enki Strap", -- when meleeing, so set is built to work without it
    ammo="Regal Gem",
    head="Vanya Hood",
    body="Vanya Robe",
    hands="Telchine Gloves",  -- Gonna replace with kaykaus +1
    legs="Atrophy Tights +2",
    feet="Vanya Clogs",
    neck="Incanter's Torque",
    waist="Penitent's Rope",
    left_ear="Halasz Earring",
    right_ear="Mendi. Earring",
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    back=gear.sucellos.enfeeble
  }
  sets.Magic.HealingSelf = {
    neck="Phalaina Locket",      -- 4% self
    hands='Buremte Gloves',      -- 13% self
    left_ring='Kunaji Ring',     -- 5% self
    waist="Gishdubar Sash"       -- 10% self
  }
  sets.Magic.Cursna = {
    main="Oranyan",
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
    main="Oranyan",             -- Should make a telchine hat too
    neck="Duelist's Torque +1",
    body="Vitiation Tabard +3",
    hands="Atrophy Gloves +2",  -- +3 this piece!
    back=gear.sucellos.enfeeble,
    legs="Telchine Braconi",
    feet="Lethargy Houseaux +1"
  }
  sets.Magic.EnhancingComposure = {
    main="Oranyan",
    head="Lethargy Chappel +1",
    neck="Duelist's Torque +1",
    body="Lethargy Sayon +1",
    hands="Atrophy Gloves +2",
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
  sets.Magic.Regen = {
    body="Telchine Chasuble"
  }
  sets.Magic.EnhancingSkill = {
    head="Befouled Crown",
    body="Viti. Tabard +3",
    hands="Viti. Gloves +2",
    legs="Carmine Cuisses +1",
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
  sets.Magic.Enspell = set_combine(sets.Magic.EnhancingSkill, {
    head="Umuthi Hat",
    hands="Aya. Manopolas +2",
    back="Ghostfyre Cape"
  })
  sets.Magic.Gain = {
    hands="Viti. Gloves +2"
  }
  sets.Magic.Temper = sets.Magic.EnhancingSkill

  -- Enfeebles
  sets.Magic.EnfeebleAccuracy = {
    main=augments.grio.enfeeble,
    sub="Enki Strap",
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
    left_ear="Strophadic Earring",
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
  })

  -- Dark
  sets.Magic.Stun = {
    main=augments.grio.enfeeble,
    sub="Enki Strap",
    ammo="Regal Gem",
    head="Atrophy Chapeau +2",
    body="Atrophy Tabard +3",
    hands="Kaykaus Cuffs +1",
    legs="Chironic Hose",
    feet=augments.merlinic.crackows.nuke,
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back=gear.sucellos.nuke
  }
  sets.Magic['Bio III'] = {}  -- TODO

  -- Weapon Skill
  sets.WS = {}
  sets.WS['Savage Blade'] = {
    ammo="Regal Gem",
    head="Viti. Chapeau +3",
    body="Viti. Tabard +3",
    hands="Jhakri Cuffs +2",
    legs="Jhakri slops +2",
    feet="Carmine Greaves +1",
    neck="Fotia Gorget",
    waist="Prosilio Belt +1",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring="Shukuyu Ring",
    right_ring="Karieyh Ring +1",
    back=gear.sucellos.cdc   -- TODO: STR/ATT/WSD Cape
  }
  sets.WS['Chant du Cygne'] = {
    ammo="Yetshila",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Jhakri Cuffs +2",
    legs=augments.taeon.legs.triple,
    feet="Thereoid Greaves",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Hetairoi Ring",
    right_ring="Ilabrat Ring",
    back=gear.sucellos.cdc
  }
  sets.WS['Sanguine Blade'] = {
    ammo="Ombre Tathlum +1",
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

  -- Lock swords if DD'ing
  if PrimaryMode.current == 'Caster' then
    enable('main', 'sub')
  else
    disable('main', 'sub')
  end

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
    elseif starts_with(eng, 'En') then
      equip(sets.Magic.Enspell)
    elseif string.find(eng, 'Gain-') then
      equip(sets.Magic.Gain)
    elseif string.find(eng, 'Temper') then
      equip(sets.Magic.Temper)
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
    -- Empy gloves enhance spells when Sabo is up
    if buffactive['Saboteur'] then
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
  if player.in_combat then
    equip(set_for_current_mode())
  end
end

function status_change(new, old)
  if new == 'Engaged' then
    equip(sets.modes[PrimaryMode.current])
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
    equip(set_for_current_mode())

  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
      equip(set_for_current_mode())
      define_aliases()
    end

  elseif command == 'run' then
    equip({ legs="Carmine Cuisses +1" })
  end
end

function set_for_current_mode()
  local set = sets.modes[PrimaryMode.current]

  -- In DD mode if I dont' have dual weild, equip a shield instead
  if PrimaryMode.current ~= 'Caster'
    and player.sub_job ~= 'NIN'
    and player.sub_job ~= 'DNC' then
    set.sub = "Beatific Shield +1"

  -- Get those MPs
  elseif PrimaryMode.current == 'Caster' and player.mpp <= 50 then
    set.waist = "Fucho-no-Obi"
  end

  return set
end
