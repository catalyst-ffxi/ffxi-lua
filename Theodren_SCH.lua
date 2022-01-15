include('Modes.lua')
include('augments.lua')
include('utils.lua')

function define_modes()
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
  send_command('alias tier6 input /ma "'..Element.current..' VI" <t>')
  send_command('alias enspell input /ma "En'..Element.current:lower()..'" <me>')
  storms = {
    Thunder = 'Thunderstorm II',
    Blizzard = 'Hailstorm II',
    Fire = 'Firestorm II',
    Aero = 'Windstorm II',
    Water = 'Rainstorm II',
    Stone = 'Sandstorm II'
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
  send_command("alias g15v2_m1g3 gs c cycle NukingMode")
  send_command("alias g15v2_m1g4 gs c cycle Element")
  send_command("alias g15v2_m1g5 lightarts")
  send_command("alias g15v2_m1g6 darkarts")
  send_command("alias auto_aspir gs c auto_aspir")
end

function get_sets()

  define_modes()
  define_aliases()

  -- Mode Sets
  --
  sets.Idle = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head="Befouled Crown",
    neck="Loricate Torque +1",
    left_ear="Odnowa Earring +1",
    right_ear="Etiolation Earring",
    body="Agwu's Robe",
    hands="Nyame Gauntlets",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    -- back="Lugh's Cape",
    back="Mecisto. Mantle",
    waist="Fucho-no-Obi",
    legs="Assid. Pants +1",
    feet="Nyame Sollerets"
  }
  sets.Idle_Submlimation = set_combine(sets.Idle, {
    waist="Embla Sash"
  })

  -- Base Sets
  --
  sets.Magic = {}
  sets.Magic.FastCast = {
    ammo="Sapience Orb",      -- 2
    head="Amalric Coif +1",   -- 11
    body="Agwu's Robe",       -- 8
    hands="Agwu's Gages",     -- 6
    legs="Agwu's Slops",      -- 7
    feet="Amalric Nails +1",  -- 6
    neck="Orunmila's Torque", -- 5
    waist="Embla Sash",       -- 5
    lear="Loquacious earring",-- 2
    rear="Etiolation earring",-- 1
    lring="Kishar Ring",      -- 4
    rring="Weatherspoon Ring +1",-- 6
    back="Perimede Cape"
  }                           -- 61

  -- Dark Magic
  --
  sets.Magic.Dark = {
    main="Maxentius",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Amalric Coif +1",
    neck="Erra Pendant",
    lear="Digni. Earring",
    rear="Regal Earring",
    body="Amalric Doublet +1",
    hands="Amalric Gages +1",
    lring="Stikini Ring +1",
    rring="Stikini Ring +1",
    back="Lugh's Cape",
    waist="Eschan Stone",
    legs="Amalric Slops +1",
    feet="Amalric Nails +1"
  }
  sets.Magic.DrainAspir = set_combine(sets.Magic.Dark, {
    neck="Erra Pendant",
    waist="Fucho-no-Obi"
  })

  -- Elemental magic
  --
  sets.Magic.elemental = {}
  sets.Magic.elemental.Normal = {
    main={ name="Mpaca's Staff", priority=2 },
    sub={ name="Enki Strap", priority=1 }, 
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
    back="Lugh's Cape"
  }

  sets.Magic.elemental.MagicBurst = set_combine(sets.Magic.elemental.Normal, {
    main={ name="Mpaca's Staff", priority=2 },-- MB2 +2
    sub={ name="Enki Strap", priority=1 }, 
    head="Peda. M.Board +3",               -- MB2 +4
    body="Agwu's Robe",                    -- MB +10
    hands="Agwu's Gages",                  -- MB +8, MB2 +1
    legs="Agwu's Slops",                   -- MB +9
    feet="Agwu's Pigaches",                -- MB +7
    neck="Argute Stole +1",                -- MB +7
    right_ring="Mujin Band"                -- MB2 +5
  })                                       -- TOTALS
                                           -- MB +41 (over)
                                           -- MB2 +11

  -- sets.Magic.elemental.MagicBurst = set_combine(sets.Magic.elemental.Normal, {
  --   main={ name="Mpaca's Staff", priority=2 },-- MB2 +2
  --   sub={ name="Enki Strap", priority=1 }, 
  --   head="Agwu's Cap",                     -- MB +7
  --   body="Agwu's Robe",                    -- MB +10
  --   hands="Amalric Gages +1",              -- MB2 +6
  --   legs="Agwu's Slops",                   -- MB +9
  --   feet="Agwu's Pigaches",                -- MB +7
  --   neck="Argute Stole +1",                -- MB +7
  --   right_ring="Mujin Band"                -- MB2 +5
  -- })                                       -- TOTALS
  --                                          -- MB +40
  --                                          -- MB2 +13

  -- sets.Magic.elemental.MagicBurst = set_combine(sets.Magic.elemental.Normal, {
  --   main={ name="Mpaca's Staff", priority=1 },-- MB2 +2
  --   sub={ name="Enki Strap", priority=2 }, 
  --   head="Agwu's Cap",                     -- MB +7
  --   body="Agwu's Robe",                    -- MB +10
  --   hands="Amalric Gages +1",              -- MB2 +6
  --   legs="Agwu's Slops",                   -- MB +9
  --   feet="Agwu's Pigaches",                -- MB +7
  --   neck="Mizu. Kubikazari",               -- MB +10
  --   right_ring="Mujin Band"                -- MB2 +5
  -- })                                       -- TOTALS
  --                                          -- MB +43
  --                                          -- MB2 +13

  -- Enfeebling Magic
  --
  sets.Magic.Enfeebling = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Kaykaus Cuffs +1",
    legs="Chironic Hose",
    feet="Medium's Sabots",
    neck="Incanter's torque",
    waist="Luminary Sash",
    lear="Digni. Earring",
    rear="Regal Earring",
    lring="Stikini Ring +1",
    rring="Stikini Ring +1",
    back="Lugh's Cape"
  }

  -- Enhancing Magic
  --
  sets.Magic.EnhancingDuration = {
    main="Gada",
    sub="Ammurapi Shield",
    head="Telchine Cap",
    body="Telchine Chasuble",
    hands="Telchine Gloves",
    legs="Telchine Braconi",
    feet="Telchine Pigaches",
    waist="Embla Sash",
    back="Lugh's Cape",
  }
  sets.Magic.EnhancingRegen = {
    back="Lugh's Cape",
  }
  sets.Magic.EnhancingRefresh = {
    head="Amalric Coif +1"
  }
  sets.Magic.EnhancingRefreshSelf = {
    waist="Gishdubar Sash"
  }
  sets.Magic.EnhancingStoneskin = {
    neck="Nodens Gorget",
    waist="Siegel Sash"
  }
  sets.Magic.EnhancingPhalanx = {
    body="Chironic Doublet"
  }
  sets.Magic.Embrava = {
    main="Gada",
    sub="Ammurapi Shield",
    head="Telchine Cap",
    body="Telchine Chasuble",
    hands="Telchine Gloves",
    legs="Telchine Braconi",
    feet="Telchine Pigaches",
    neck="Incanter's torque",
    waist="Embla Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Perimede Cape"
  }

  -- Healing Sets
  --
  sets.Magic.Healing = {
    main="Daybreak",              -- MND
    sub="Ammurapi Shield",        -- MND
    ammo="Quartz Tathlum +1",     -- MND
    head="Vanya Hood",            -- 10%, Skill
    body="Kaykaus Bliaut +1",     -- CP II
    hands="Kaykaus Cuffs +1",     -- 11%, MND
    legs="Chironic Hose",         -- 8%
    feet="Vanya Clogs",           -- 5%, Skill
    neck="Incanter's Torque",     -- Skill
    waist="Luminary Sash",        -- MND
    left_ear="Regal Earring",     -- MND
    right_ear="Mendi. Earring",   -- 5%
    left_ring="Stikini Ring +1",  -- Skill, MND
    right_ring="Stikini Ring +1", -- Skill, MND
    back="Lugh's Cape"
  }
  sets.Magic.HealingSelf = {
    neck="Phalaina Locket",      -- 4% self
    left_ring='Kunaji Ring',     -- 5% self
    waist="Gishdubar Sash"       -- 10% self
  }
  -- Cursna chance to clear doom affected by Healing Magic and Cursna Effect+ gear
  sets.Magic.Cursna = {
    ammo="Sapience Orb",
    head="Vanya Hood",
    -- body="",
    hands="Kaykaus Cuffs +1",
    -- legs="",
    feet="Vanya Clogs",
    neck="Malison Medallion",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    back="Oretan. Cape +1",
  }

  -- Job Abilities
  --
  sets.JA = {}
  sets.JA['Tabula Rasa'] = { legs="Pedagogy pants" }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.Myrkr = {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Amalric Slops +1",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Luminary Sash",
    left_ear="Moonshade Earring",
    right_ear="Etiolation Earring",
    left_ring="Supershear Ring",
    right_ring="Weather. Ring +1",
    back="Merciful Cape"
    -- hands="Otomi Gloves", -- stored
    -- lring="Etana Ring", -- stored
    -- rring="Bifrost Ring",
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
    back="Lugh's Cape"
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
    back="Lugh's Cape"
  }
