include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Caster', 'Melee', 'Accuracy', 'Hybrid'}
  EnfeebleMode = M{['description'] = 'Enfeebling Mode', 'Potency', 'Accuracy'}
  NukingMode = M{['description'] = 'Nuking Mode', 'Normal', 'MagicBurst'}
  DamageDown = M(false, 'Damage Down')
  TreasureHunter = M(false, 'Treasure Hunter')
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
  storms = {
    Thunder = 'Thunderstorm',
    Blizzard = 'Hailstorm',
    Fire = 'Firestorm',
    Aero = 'Windstorm',
    Water = 'Rainstorm',
    Stone = 'Sandstorm'
  }
  send_command('alias storm input /ma "'..storms[Element.current]..'" <me>')

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
  send_command('bind !f5 stoneskin')
  send_command('bind !f6 phalanx')
  send_command('bind !f7 blink')
  -- send_command('bind !f8 storm')
  send_command('bind !f8 aquaveil')

  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  send_command("alias g15v2_m1g2 gs c cycle EnfeebleMode")
  send_command("alias g15v2_m1g3 gs c cycle NukingMode")
  send_command("alias g15v2_m1g4 gs c cycle Element")
  send_command("alias g15v2_m1g5 lightarts")
  send_command("alias g15v2_m1g6 darkarts")
end

