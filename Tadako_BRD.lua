include('Modes.lua')
include('augments_tadako.lua')

function define_modes()
  DummySongs = S{"Vivacious Etude", "Bewitching Etude", "Enchanting Etude", "Spirited Etude", "Dextrous Etude", "Vital Etude"}
  ForceHarpNext = false
  BadSongNext = false
  PrimaryMode = M{['description'] = 'Primary Mode',
    'Normal',
    'Hybrid'
  }
  WeaponMode = M{['description'] = 'Weapon Mode',
    'NaeglingFusetto',
    'NaeglingGleti',
    'Aeneas',
    'Carn'
  }
end

function define_aliases()
  send_command("bind ^f1 gs c cycle PrimaryMode")
  send_command("bind ^f2 gs c cycle WeaponMode")
end

function get_sets()
  send_command('lua load setlist')
  send_command('lua load dressup')
  define_modes()
  define_aliases()

  gear = {
    cape = {
      macc = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},
      healing = { name="Intarabus's Cape", augments={'MND+10','Cure Potency +10%',}},
      singleWield = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
      dualWield = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
      wsStr = { name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
      wsChr = { name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
      wsDex = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
    },
    linos = {
      tp = { name="Linos", augments={'Accuracy+15','"Store TP"+3','Quadruple Attack +3',}},
      ws = { name="Linos", augments={'Attack+11','Weapon skill damage +1%','STR+8',}}
    }
  }

  sets.weapons = {
    NaeglingFusetto = { main="Naegling", sub="Fusetto +2" },
    NaeglingGleti = { main="Naegling", sub="Gleti's Knife" },
    Aeneas =  { main="Aeneas", sub="Gleti's Knife" },
    Carn = { main="Carnwenhan", sub="Gleti's Knife" }
  }

  -- Modes
  sets.IdleRefresh = {
    main="Carnwenhan",
    sub="Genbu's Shield",           -- 10 PDT
    head="Inyanga Tiara +2",        -- refresh
    body="Inyanga Jubbah +2",       -- refresh
    hands="Inyanga Dastanas +2",    -- refresh
    legs="Inyanga Shalwar +2",      -- refresh
    feet="Fili Cothurnes +3",
    neck="Loricate Torque +1",      -- 6 DT
    waist="Flume Belt",             -- PDT
    left_ear="Flashward Earring",
    right_ear="Etiolation Earring",
    left_ring="Gelatinous Ring +1", -- 7 PDT
    right_ring="Inyanga Ring",      -- refresh
    back=gear.cape.macc             -- 10 PDT
  }
  sets.IdleDT = {
    head="Nyame Helm",              -- 7 DT
    body="Nyame Mail",              -- 9 DT
    hands="Nyame Gauntlets",        -- 7 DT
    legs="Nyame Flanchard",         -- 8 DT
    feet="Fili Cothurnes +3",
    neck="Loricate Torque +1",      -- 6 DT
    waist="Flume Belt",             -- 4 PDT
    left_ear="Flashward Earring",
    right_ear="Etiolation Earring", -- 3 MDT
    left_ring="Gelatinous Ring +1", -- 7 PDT
    right_ring="Purity Ring",
    back=gear.cape.macc             -- 10 PDT
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.Precast = {
    head="Nahtirah Hat",                  -- 10
    body="Inyanga Jubbah +2",             -- 14
    hands="Leyline Gloves",               -- 8
    legs="Kaykaus Tights",                -- 6
    feet="Fili Cothurnes +3",             -- 10
    neck="Orunmila's torque",             -- 5
    left_ear="Loquacious earring",        -- 2
    right_ear="Etiolation Earring",       -- 1
    waist="Witful Belt",                  -- 3
    left_ring="Weatherspoon Ring",        -- 5
    right_ring="Kishar Ring",             -- 4
    back=gear.cape.macc                   -- 10
                                          -- 78 Total
  }
  sets.Magic.HealingPrecast = set_combine(sets.Magic.Precast, {
    right_ear="Mendicant's Earring",
  })
  sets.Magic.Healing = {
    head="Kaykaus Mitra",
    body="Vanya Robe",
    hands="Kaykaus Cuffs",
    legs="Kaykaus Tights",
    feet="Vanya Clogs",
    neck="Incanter's Torque",
    waist="Luminary Sash",
    left_ear="Novia Earring",
    right_ear="Mendicant's Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back=gear.cape.healing
  }
  sets.Magic.HealingSelf = set_combine(sets.Magic.Healing, {
    waist="Chuq'aba belt"
  })
  sets.Magic.Cursna = {
    head="Kaykaus Mitra",                -- Skill
    neck="Malison Medallion",            -- Cursna
    left_ear="Loquacious earring",       -- FC
    right_ear="Etiolation Earring",      -- FC
    body="Inyanga Jubbah +2",            -- FC
    hands="Leyline Gloves",              -- FC
    left_ring="Haoma's Ring",            -- Cursna/Skill
    right_ring="Haoma's Ring",           -- Cursna/Skill
    back="Oretan. Cape +1",              -- Cursna
    waist="Witful Belt",                 -- FC
    legs="Kaykaus Tights",               -- FC
    feet="Vanya Clogs"                   -- Cursna/Skill
  }
  sets.Magic.Enhancing = {
    head=augments.telchine.head.enhancing,
    hands=augments.telchine.gloves.enhancing,
    body=augments.telchine.body.enhancing,
    legs=augments.telchine.legs.enhancing,
    feet=augments.telchine.feet.enhancing,
    waist="Embla Sash"
  }
  sets.Magic.Enfeebling = {
    main="Carnwenhan",
    head="Brioso Roundlet +3",
    body="Brioso Justaucorps +2",
    hands="Inyanga Dastanas +2",
    legs="Brioso Cannions +3",
    feet="Brioso Slippers +3",
    neck="Moonbow Whistle +1",
    left_ear="Digni. Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    waist="Luminary Sash",
    back=gear.cape.macc,
  }

  -- Songs
  sets.Songs = {}
  sets.Songs.Precast = set_combine(sets.Magic.Precast, {
    head="Fili Calot +2",
    feet=augments.telchine.feet.enhancing
  })
  sets.Songs.Dummy = {
    main="Carnwenhan",
    -- sub="Kali",
    ranged="Daurdabla",
    -- neck="Moonbow Whistle +1",
    -- body="Fili Hongreline +3",
    -- legs="Inyanga Shalwar +2",
    -- feet="Brioso Slippers +3"
  }

  -- Song Buffs
  --
  sets.Songs.Buffs = {
    main="Carnwenhan",
    -- sub="Kali",
    ranged="Gjallarhorn",
    head="Brioso Roundlet +3",
    body="Fili Hongreline +3",
    hands="Inyanga Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Moonbow Whistle +1",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back=gear.cape.macc
  }
  sets.Songs.Ballad = set_combine(sets.Songs.Buffs, { legs="Fili Rhingrave +2" })
  sets.Songs.Carol = set_combine(sets.Songs.Buffs, { hands="Mousai Gages +1" })
  sets.Songs.Madrigal = set_combine(sets.Songs.Buffs, { head="Fili Calot +2" })
  sets.Songs.March = set_combine(sets.Songs.Buffs, { hands="Fili Manchettes +2" })
  sets.Songs.HonorMarch = set_combine(sets.Songs.March, { ranged="Marsyas" })
  sets.Songs.Minne = set_combine(sets.Songs.Buffs, { legs="Mousai Seraweels +1" })
  sets.Songs.Minuet = set_combine(sets.Songs.Buffs, { body="Fili Hongreline +3" })
  sets.Songs.Scherzo = set_combine(sets.Songs.Buffs, {
    -- feet="Fili Cothurnes +3"
  })
  sets.Songs.Etude = set_combine(sets.Songs.Buffs, { head="Mousai Turban +1" })

  -- Song Debuffs
  --
  sets.Songs.DebuffAccuracy = {
    main="Carnwenhan",
    -- sub="Kali",
    ranged="Gjallarhorn",
    head="Brioso Roundlet +3",
    body="Brioso Justaucorps +2",
    hands="Inyanga Dastanas +2",
    legs="Brioso Cannions +3",
    feet="Brioso Slippers +3",
    neck="Moonbow Whistle +1",
    left_ear="Digni. Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    waist="Luminary Sash",
    back=gear.cape.macc
  }
  sets.Songs.DebuffDuration = {
    main="Carnwenhan",
    -- sub="Kali",
    ranged="Gjallarhorn",
    head="Brioso Roundlet +3",
    body="Fili Hongreline +3",
    hands="Inyanga Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Moonbow Whistle +1",
    left_ear="Digni. Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    waist="Luminary Sash",
    back=gear.cape.macc
  }
  sets.Songs.Lullaby = set_combine(sets.Songs.DebuffDuration,
    { ranged="Blurred Harp +1", hands="Brioso Cuffs +3" }
  )
  sets.Songs.Threnody = set_combine(sets.Songs.DebuffAccuracy,
    { body="Mousai Manteel" }
  )

  -- Abilities
  sets.JobAbility = {}
  sets.JobAbility.Troubadour = { body="Bihu Justaucorps +3", feet="Bihu Slippers" }
  sets.JobAbility.Nightingale = { body="Bihu Justaucorps +3", feet="Bihu Slippers" }
  sets.JobAbility['Soul Voice'] = { legs = 'Bihu Cannions' }

  -- Melee
  sets.modes = {}
  sets.modes.Normal = {
    ranged=gear.linos.tp, -- acc/stp/qa
    head="Blistering Sallet +1",
    body="Ayanmo Corazza +2",
    hands="Bunzi's Gloves",
    legs=augments.telchine.legs.tp, -- acc/stp/dex
    feet="Nyame Sollerets",
    neck="Bard's Charm +2",
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Cessance Earring",
    left_ring="Moonlight Ring",
    right_ring="Chirich Ring +1",
    back=gear.cape.dualWield -- acc/att/dex/dw
  }
  sets.modes.Hybrid = {
    ranged=gear.linos.tp, -- acc/stp/qa
    head="Nyame Helm",             -- 7 DT
    body="Ayanmo Corazza +2",      -- 6 DT
    hands="Bunzi's Gloves",        -- 8 DT
    legs="Nyame Flanchard",        -- 8 DT
    feet="Nyame Sollerets",        -- 7 DT
    neck="Bard's Charm +2",
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Cessance Earring",
    left_ring="Moonlight Ring",    -- 5 DT
    right_ring="Chirich Ring +1",
    back=gear.cape.dualWield       -- 10 PDT
  }                                -- 51 PDT
  sets.WS = {}
  sets.WS["Rudra's Storm"] = {
    ranged=gear.linos.ws,
    head="Nyame Helm",
    body="Bihu Justaucorps +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Bard's Charm +2",
    waist="Grunfeld Rope",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Ilabrat Ring",
    right_ring="Apate Ring",
    back=gear.cape.wsDex
  }
  sets.WS['Mordant Rime'] = {
    ranged=gear.linos.ws,
    head="Nyame Helm",
    body="Bihu Justaucorps +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Bard's Charm +2",
    waist="Grunfeld Rope",
    left_ear="Regal Earring",
    right_ear="Ishvara Earring",
    left_ring="Ilabrat Ring",
    right_ring="Ephramad's Ring",
    back=gear.cape.wsChr
  }
  sets.WS['Aeolian Edge'] = {
    ranged=gear.linos.ws,
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Ilabrat Ring",
    right_ring="Apate Ring",
    back=gear.cape.wsStr
  }
  sets.WS['Gust Slash'] = sets.WS['Aeolian Edge']
  sets.WS['Burning Blade'] = sets.WS['Aeolian Edge']
  sets.WS['Savage Blade'] = {
    ranged=gear.linos.ws,
    head="Nyame Helm",
    body="Bihu Justaucorps +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Bard's Charm +2",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Ifrit Ring +1",
    right_ring="Ephramad's Ring",
    back=gear.cape.wsStr
  }
end

function dual_wield_job()
  return (player.sub_job == 'NIN' or player.sub_job == 'DNC') and player.sub_job_level > 0
end

function precast(spell)
  if spell.type == 'JobAbility' then
    equip(sets.JobAbility[spell.english])

  elseif spell.type == 'BardSong' then
    equip(sets.Songs.Precast)
    if string.find(spell.english, 'Lullaby') then
      equip({ ranged="Daurdabla" })
    elseif spell.english == 'Honor March' then
      equip({ ranged="Marsyas" })
    end

  elseif spell.action_type == 'Magic' then
    if string.find(spell.english, 'Cure') or string.find(spell.english, 'Curaga') then
      equip(sets.Magic.HealingPrecast)
    else
      equip(sets.Magic.Precast)
    end

  elseif spell.type == 'WeaponSkill' then
    equip(sets.WS[spell.english])
    --  or sets.WS.Rudra
  end

  -- If engaged, don't allow weapons to swap
  if player.status == 'Engaged' then
    equip({ main=player.equipment.main, sub=player.equipment.sub })
  end

  precast_cancelations(spell)
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

  -- Bard Songs
  if spell.type == 'BardSong' then
    equip(set_for_song(spell))
    if dual_wield_job() == true then
      equip({ sub = 'Kali' })
    end

  -- Cures
  elseif spell.skill == 'Healing Magic' then
    if eng == "Cursna" then
      equip(sets.Magic.Cursna)

    elseif string.find(eng, 'Cure') or string.find(eng, 'Curaga') then
      if spell.target.type == 'SELF' then
        equip(sets.Magic.HealingSelf)
      else
        equip(sets.Magic.Healing)
      end
    end

  -- Buffs
  elseif spell.skill == 'Enhancing Magic' then
    equip(sets.Magic.Enhancing)

    if eng == 'Stoneskin' then
      equip(sets.Magic.EnhancingStoneskin)

    elseif eng == 'Phalanx' then
      equip(sets.Magic.EnhancingPhalanx)

    elseif string.find(eng, 'Regen') then
      equip(sets.Magic.EnhancingRegen)

    elseif eng == 'Refresh' then
      equip(sets.Magic.EnhancingRefresh)
      if spell.target.type == 'SELF' then
        equip(sets.Magic.EnhancingRefreshSelf)
      end
    end

  -- Enfeebles
  elseif spell.skill == 'Enfeebling Magic' then
    equip(sets.Magic.Enfeebling)
  end

  -- If engaged, don't allow weapons to swap
  if player.status == 'Engaged' then
    equip({ main=player.equipment.main, sub=player.equipment.sub })
  end
end

function set_for_engaged()
  set = set_combine(
    sets.modes[PrimaryMode.current],
    sets.weapons[WeaponMode.current]
  )
  if dual_wield_job() == false then
    set = set_combine(set, { sub = "Genbu's Shield", back = gear.cape.singleWield })
  end
  return set
end

function set_for_idle()
  local set = (player.sub_job == 'WHM' or player.sub_job == 'BLM') and sets.IdleRefresh or sets.IdleDT

  if dual_wield_job() == false then
    set = set_combine(set, { sub = "Genbu's Shield" })
  end
  return set
end

function aftercast(spell)
  if player.status == 'Engaged' then
    equip(set_for_engaged())
  else
    equip(set_for_idle())
  end

  if spell.type == 'BardSong' then
    ForceHarpNext = false
    BadSongNext = false
  end
end

function set_for_song(spell)
  if spell.english == 'Honor March' then
    return sets.Songs.HonorMarch
  
  elseif BadSongNext == true then
    return sets.Magic.Precast

  elseif ForceHarpNext or DummySongs:contains(spell.english) then
    return sets.Songs.Dummy

  elseif string.find(spell.english, 'Lullaby') then
    return sets.Songs.Lullaby

  elseif spell.english == 'Magic Finale' then
    return sets.Songs.DebuffAccuracy

  elseif string.find(spell.english, 'Threnody') then
    return sets.Songs.Threnody

  elseif spell.target.type == 'MONSTER' then
    return sets.Songs.DebuffDuration

  elseif string.find(spell.english, 'Ballad') then
    return sets.Songs.Ballad

  elseif string.find(spell.english, 'Carol') then
    return sets.Songs.Carol

  elseif string.find(spell.english, 'Madrigal') then
    return sets.Songs.Madrigal

  elseif string.find(spell.english, 'March') then
    return sets.Songs.March

  elseif string.find(spell.english, 'Minne') then
    return sets.Songs.Minne

  elseif string.find(spell.english, 'Minuet') then
    return sets.Songs.Minuet

  elseif string.find(spell.english, 'Scherzo') then
    return sets.Songs.Scherzo

  elseif string.find(spell.english, 'Etude') then
    return sets.Songs.Etude

  else
    return sets.Songs.Buffs
  end
end

function status_change(new, old)
  if new == 'Engaged' then
    equip(set_for_engaged())
  else
    equip(set_for_idle())
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
    equip(set_for_engaged())
  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
    end
    equip(set_for_engaged())
  elseif command == 'idle' then
    equip(set_for_idle())
  elseif command == 'harp' then
    if ForceHarpNext then
      add_to_chat(122, 'STOP using Harp now')
      ForceHarpNext = false
    else
      add_to_chat(122, 'Using HARP next')
      ForceHarpNext = true
    end
  elseif command == 'badsong' then
    if BadSongNext then
      add_to_chat(122, 'Undo bad duration for next song')
      BadSongNext = false
    else
      add_to_chat(122, 'Use bad duration for next song')
      BadSongNext = true
    end
  end
end