end

function precast(spell)
  precast_cancelations(spell)

  if spell.type == 'JobAbility' then
    equip(sets.JA[spell.english])

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.FastCast)

  elseif spell.type == 'WeaponSkill' then
    equip(sets.WS[spell.english])
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
  -- Cures and Buffs
  if spell.skill == 'Healing Magic' or spell.skill == 'Enhancing Magic' then
    eng = spell.english

    -- Cursna Potency
    if eng == "Cursna" then
      equip(sets.Magic.Cursna)

    -- Cure Potency
    elseif string.find(eng, 'Cur') then
      equip(sets.Magic.Healing)
      if spell.target.type == 'SELF' then
        equip(sets.Magic.HealingSelf)
      end

    -- Enhancing Spells
    elseif spell.skill == 'Enhancing Magic' then
      if eng == 'Embrava' then
        equip(sets.Magic.Embrava)
      elseif eng == 'Stoneskin' then
        equip(sets.Magic.EnhancingStoneskin)
      elseif eng == 'Phalanx' then
        equip(sets.Magic.EnhancingPhalanx)
      else
        equip(sets.Magic.EnhancingDuration)
        if string.find(eng, 'Regen') then
          equip(sets.Magic.EnhancingRegen)
        elseif eng == 'Refresh' then
          equip(sets.Magic.EnhancingRefresh)
          if spell.target.type == 'SELF' then
            equip(sets.Magic.EnhancingRefreshSelf)
          end
        end
      end
      if buffactive['Perpetuance'] then
        equip({ hands="Arbatel Bracers +1" })
      end
    end

  -- Drain/Aspir
  elseif string.find(spell.english, 'Drain') or string.find(spell.english, 'Aspir') then
    equip(sets.Magic.DrainAspir)

  elseif spell.skill == 'Dark Magic' then
    equip(sets.Magic.Dark)

  -- Enfeebles
  elseif spell.skill == 'Enfeebling Magic' then
    equip(sets.Magic.Enfeebling)

  -- Nukes
  elseif spell.skill == 'Elemental Magic' then
    equip(sets.Magic.elemental[NukingMode.current])
    -- equip_elemental_waist(spell)
  end