function get_sets()

  define_modes()
  define_aliases()

  gear = {
    sucellos = {
      nuke = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
      enfeeble = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20',}},
      melee = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
      ws = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
    }
  }

  -- Mode Sets
  --
  sets.modes = {}
  sets.modes.Caster = {
    -- main=augments.grio.enfeeble,
    main="Contemplator",
    sub="Enki Strap",
    ammo="Homiliary",
    head="Viti. Chapeau +2",
    neck="Loricate Torque +1",
    left_ear="Hearty Earring",
    right_ear="Etiolation Earring",
    body="Atrophy Tabard +3",
    hands=augments.chironic.gloves.nuke,
    -- lring="Fortified Ring",
    lring="Gelatinous Ring +1",
    rring="Defending Ring",
    back="Solemnity Cape",
    waist="Flume Belt +1",
    legs="Carmine Cuisses +1",
    feet="Chironic Slippers"
  }
  sets.modes.Melee = {
    main=augments.colada.main,
    sub=augments.colada.dbl,
    ammo="Ginsen",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands=augments.chironic.gloves.melee,
    legs="Carmine Cuisses +1",
    feet="Carmine Greaves +1",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Hetairoi Ring",
    right_ring="Petrov Ring",
    back=gear.sucellos.melee
  }
  sets.modes.Accuracy = {
    main=augments.colada.main,
    sub=augments.colada.dbl,
    ammo="Ginsen",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Atrophy Gloves +2",
    legs="Carmine Cuisses +1",
    feet="Carmine Greaves +1",
    neck="Sanctity Necklace",
    waist="Anguinus Belt",
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Ayanmo Ring",
    right_ring="Ilabrat Ring",
    back=gear.sucellos.melee
  }
  sets.modes.Hybrid = {
    main=augments.colada.main,
    sub=augments.colada.dbl,
    ammo="Ginsen",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +1",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Telos Earring",
    right_ear="Etiolation Earring",
    left_ring="Ayanmo Ring",
    right_ring="Defending Ring",
    back=gear.sucellos.melee
  }

  -- sets.aftercast = {}
  -- sets.aftercast.Caster = {
  --   main = "Contemplator",
  --   ammo = "Homiliary",
  --   head = "Viti. Chapeau +2",
  --   neck = "Loricate Torque +1",
  --   body = "Atrophy Tabard +3",
  --   hands = augments.chironic.gloves.nuke,
  --   left_ear = "Etiolation Earring",
  --   right_ear="Hearty Earring",
  --   lring = "Gelatinous Ring +1",
  --   rring = "Defending Ring",
  --   back = "Solemnity Cape",
  --   -- legs = "Chironic Hose",
  --   legs = "Carmine Cuisses +1",
  --   feet = "Chironic Slippers"
  -- }

  -- Base Sets
  --
  sets.base = {}

  sets.DamageDown = {
    neck="Loricate Torque +1",
    left_ring="Gelatinous Ring +1",
    right_ring="Defending Ring",
    waist="Flume Belt +1"
  }

  sets.base.fast_cast = {
    -- base 30
    -- job point 8
    -- cap 80
    -- main = "Emissary",
    -- sub = "Beatific Shield +1",
    main = augments.grio.enfeeble,
    ammo = "Impatiens",
    head = "Atrophy Chapeau +2",   -- 12
    lear = "Loquacious earring",   -- 2
    rear = "Magnetic earring",
    body = "Vitiation Tabard +3", -- 15
    hands = "Helios Gloves",       -- 5
    lring = "Kishar Ring",   -- 4
    rring = "Prolix Ring",         -- 2
    -- back = "Swith Cape",           -- 3
    back = "Perimede Cape",
    waist = "Witful Belt",         -- 3
    legs = "Lengo Pants", -- 5
    feet = "Carmine Greaves +1" -- 8
  }
  sets.base.move_speed = {
    legs = "Carmine Cuisses +1"
  }
  sets.base.idle = set_combine(sets.modes.Caster, {
    legs = "Carmine Cuisses +1"
  })
  sets.base.resting = set_combine(sets.modes.Caster, {
    -- main = "Pluto's staff",
    main = "Contemplator",
    sub = "Enki Strap",
    head = "Viti. Chapeau +2",
    -- neck = "Beak Necklace +1",
    lear = "Loquacious earring",
    rear = "Magnetic earring",
    body = "Jhakri Robe +2",
    -- rring = "Bifrost Ring",
    -- back = "Intensifying Cape",
    waist = "Fucho-no-Obi"
    --waist = "Duelist's Belt"
  })

  -- Weapon Skills
  --
  sets.ws = set_combine(sets.modes.Melee, {
    head = "Jhakri Coronal +1",
    neck = "Fotia Gorget",
    hands = "Jhakri Cuffs +2",
    lear = "Ishvara earring",
    rear = "Moonshade earring",
    lring = "Ilabrat Ring",
    rring = "Ifrit Ring",
    -- waist = "Caudata Belt",
    waist = "Fotia Belt"
    -- feet = "Jhakri pigaches +1"
  })
  sets.ws.Requiescat = set_combine(sets.ws, {
  })
  sets.ws['Chant du Cygne'] = {
      ammo="Yetshila",
      head="Aya. Zucchetto +2",
      body="Ayanmo Corazza +2",
      hands="Jhakri Cuffs +2",
      legs="Aya. Cosciales +2",
      feet="Thereoid Greaves",
      neck="Fotia Gorget",
      waist="Fotia Belt",
      left_ear="Moonshade Earring",
      right_ear="Sherida Earring",
      left_ring="Hetairoi Ring",
      right_ring="Ilabrat Ring",
      back=gear.sucellos.ws
  }
  sets.ws['Savage Blade'] = {
    ammo="Ginsen",
    head="Viti. Chapeau +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +1",
    feet="Carmine Greaves +1",
    neck="Caro Necklace",
    waist="Prosilio Belt +1",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring="Shukuyu Ring",
    right_ring="Karieyh Ring +1",
    back=gear.sucellos.ws
  }
  sets.ws['Sanguine Blade'] = {
    ammo="Ombre Tathlum +1",
    head="Pixie Hairpin +1",
    neck="Sanctity Necklace",
    lear="Regal Earring",
    rear="Moonshade earring",
    body=augments.merlinic.jubbah, -- need to compare to amalric and af/relic
    hands="Jhakri Cuffs +2",
    lring="Archon Ring",
    rring="Karieyh Ring +1",
    back=gear.sucellos.nuke,  -- need a new cape with int/macc/wsd
    waist="Refoccilation Stone",
    legs=augments.merlinic.shalwar.macc, -- jhakri slops?
    feet=augments.merlinic.crackows.nuke -- vitiation boots?
  }

  -- MIDCAST
  --

  -- Dark Magic
  --
  sets.midcast = {}
  sets.midcast.dark = {
    ammo = "Ombre Tathlum +1",
    head = "Amalric Coif",
    neck = "Erra Pendant",
    lear = "Regal Earring",
    rear = "Digni. Earring",
    body = "Carmine Scale Mail",
    hands = augments.chironic.gloves.nuke,
    -- lring = "Weatherspoon Ring",
    lring = "Prolix Ring",
    rring = "Stikini Ring",
    back = gear.sucellos.nuke,
    waist = "Witful Belt",
    legs = "Lengo Pants",
    feet = augments.merlinic.crackows.nuke
  }
  sets.midcast.drain_aspir = set_combine(sets.midcast.dark, {
    neck = "Erra Pendant",
    waist = "Fucho-no-Obi"
  })
  sets.midcast.bio3 = set_combine(sets.midcast.dark, {
    legs = "Vitiation Tights"
  })
  sets.midcast.stun = set_combine(sets.midcast.dark, {
    body = "Vitiation Tabard +3",
    hands = "Helios Gloves",
    -- lring = "Weatherspoon Ring",
    rring = "Prolix Ring",
    waist = "Witful Belt",
    legs = "Lengo Pants"
  })

  -- Elemental magic
  --
  sets.midcast.elemental = {}
  sets.midcast.elemental.Normal = {
    -- main = "Contemplator",
    main = augments.grio.nuke,
    sub = "Enki Strap",
    ammo = "Ombre Tathlum +1",
    head = augments.merlinic.hood.nuke,
    neck = "Sanctity Necklace",
    lear = "Strophadic Earring",
    rear = "Friomisi earring",
    body = augments.merlinic.jubbah,
    hands = augments.chironic.gloves.nuke,
    lring = "Shiva Ring",
    rring = "Strendu Ring",
    back = gear.sucellos.nuke,
    waist = "Refoccilation Stone",
    legs = augments.merlinic.shalwar.macc,
    feet = augments.merlinic.crackows.nuke
  }
  sets.midcast.elemental.MagicBurst = set_combine(sets.midcast.elemental.Normal, {
    neck = "Mizu. Kubikazari",           -- MB +10
    lring = "Mujin Band",                -- MB II +5
    rring = "Locus Ring",                -- MB +5
    head = augments.merlinic.hood.burst,     -- MB +11
    body = augments.merlinic.jubbah,         -- MB +3
    hands = "Amalric Gages",             -- MB II +5
    legs = augments.merlinic.shalwar.burst,        -- MB +10
  })                                     -- TOTALS
                                         -- MB +39 (Caps at 40%)
                                         -- MB II +10

  -- Enfeebling Magic
  --
  sets.midcast.enfeebling = {
    main = augments.grio.enfeeble,
    sub = "Mephitis Grip",
    ammo = "Regal Gem",
    head = "Viti. Chapeau +2",
    neck = "Duelist's torque",
    lear = "Regal Earring",
    rear = "Digni. Earring",
    hands = "Lethargy Gantherots +1",
    lring = "Stikini Ring",
    rring = "Stikini Ring",
    back = gear.sucellos.enfeeble,
    waist = "Rumination Sash",
    legs = "Chironic Hose",
    feet = "Vitiation Boots +2"
  }
  sets.midcast.enfeebling.Potency = set_combine(sets.midcast.enfeebling, {
    body = "Lethargy Sayon +1"
  })
  sets.midcast.enfeebling.Accuracy = set_combine(sets.midcast.enfeebling, {
    body = "Atrophy Tabard +3"
  })
  sets.midcast.enfeebling.Duration = {
    neck = "Duelist's torque",
    rring = "Kishar Ring"
  }

  -- Enhancing Magic
  --
  sets.midcast.enhancing_skill = {
    -- sub = "Fulcio Grip"
    head = "Umuthi Hat",
    neck = "Incanter's Torque",
    rear = "Andoaa earring",
    body = "Vitiation Tabard +3",
    hands = "Vitiation Gloves +2",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back = "Ghostfyre Cape",
    waist = "Olympus Sash",
    legs = "Atrophy tights +1",
    feet = "Lethargy Houseaux +1"
  }
  sets.midcast.enhancing_duration = {
    -- main = augments.grio.nuke,
    main = "Oranyan",
    neck = "Duelist's torque",
    body = "Vitiation Tabard +3",
    hands = "Atrophy Gloves +2",
    back = gear.sucellos.enfeeble,
    legs = "Telchine Braconi",
    feet = "Lethargy Houseaux +1"
  }
  sets.midcast.enhancing_regen = {
    body = "Telchine Chasuble"
  }
  sets.midcast.enhancing_refresh = {
    head = "Amalric Coif",
    body = "Atrophy Tabard +3",
    legs = "Lethargy Fuseau +1"
  }
  sets.midcast.enhancing_refresh_self = {
    waist = "Gishdubar sash",
    feet = "Inspirited Boots"
  }
  sets.midcast.enhancing_stoneskin = {
    head = "Umuthi Hat",
    neck = "Nodens Gorget",
    waist = "Siegel Sash"
  }
  sets.midcast.enhancing_composure = {
    head = "Lethargy Chappel +1",
    body = "Lethargy Sayon +1",
    legs = "Lethargy Fuseau +1",
    feet = "Lethargy Houseaux +1"
  }
  sets.midcast.enhancing_enspell = {
    hands = "Aya. Manopolas +2",
    back = "Ghostfyre Cape"
  }

  -- Healing Sets
  --
  sets.midcast.healing = {
    -- main = "Tamaxchi",
    -- sub = "Sors Shield",
    main = "Serenity",            -- 25%
    sub = "Enki Strap",
    -- head = "Kaykaus Mitra",
    neck = "Incanter's Torque",
    rear = "Mendicant's Earring", -- 5%
    body = "Vanya Robe",          -- 7%
    -- hands = "Telchine Gloves",    -- 18%
    lring = "Ephedra Ring",
    rring = "Ephedra Ring",
    -- back = "Ghostfyre Cape",      -- 6%
    legs = "Vanya Slops",
    -- legs = "Atrophy Tights +1",    -- 10%
    feet = "Vanya Clogs"          -- 5%
                                  -- 76% total (50% cap)
  }
  sets.midcast.healing_self = {
    neck = "Phalaina Locket",  -- 4% self
    hands = 'Buremte Gloves',  -- 13% self
    lring = 'Kunaji Ring',     -- 5% self
    -- rring = 'Asklepian Ring',  -- 3% self
    waist = "Gishdubar Sash"   -- 10% self
  }                            -- 35% (30% cap)
  sets.midcast.convert = set_combine(sets.midcast.healing, sets.midcast.healing_self, {
    ammo = "Ombre Tathlum +1",
    head = "Viti. Chapeau +2",
    neck = "Weike Torque",
    lear = "Loquacious earring",
    rear = "Magnetic earring"
  })
  -- Cursna chance to clear doom affected by Healing Magic and Cursna Effect+ gear
  sets.midcast.cursna = {
    neck = "Incanter's Torque",
    rear = "Mendicant's Earring",
    body = "Vitiation Tabard +3",
    lring = "Ephedra Ring",
    rring = "Ephedra Ring",
    legs = "Atrophy Tights +1",
    feet = "Vanya Clogs"
  }

  -- Ranged Attack
  --
  -- sets.ranged = {
  --   head = "Despair Helm",
  --   neck = "Yarak torque",
  --   lear = "Drone Earring",
  --   rear = "Matanki Earring",
  --   hands = "Buremte Gloves",
  --   body = "Aetosaur Jerkin",
  --   lear = "Drone Earring",
  --   rear = "Enervating Earring",
  --   lring = "Longshot Ring",
  --   rring = "Hajduk Ring",
  --   legs = "Lethargy Fuseau +1",
  --   feet = "Despair Greaves",
  --   back = "Moondoe Mantle +1",
  --   waist = "Flax sash"
  -- }

