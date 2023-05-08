include('Modes.lua')
include('augments.lua')
include('utils.lua')

function define_modes()
  NukingMode = M{['description'] = 'Nuking Mode', 'MagicBurst', 'Normal'}
  Element = M{['description'] = 'Primary Element', 'Thunder', 'Blizzard', 'Fire', 'Aero', 'Water', 'Stone'}
end

function define_aliases()
  -- Self Buffs
  send_command('bind !f5 stoneskin')
  send_command('bind !f6 phalanx')
  send_command('bind !f7 blink')
  send_command('bind !f8 aquaveil')

  -- Modes
  send_command("bind ^f3 gs c cycle NukingMode")
  send_command("bind ^f4 gs c cycle Element")
  send_command("bind ^f5 lightarts")
  send_command("bind ^f6 darkarts")
  send_command("alias auto_aspir gs c auto_aspir")
end

function get_sets()

  define_modes()
  define_aliases()

  gear = {
    cape = {
      nuke = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
      fastCast = { name="Lugh's Cape", augments={'"Fast Cast"+10',}}
    },
    stikini = {
      left = { name="Stikini Ring +1", bag="wardrobe1" },
      right = { name="Stikini Ring +1", bag="wardrobe2" }
    }
  }

  -- Mode Sets
  --
  sets.Idle = {
    ammo="Homiliary",
    head="Nyame Helm",           -- 8 DT
    body="Arbatel Gown +3",      -- 13 DT
    hands="Nyame Gauntlets",     -- 7 DT
    legs="Nyame Flanchard",      -- 8 DT
    feet="Nyame Sollerets",      -- 7 DT
    neck="Loricate Torque +1",   -- 6 DT   -- Sibyl Scarf?
    waist="Fucho-no-Obi",
    left_ear="Odnowa Earring +1",-- 3 DT
    right_ear="Eabani Earring",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back=gear.cape.nuke          -- 10 PDT
  }                              -- total 62
  sets.Idle_Submlimation = {
    ammo="Homiliary",
    head="Nyame Helm",           -- 8 DT
    body="Peda. Gown +3",
    hands="Nyame Gauntlets",     -- 7 DT
    legs="Nyame Flanchard",      -- 8 DT
    feet="Nyame Sollerets",      -- 7 DT
    neck="Loricate Torque +1",   -- 6 DT
    waist="Embla Sash",
    left_ear="Odnowa Earring +1",-- 3 DT
    right_ear="Genmei Earring",  -- 2 PDT
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back=gear.cape.nuke          -- 10 PDT
  }                              -- total 51

  -- Base Sets
  --
  sets.Magic = {}
  sets.Magic.FastCast = {
    -- main="Musa",              --
    -- sub="Clerisy Strap",      -- 2
    ammo="Sapience Orb",      -- 2
    head="Amalric Coif +1",   -- 11
    body="Agwu's Robe",       -- 8
    hands="Agwu's Gages",     -- 6
    legs="Agwu's Slops",      -- 7
    feet="Amalric Nails +1",  -- 6
    neck="Orunmila's Torque", -- 5
    waist="Embla Sash",       -- 5
    left_ear="Malignance Earring", -- 4
    right_ear="Loquacious earring",-- 2
    lring="Kishar Ring",      -- 4
    rring="Weatherspoon Ring +1",-- 6
    back=gear.cape.fastCast   -- 10
  }                           -- 80
  sets.Magic.GrimoireFastCast = {
    head="Peda. M.Board +3" -- 13
  }

  -- Dark Magic
  --
  sets.Magic.Dark = {
    main="Musa",
    sub="Khonsu",
    ammo="Pemphredo Tathlum",
    head="Amalric Coif +1",
    neck="Argute Stole +2",
    left_ear="Malignance Earring",
    right_ear="Digni. Earring",
    body="Amalric Doublet +1",
    hands="Nyame Gauntlets",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back=gear.cape.nuke,
    waist="Obstinate Sash",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets"
  }
  sets.Magic.DrainAspir = set_combine(sets.Magic.Dark, {
    neck="Erra Pendant",
    waist="Fucho-no-Obi"
  })

  -- Elemental magic
  --
  sets.Magic.elemental = {}
  sets.Magic.elemental.Normal = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Arbatel bonnet +3",
    body="Agwu's Robe",
    hands="Arbatel Bracers +3",
    legs="Agwu's Slops",
    feet="Arbatel Loafers +3",
    neck="Argute Stole +2",
    waist="Sacro Cord",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring="Metamorph Ring +1",
    back=gear.cape.nuke
  }
  sets.Magic.elemental.MagicBurst = {
    main="Bunzi's Rod",                    -- MB +10
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Peda. M.Board +3",               --        MB2 +4
    body="Agwu's Robe",                    -- MB +10
    hands="Agwu's Gages",                  -- MB +8, MB2 +5
    legs="Agwu's Slops",                   -- MB +9
    feet="Arbatel Loafers +3",             --        MB2 +5
    neck="Argute Stole +2",                -- MB +10
    waist="Sacro Cord",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring="Metamorph Ring +1",
    back=gear.cape.nuke
  }                                        -- MB +47 MB2 +14
  
  -- Enfeebling Magic
  --
  sets.Magic.Enfeebling = {
    main="Musa",
    sub="Khonsu",
    ammo="Pemphredo Tathlum",
    head="Arbatel Bonnet +3",
    body="Arbatel Gown +3",
    hands="Kaykaus Cuffs +1",
    legs="Chironic Hose",
    feet="Arbatel Loafers +3",
    neck="Argute Stole +2",
    waist="Obstinate Sash",
    lear="Digni. Earring",
    rear="Crep. Earring",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back=gear.cape.nuke,
  }

  -- Enhancing Magic
  --
  sets.Magic.EnhancingDuration = {
    main="Musa",
    sub="Khonsu",
    head="Telchine Cap",
    body="Peda. Gown +3",
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
    main="Musa",
    sub="Khonsu",
    head="Telchine Cap",
    body="Peda. Gown +3",
    hands="Telchine Gloves",
    legs="Telchine Braconi",
    feet="Telchine Pigaches",
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back="Lugh's Cape",
  }
  sets.Magic.PhalanxOthers = {
    main="Musa",
    sub="Khonsu",
    head="Telchine Cap",
    body="Peda. Gown +3",
    hands="Telchine Gloves",
    legs="Telchine Braconi",
    feet="Telchine Pigaches",
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back="Lugh's Cape",
  }
  sets.Magic.Embrava = {
    main="Musa",
    sub="Khonsu",
    head="Telchine Cap",
    body="Peda. Gown +3",
    hands="Telchine Gloves",
    legs="Telchine Braconi",
    feet="Telchine Pigaches",
    neck="Incanter's torque",
    waist="Embla Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back="Perimede Cape"
  }

  -- Healing Sets
  --
  sets.Magic.Healing = {
    -- main="Daybreak",
    -- sub="Ammurapi Shield",
    -- main="",
    -- sub="",
    ammo="Pemphredo Tathlum",
    head="Kaykaus Mitra +1",
    body="Kaykaus Bliaut +1",
    hands="Kaykaus Cuffs +1",
    legs="Kaykaus Tights +1", 
    feet="Kaykaus Boots +1", 
    neck="Incanter's Torque",
    waist="Luminary Sash",
    left_ear="Meili Earring",
    right_ear="Magnetic Earring",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back=gear.cape.fastCast
  }
  sets.Magic.HealingSelf = set_combine(
    sets.Magic.Healing, {
      neck="Phalaina Locket",     -- 4% self
      waist="Gishdubar Sash",     -- 10% self
      left_ring='Kunaji Ring',    -- 5% self
    }
  )
  -- Cursna chance to clear doom affected by Healing Magic and Cursna Effect+ gear
  sets.Magic.Cursna = {
    -- main="Gada",
    -- sub="Ammurapi Shield",
    ammo="Sapience Orb",
    head="Vanya Hood",
    body="Kaykaus Bliaut +1",
    hands="Kaykaus Cuffs +1",
    legs="Kaykaus Tights +1", 
    feet="Vanya Clogs",
    neck="Malison Medallion",
    waist="Witful Belt",
    left_ear="Meili Earring",
    right_ear="Loquac. Earring",
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    back="Oretan. Cape +1",
  }

  sets.Magic.SpellInterrupt = {  --        8 SRD (merit)
    main="Bunzi's Rod",
    sub="Culminus",              --        10 SRD
    ammo="Staunch Tathlum +1",   -- 3 DT   11 SRD
    head="Agwu's Cap",           --        10 SRD
    body="Arbatel Gown +3",      -- 13 DT
    hands="Chironic Gloves",     --        31 SIRD
    legs="Nyame Flanchard",      -- 8 DT
    feet="Nyame Sollerets",      -- 7 DT
    neck="Loricate Torque +1",   -- 6 DT   5 SRD
    waist="Rumination Sash",     --        10 SRD
    left_ear="Odnowa Earring +1",-- 3 DT
    right_ear="Magnetic Earring",--        8 SRD
    left_ring="Freke Ring",      --        10 SRD
    right_ring="Gelatinous Ring +1",-- 7 DT
    back=gear.cape.nuke          -- 10 PDT
  }                              -- 57 PDT 103 SRD

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
    left_ear="Cessance Earring",
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

    -- if (spell.english == 'Accession') and not buffactive['Light Arts'] then
    --   cast_delay(1.3)
    --   send_command('@input /ja "Light Arts" <me>')
    -- end

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.FastCast)
    if (spell.type == 'WhiteMagic' and buffactive['Light Arts']) or
       (spell.type == 'BlackMagic' and buffactive['Dark Arts']) then
      equip(sets.Magic.GrimoireFastCast)
    end

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
      if spell.target.type == 'SELF' then
        equip(sets.Magic.HealingSelf)
      else
        equip(sets.Magic.Healing)
      end
      if get_total_element_intensity('Light') > 0 then
        equip({waist="Hachirin-no-Obi"})
      end

    -- Enhancing Spells
    elseif spell.skill == 'Enhancing Magic' then
      if eng == 'Embrava' then
        equip(sets.Magic.Embrava)
      elseif eng == 'Stoneskin' then
        equip(sets.Magic.EnhancingStoneskin)
      -- elseif eng == 'Phalanx' then
      --   equip(sets.Magic.EnhancingPhalanx)
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
        equip({ hands="Arbatel Bracers +3" })
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
    if Magic_SC_Spell:contains(spell.english) then
      equip(sets.Magic.SpellInterrupt)
    else
      equip(set_for_elemental_magic(spell))
      equip_elemental_waist(spell)
    end
  end
end

Magic_SC_Spell = S{
  'Fire', 'Thunder', 'Blizzard', 'Water', 'Stone', 'Water',
  'Cryohelix', 'Pyrohelix', 'Anemohelix', 'Geohelix', 'Ionohelix', 'Hydrohelix', 'Luminohelix', 'Noctohelix'
}

function chat(msg)
  add_to_chat(122, msg)
end

function set_for_elemental_magic(spell)
  local set = table.copy(sets.Magic.elemental[NukingMode.current])

  if buffactive['Klimaform'] and spell.element == world.weather_element then
    set.feet = "Arbatel Loafers +3"
  end

  if buffactive['Ebullience'] then
    set.head = "Arbatel Bonnet +3"
  end

  return set
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

  if buff == 'Klimaform' and not gain then
    add_to_chat(122, ' <<<<<<<<<<- Klimaform Down ->>>>>>>>>>')
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
