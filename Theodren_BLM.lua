include('Modes.lua')
include('augments.lua')
include('utils.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Caster'}
  NukingMode = M{['description'] = 'Nuking Mode', 'Normal', 'MagicBurst'}
  DamageDown = M(false, 'Damage Down')
  Element = M{['description'] = 'Primary Element', 'Thunder', 'Blizzard', 'Fire', 'Aero', 'Water', 'Stone'}
  Capacity = M(false, 'Capacity Mantle')
end

function define_aliases()
  -- Elements
  send_command('alias tier1 input /ma "'..Element.current..'" <t>')
  send_command('alias tier2 input /ma "'..Element.current..' II" <t>')
  send_command('alias tier3 input /ma "'..Element.current..' III" <t>')
  send_command('alias tier4 input /ma "'..Element.current..' IV" <t>')
  send_command('alias tier5 input /ma "'..Element.current..' V" <t>')
  send_command('alias tier6 input /ma "'..Element.current..' VI" <t>')
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
  send_command('bind ^f5 tier6')

  -- Self Buffs
  send_command('bind !f5 stoneskin')
  send_command('bind !f6 phalanx')
  send_command('bind !f7 blink')
  send_command('bind !f8 aquaveil')

  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  -- send_command("alias g15v2_m1g2 gs c cycle EnfeebleMode")
  send_command("alias g15v2_m1g3 gs c cycle NukingMode")
  send_command("alias g15v2_m1g4 gs c cycle Element")
  send_command("alias g15v2_m1g5 lightarts")
  send_command("alias g15v2_m1g6 darkarts")

  send_command("alias auto_aspir gs c auto_aspir")
end