end

function chat(msg)
  add_to_chat(122, msg)
end

function aftercast(spell)
  if player.status == 'Engaged' then
    equip(sets.Engaged)
  else
    equip_set_for_current_idle()
  end
end

function buff_change(buff, gain, bufftable)
  if buff == 'Sublimation: Complete' and gain then
    send_command('input /echo <<<<<<<<<<- Submimation Ready! ->>>>>>>>>>')
  end

  if buff == 'Sublimation: Activated' then
    if gain then
      equip(sets.Idle_Submlimation)
    else
      equip(sets.Idle)
    end
  end
end

function status_change(new, old)
  if player.status == 'Engaged' then
    equip(sets.Engaged)
  else
    equip_set_for_current_idle()
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
    equip_set_for_current_idle()
  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
      if mode.description == 'Primary Element' then
        define_aliases()
      end
    end
  elseif command == 'auto_aspir' then
    auto_aspir()

  elseif command == 'Liquefaction' then send_command('input /p Opening - Liquefaction [Fire] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Stone" <t>;wait 5.3;input /p Closing - Liquefaction [Fire] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Fire" <t>;')
  elseif command == 'Impaction' then send_command('input /p Opening - Impaction [Thunder] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Water" <t>;wait 5.3;input /p Closing - Impaction [Thunder] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Thunder II" <t>;')
  elseif command == 'Detonation' then send_command('input /p Opening - Detonation [Wind] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Stone" <t>;wait 5.3;input /p Closing - Detonation [Wind] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Aero" <t>;')
  elseif command == 'Scission' then send_command('input /p Opening - Scission [Earth] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Fire" <t>;wait 5.3;input /p Closing - Scission [Earth] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Stone" <t>;')
  elseif command == 'Reverberation' then send_command('input /p Opening - Reverberation [Water] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Stone" <t>;wait 5.3;input /p Closing - Reverberation [Water] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Water" <t>;')
  elseif command == 'Induration' then send_command('input /p Opening - Induration [Ice] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Water" <t>;wait 5.3;input /p Closing - Induration [Ice] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Blizzard" <t>;')
  elseif command == 'Transfixion' then send_command('input /p Opening - Transfixion [Light] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Noctohelix" <t>;wait 5.3;input /p Closing - Transfixion [Light] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Luminohelix" <t>;')
  elseif command == 'Compression' then send_command('input /p Opening - Compression [Dark] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Blizzard" <t>;wait 5.3;input /p Closing - Compression [Dark] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Noctohelix" <t>;')
  elseif command == 'Fusion' then send_command('input /p Opening - Fusion [Fire/Light] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Fire" <t>;wait 4.8;input /p Closing - Fusion [Fire/Light] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Thunder" <t>;')
  elseif command == 'Fragmentation' then send_command('input /p Opening - Fragmentation [Wind/Thunder] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Blizzard" <t>;wait 5.3;input /p Closing - Fragmentation [Wind/Thunder] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Water" <t>;')
  elseif command == 'Gravitation' then send_command('input /p Opening - Gravitation [Earth/Dark] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Aero" <t>;wait 5.3;input /p Closing - Gravitation [Earth/Dark] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Noctohelix" <t>;')
  elseif command == 'Distortion' then send_command('input /p Opening - Distortion [Water/Ice] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Luminohelix" <t>;wait 5.3;input /p Closing - Distortion [Water/Ice] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Stone" <t>;')
  elseif command == 'Tfusion' then send_command('input /p Opening - Liquefaction [Fire] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Stone" <t>;wait 5.3;input /p Closing - Liquefaction [Fire] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Fire" <t>;wait 4.8;input /p Closing - Fusion [Fire/Light] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Thunder" <t>;')

  end
end

-- Determine which idle set should be worn at this time
--
function equip_set_for_current_idle()
  if buffactive['Sublimation: Activated'] then
    equip(sets.Idle_Submlimation)
  else
    equip(sets.Idle)
  end
end

function auto_aspir()
  local spell_recasts = windower.ffxi.get_spell_recasts()
  local aspir_1 = spell_recasts[247]
  local aspir_2 = spell_recasts[248]

  if aspir_2 == 0 then
    send_command('@input /ma "Aspir II" <t>')
  elseif aspir_1 == 0 then
    send_command('@input /ma "Aspir" <t>')
  end
end