end

function precast(spell)
  precast_cancelations(spell)

  if spell.type == 'JobAbility' then
    precast_ja(spell)

  elseif spell.action_type == 'Magic' then
    precast_magic(spell)

  elseif spell.type == 'WeaponSkill' then
    if sets.ws[spell.english] then
      equip(sets.ws[spell.english])
    else
      equip(sets.ws)
    end

  elseif spell.english == 'Ranged' then
    equip(sets.ranged)
  end

  maintain_weapon_equip()
  maintain_reraise_equip()
end

function precast_cancelations(spell)
  if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
    send_command('@wait 0.4; cancel 66; cancel 444; cancel 445')

  elseif string.find(spell.english, 'storm') and buffactive['Light Arts'] and not buffactive['Accession'] then
    cast_delay(1.3)
    send_command('@input /ja "Accession" <me>')

  elseif spell.english == 'Spectral Jig' then
    cast_delay(0.25)
    send_command('@cancel 71;')
  end
end

function use_echo_drop_or_remedy()
  if (player.inventory['Echo Drops'] and player.inventory['Echo Drops'].count > 0)
      or (player.satchel['Echo Drops'] and player.satchel['Echo Drops'].count > 0) then
		send_command('input /item "Echo Drops" <me>')
	else
		send_command('input /item "Remedy" <me>')
	end