function get_sets()

  define_modes()
  define_aliases()

  gear = {
    taranus = {
      nuke={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
      fastCast={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
    },
  }

  -- Mode Sets
  --
  sets.Idle = {
    main="Maxentius",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head="Befouled Crown",
    body="Amalric Doublet +1",
    hands="Nyame Gauntlets",
    legs="Assid. Pants +1",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Odnowa Earring +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back="Taranus's Cape"
  }
  sets.Engaged = {
    main="Maxentius",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Hetairoi Ring",
    right_ring="Chirich Ring +1",
    back="Taranus's Cape"
  }

  -- Base Sets
  --
  sets.base = {}

  sets.base.fast_cast = {
    ammo="Sapience Orb",       -- 2
    head="Amalric Coif +1",    -- 11
    neck="Orunmila's Torque",  -- 5
    lear="Loquacious earring", -- 2
    rear="Etiolation earring", -- 1
    body="Vrikodara Jupon",    -- 5
    hands="Helios Gloves",     -- 5
    lring="Kishar Ring",       -- 4
    rring="Weatherspoon Ring +1",-- 2
    back=gear.taranus.fastCast,-- 10
    waist="Embla Sash",        -- 5
    legs="Telchine Braconi",   -- 4
    feet=augments.merlinic.crackows.nuke -- 5
  }                            -- 61 fc
  sets.base.quick_cast = {
    ammo = "Impatiens",
    waist = "Witful Belt"
  }
  sets.base.auto_refresh = {
    body = "Amalric Doublet +1",
  }
  sets.base.move_speed = {
    legs = "Track Pants +1"
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.Myrkr = {
    ammo = "Quartz Tathlum +1",
    -- head = "Kaabnax Hat",
    head = "Pixie Hairpin +1",
    neck = "Sanctity Necklace",
    lear = "Etiolation Earring",
    rear = "Moonshade Earring",
    body = "Amalric Doublet +1",
    -- hands = "Otomi Gloves", -- stored
    hands="Helios Gloves",
    -- lring = "Etana Ring", -- stored
    -- rring = "Bifrost Ring",
    left_ring="Supershear Ring",
    right_ring="Weatherspoon Ring +1",
    -- back = "Bane Cape", -- stored
    back="Merciful Cape",
    waist = "Luminary Sash",
    legs = "Spae. Tonban +2",
    feet = "Medium's sabots"
  }
  sets.WS['Black Halo'] = {
    main="Maxentius",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Brutal Earring",
    right_ear="Moonshade Earring",
    left_ring="Shukuyu Ring",
    right_ring="Epaminondas's Ring",
    back="Taranus's Cape"
  }

  -- MIDCAST
  --

  -- Dark Magic
  --
  sets.midcast = {}
  sets.midcast.dark = {
    main = "Maxentius",
    sub = "Ammurapi Shield",
    ammo = "Pemphredo Tathlum",
    head = "Amalric Coif +1",
    -- head = "Pixie Hairpin +1",
    neck = "Erra Pendant",
    lear = "Digni. Earring",
    rear = "Regal Earring",
    body = "Amalric Doublet +1",
    hands = "Amalric Gages +1",
    lring = "Stikini Ring +1",
    rring = "Stikini Ring +1",
    back = gear.taranus.nuke,
    waist = "Eschan Stone",
    legs = "Spaekona's Tonban +2",
    feet = augments.merlinic.crackows.nuke
  }
  sets.midcast.drain_aspir = set_combine(sets.midcast.dark, {
    neck = "Erra Pendant",
    hands = augments.merlinic.dastanas,
    waist = "Fucho-no-Obi",
    feet = augments.merlinic.crackows.nuke
  })
  sets.midcast.stun = {                   -- FC  | Haste
    -- main=augments.grio.nuke,              -- 4%  |
    main="Maxentius",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Amalric Coif +1",
    body="Amalric Doublet +1",
    hands="Amalric Gages +1",
    legs="Spae. Tonban +2",
    feet=augments.merlinic.crackows.nuke,
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back=gear.taranus.fastCast,
  }

  -- Elemental magic
  --
  sets.midcast.elemental = {}
  sets.midcast.elemental.Normal = {
    main="Maxentius",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="C. Palug Crown",
    body="Amalric Doublet +1",
    hands="Amalric Gages +1",
    legs="Amalric Slops +1",
    feet="Jhakri pigaches +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Shiva Ring +1",
    right_ring="Freke Ring",
    back=gear.taranus.nuke
  }
  sets.midcast.elemental.MagicBurst = {
    main="Maxentius",           -- MB +4
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Ea Hat",              -- MB +6 | MB II +6
    neck="Mizu. Kubikazari",    -- MB +10|
    lear="Malignance Earring",
    rear="Regal Earring",
    body="Ea Houppelande",      -- MB +8 | MB II +8
    hands="Amalric Gages +1",   --       | MB II +6
    lring="Mujin Band",         --       | MB II +5
    rring="Freke Ring",
    back=gear.taranus.nuke,     -- MB +5 |
    waist="Eschan Stone",
    legs="Ea Slops",            -- MB +7 | MB II +7
    feet="Jhakri pigaches +2"
  }                             -- MB +41| MB II +31

  -- Death
  --
  -- sets.precast.Death = {
  --
  -- }

  -- Enfeebling Magic
  --
  sets.midcast.enfeebling = {
    main="Maxentius",
    sub="Ammurapi Shield",
    ammo="Quartz Tathlum +1",
    head="Amalric Coif +1",
    neck="Incanter's torque",
    lear="Digni. Earring",
    rear="Regal Earring",
    body="Vanya Robe",
    hands="Jhakri Cuffs +2",
    lring="Stikini Ring +1",
    rring="Stikini Ring +1",
    back=gear.taranus.nuke,
    waist="Luminary Sash",
    legs="Amalric Slops +1",
    feet="Medium's Sabots"
  }

  -- Enhancing Magic
  --
  sets.midcast.enhancing_skill = {
  }
  sets.midcast.enhancing_duration = {
    sub="Ammurapi Shield",
    head="Telchine Cap",
    body="Telchine Chasuble",
    hands="Telchine Gloves",
    legs="Telchine Braconi",
    feet="Telchine Pigaches",
    waist="Embla Sash"
  }
  sets.midcast.enhancing_regen = {}
  sets.midcast.enhancing_refresh = {
    head = "Amalric Coif +1"
  }
  sets.midcast.enhancing_refresh_self = {
    waist = "Gishdubar sash",
    -- feet = "Inspirited Boots"
  }
  sets.midcast.enhancing_stoneskin = {
    neck = "Nodens Gorget",
    waist = "Siegel Sash"
  }
  sets.midcast.enhancing_phalanx_self = {
    head = augments.merlinic.hood.phalanx
  }

  -- Precast Magic
  --
  -- sets.midcast.stun = {
  -- }

  -- Healing Sets
  --
  sets.midcast.healing = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Quartz Tathlum +1",
    head="Vanya Hood",
    body="Vanya Robe",
    hands="Telchine Gloves",
    legs="Vanya Slops",
    feet="Vanya Clogs",
    neck="Incanter's Torque",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Mendi. Earring",
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    back="Solemnity Cape"       -- 7
  }
  sets.midcast.healing_self = {
    neck="Phalaina Locket",      -- 4% self
    left_ring='Kunaji Ring',     -- 5% self
    waist="Gishdubar Sash"       -- 10% self
  }
  sets.midcast.convert = set_combine(sets.midcast.healing, sets.midcast.healing_self, {
  })
  -- Cursna chance to clear doom affected by Healing Magic and Cursna Effect+ gear
  sets.midcast.cursna = {
    ammo="Sapience Orb",
    head="Vanya Hood",
    body="Vanya Robe",
    hands="Kaykaus Cuffs +1",
    legs="Vanya Slops",
    feet="Vanya Clogs",
    neck="Malison Medallion",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    back="Oretan. Cape +1",
  }
end

function precast(spell)
  precast_cancelations(spell)

  if spell.action_type == 'Magic' then
    equip(sets.base.fast_cast)
    if not (spell.skill == 'Elemental Magic' and NukingMode.current == 'MagicBurst') then
      equip(sets.base.quick_cast)
    end

  elseif spell.type == 'WeaponSkill' then
    if sets.WS[spell.english] then
      equip(sets.WS[spell.english])
    end
  end

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

function midcast(spell)
  if spell.action_type == 'Magic' then
    midcast_magic(spell)
  end
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
      if eng == 'Stoneskin' then
        equip(sets.midcast.enhancing_stoneskin)

      elseif eng == 'Phalanx' then
        equip(sets.midcast.enhancing_skill)
        equip(sets.midcast.enhancing_phalanx_self)
      else
        equip(sets.midcast.enhancing_duration)
        if string.find(eng, 'Regen') then
          equip(sets.midcast.enhancing_regen)
        elseif eng == 'Refresh' then
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

  -- Drain/Aspir
  elseif string.find(spell.english, 'Drain') or string.find(spell.english, 'Aspir') then
    equip(sets.midcast.drain_aspir)
    if world.weather_element == "Dark" or world.day_element == "Dark" then
      equip({ waist = "Hachirin-no-Obi" })
    end

  elseif spell.skill == 'Dark Magic' then
    equip(sets.midcast.dark)

  -- Enfeebles
  elseif spell.skill == 'Enfeebling Magic' then
    equip(sets.midcast.enfeebling)

  -- Nukes
  elseif spell.skill == 'Elemental Magic' then
    equip(sets.midcast.elemental[NukingMode.current])
    equip_elemental_waist(spell)
    if should_use_spaekonas() then
      equip({ body = "Spaekona's coat +2" })
    end
  end
end

function chat(msg)
  add_to_chat(122, msg)
end

function aftercast(spell)
  if player.status == 'Engaged' then
    equip(sets.Engaged)
  else
    equip(sets.Idle)
  end
end

function status_change(new, old)
  if new == 'Resting' then
    equip(sets.Idle)
  elseif new == 'Engaged' then
    equip(sets.Engaged)
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
    equip(sets.Idle)
  elseif command == 'cycle' then

    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
      if mode.description == 'Primary Mode' then
        equip(sets.modes[mode.current])
      elseif mode.description == 'Primary Element' then
        define_aliases()
      end
    end
  elseif command == 'idle' then
    equip(sets.Idle)
  elseif command == 'run' then
    equip(sets.Idle)
  elseif command == 'auto_aspir' then
    auto_aspir()
  end
end

function auto_aspir()
  local spell_recasts = windower.ffxi.get_spell_recasts()
  local aspir_1 = spell_recasts[247]
  local aspir_2 = spell_recasts[248]
  local aspir_3 = spell_recasts[881]

  if aspir_3 == 0 then
    send_command('@input /ma "Aspir III" <t>')
  elseif aspir_2 == 0 then
    send_command('@input /ma "Aspir II" <t>')
  elseif aspir_1 == 0 then
    send_command('@input /ma "Aspir" <t>')
  end
end

function should_use_spaekonas()
  if player.mp < 700 then
    return true
  end
  return false
end