end

function precast_ja(spell)
  if spell.english == 'Chainspell' then
    equip({body = "Vitiation Tabard +3"})

  elseif spell.english == 'Saboteur' then
    equip({hands = "Lethargy Gantherots +1"})

  elseif spell.english == 'Convert' then
    equip(sets.midcast.convert)
  end
end

function precast_magic(spell)
  equip(sets.base.fast_cast)
end

function midcast(spell)
  if spell.action_type == 'Magic' then
    midcast_magic(spell)
  end
  maintain_weapon_equip()
  maintain_reraise_equip()
end

function midcast_magic(spell)

  -- Cures and Buffs
  if spell.skill == 'Healing Magic' or spell.skill == 'Enhancing Magic' then
    eng = spell.english

    -- Cursna Potency
    if eng == "Cursna" then
      equip(sets.midcast.cursna)

    -- Cure Potency
    elseif string.find(eng, 'Cur') then
      equip(sets.midcast.healing)
      if spell.target.type == 'SELF' then
        equip(sets.midcast.healing_self)
        if player.mpp >= 98 then
          equip(sets.midcast.convert)
        end
      end

    -- Enhancing Spells
    elseif spell.skill == 'Enhancing Magic' then
      equip(sets.midcast.enhancing_duration)

      if eng == 'Stoneskin' then
        equip(sets.midcast.enhancing_stoneskin)

      elseif spell_affected_by_skill(eng) then
        equip(sets.midcast.enhancing_skill)
        if eng == 'Phalanx' then
          equip({head = augments.merlinic.hood.phalanx})
        elseif spell_is_enspell(eng) then
          equip(sets.midcast.enhancing_enspell)
        end
      else
        if spell.target.type ~= 'SELF' and buffactive['Composure'] then
          equip(sets.midcast.enhancing_composure)
        end
        if string.find(eng, 'Regen') then
          equip(sets.midcast.enhancing_regen)
        -- elseif eng == 'Refresh' or eng == 'Refresh II' or eng == 'Refresh III' then
        elseif string.find(eng, 'Refresh') then
          equip(sets.midcast.enhancing_refresh)
          if spell.target.type == 'SELF' then
            equip(sets.midcast.enhancing_refresh_self)
          end
        end
      end
    end

  -- Stuns
  elseif spell.english == 'Stun' then
    equip(sets.midcast.stun)

  elseif string.find(spell.english, 'Drain') or  string.find(spell.english, 'Aspir') then
    equip(sets.midcast.drain_aspir)

  elseif spell.english == 'Bio III' then
    equip(sets.midcast.bio3)

  elseif spell.skill == 'Dark Magic' then
    equip(sets.midcast.dark)

  -- Enfeebles
  elseif spell.skill == 'Enfeebling Magic' then
    if enfeeble_is_affected_by_potency(spell.english) then
      equip(sets.midcast.enfeebling[EnfeebleMode.current])
    else
      equip(sets.midcast.enfeebling.Accuracy)
    end
    -- Spells not impacted by enf skill should use max duration set
    if spell.english ~= 'Frazzle III' and spell.english ~= 'Distract III' then
      equip(sets.midcast.enfeebling.Duration)
    end

  -- Nukes
  elseif spell.skill == 'Elemental Magic' then
    equip(sets.midcast.elemental[NukingMode.current])
  end
end

function chat(msg)
  add_to_chat(122, msg)
end

function aftercast(spell)
  if spell.english == 'Convert' then
    send_command('/ma "Cure IV" <me>')
  end
  if player.in_combat then
    equip(sets.modes[PrimaryMode.current])
    if PrimaryMode.current == 'Caster' and player.mpp <= 50 then
      equip({waist = "Fucho-no-Obi"})
    end
    -- method = "handle_" .. PrimaryMode.current:lower() .. "_aftercast"
    -- if _G[method] ~= nil then
    --   _G[method]()
    -- else
    --   equip(sets.modes[PrimaryMode.current])
    -- end
  end
  maintain_weapon_equip()
end

-- function handle_caster_aftercast()
--   --equip(sets.base.auto_refresh)
--   equip(sets.aftercast.Caster)
--   if player.mpp <= 50 then
--     equip({waist = "Fucho-no-Obi"})
--   else
--     equip({waist = "Flume Belt +1"})
--   end
-- end

function status_change(new, old)
  if new == 'Resting' then
    equip(sets.base.resting)
  elseif new == 'Engaged' then
    equip(sets.modes[PrimaryMode.current])
    if DamageDown.current then
      equip(sets.modes.DamageDown)
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
    -- equip_set_for_current_mode()
    equip(set_for_current_mode())
  elseif command == 'cycle' then

    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
      if mode.description == 'Primary Mode' then
        -- equip(sets.modes[mode.current])
        equip(set_for_current_mode())
      elseif mode.description == 'Primary Element' then
        define_aliases()
      end
    end
  elseif command == 'idle' then
    equip(sets.base.idle)
  elseif command == 'run' then
    equip_set_for_current_mode()
    equip(sets.base.move_speed)
  end
end

function array_contains(arr, value)
  for k, v in pairs(arr) do
    if value == v then
      return true
    end
  end
  return false
end

-- Return true for enhancing spells that are skill based
--
function spell_affected_by_skill(spell_name)
  local spells = {
    'Temper', 'Temper II', 'Phalanx',
    'Enfire', 'Enblizzard', 'Enaero', 'Enstone', 'Enthunder', 'Enwater',
    -- These ARE affected, but I'm basically capped for free anyway
    -- 'Stoneskin',
    'Gain-MND', 'Gain-INT', 'Gain-STR', 'Gain-DEX', 'Gain-CHR', 'Gain-VIT'
  }
  return array_contains(spells, spell_name)
end

function spell_is_enspell(spell_name)
  local spells = {
    'Enfire', 'Enblizzard', 'Enaero', 'Enstone', 'Enthunder', 'Enwater',
  }
  return array_contains(spells, spell_name)
end

-- Return true if I care about potency for the spell
-- Spells not listed here are treated for magic accuracy only
--
function enfeeble_is_affected_by_potency(spell_name)
  local spells = {
    "Distract II", "Distract III",
    "Frazzle II", "Frazzle III",
    "Dia II", "Dia III",
    "Slow", "Slow II",
    "Paralyze", "Paralyze II",
    "Inundation",
    "Addle", "Addle II",
    "Poison", "Poison II"
  }
  return array_contains(spells, spell_name)
end

-- If currently wearing an RR earing, keep it on to avoid reseting the countdown
--
function maintain_reraise_equip()
  if player.equipment.rear == 'Reraise Earring' then
    equip({rear = 'Reraise Earring'})
  end
  if player.equipment.lear == 'Reraise Earring' then
    equip({lear = 'Reraise Earring'})
  end
end

function maintain_weapon_equip()
  if player.equipment.main == 'Colada' then
    equip({main = player.equipment.main, sub = player.equipment.sub})
  end
end

-- Determine which idle set should be worn at this time
--
function equip_set_for_current_mode()
  equip(sets.modes[PrimaryMode.current])
  if player.in_combat ~= true then
    --equip(sets.base.move_speed)
  end
  if DamageDown.value then
    equip(sets.DamageDown)
  end
end

function set_for_current_mode()
  local set = sets.modes[PrimaryMode.current]
  -- if PrimaryMode.current ~= 'Caster' and player.sub_job ~= 'NIN' then
  --   set.sub = "Beatific Shield +1"
  -- end
  return set
end
