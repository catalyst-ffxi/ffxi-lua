include('Modes.lua')
include('augments_tadako.lua')

function define_modes()
  DummySongs = S{"Vivacious Etude", "Bewitching Etude", "Enchanting Etude", "Spirited Etude", "Vital Etude"}
  ForceHarpNext = false
end

function define_aliases()
  -- Self Buffs
  send_command('bind !f5 stoneskin')
  send_command('bind !f6 phalanx')
  send_command('bind !f7 blink')
  send_command('bind !f8 aquaveil')
  -- send_command('bind !f9 input /item "Echo Drops" <me>')
  -- send_command('bind !f10 input /item "Remedy" <me>')
  -- send_command('bind !f11 input /item "Holy Water" <me>')
end

function get_sets()
  send_command('lua load setlist')
  send_command('lua load dressup')
  define_modes()
  define_aliases()

  gear = {
    cape = {
      macc = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},
      enmity = { name="Intarabus's Cape", augments={'MND+10','Enmity-10',}},
      melee = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
      ws = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
      mordant = { name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
    }
  }

  -- Modes
  sets.Idle = {
    main="Carnwenhan",
    sub="Genbu's Shield",           -- 10 PDT
    head="Inyanga Tiara +2",        -- 4 MDT
    neck="Loricate Torque +1",      -- 6 DT
    left_ear="Flashward Earring",
    right_ear="Etiolation Earring", -- 3 MDT
    body="Inyanga Jubbah +2",       -- 8 MDT
    hands="Inyanga Dastanas +2",    -- 4 MDT
    left_ring="Gelatinous Ring +1", -- 7 PDT
    right_ring="Inyanga Ring",      -- 2 MDT
    back=gear.cape.macc,            -- 10 PDT
    waist="Flume Belt",             -- 4 PDT
    legs="Inyanga Shalwar +2",      -- 6 MDT
    feet="Fili Cothurnes +1"
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.Precast = {
    head=augments.chironic.head.macc, -- 6
    neck="Orunmila's torque",             -- 5
    body="Inyanga Jubbah +2",             -- 14
    hands="Leyline Gloves",               -- 8
    left_ring="Weatherspoon Ring",        -- 5
    right_ring="Kishar Ring",             -- 4
    left_ear="Loquacious earring",        -- 2
    right_ear="Etiolation Earring",       -- 1
    legs="Kaykaus Tights",                -- 6
    back=gear.cape.macc,                  -- 10
    waist="Witful Belt"                   -- 3
                                          -- 64 Total
  }
  sets.Magic.HealingPrecast = set_combine(sets.Magic.Precast, {
    right_ear="Mendicant's Earring",
  })
  sets.Magic.Healing = {
    head="Kaykaus Mitra",
    neck="Incanter's Torque",
    left_ear="Novia Earring",
    right_ear="Mendicant's Earring",
    body="Vanya Robe",
    hands="Kaykaus Cuffs",
    left_ring="Lebeche Ring",
    right_ring="Haoma's Ring",
    back=gear.cape.enmity,
    waist="Pythia Sash",
    legs="Kaykaus Tights",
    feet="Vanya Clogs"
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
    head="Brioso Roundlet +2",
    body="Brioso Justaucorps +2",
    hands="Inyanga Dastanas +2",
    legs="Brioso Cannions +2",
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
    head="Fili Calot",
    feet=augments.telchine.feet.enhancing
  })
  sets.Songs.Dummy = {
    main="Carnwenhan",
    ranged="Daurdabla",
    neck="Moonbow Whistle +1",
    body="Fili Hongreline +1",
    -- legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3"
  }

  -- Song Buffs
  --
  sets.Songs.Buffs = {
    main="Carnwenhan",
    ranged="Gjallarhorn",
    head="Brioso Roundlet +2",
    body="Fili Hongreline +1",
    hands="Inyanga Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Moonbow Whistle +1",
    back=gear.cape.macc
  }
  sets.Songs.Ballad = set_combine(sets.Songs.Buffs, { legs="Fili Rhingrave" })
  sets.Songs.Carol = set_combine(sets.Songs.Buffs, { hands="Mousai Gages +1" })
  sets.Songs.Madrigal = set_combine(sets.Songs.Buffs, { head="Fili Calot" })
  sets.Songs.March = set_combine(sets.Songs.Buffs, { hands="Fili Manchettes" })
  sets.Songs.HonorMarch = set_combine(sets.Songs.March, { ranged="Marsyas" })
  sets.Songs.Minne = set_combine(sets.Songs.Buffs, { legs="Mousai Seraweels +1" })
  sets.Songs.Minuet = set_combine(sets.Songs.Buffs, { body="Fili Hongreline +1" })
  sets.Songs.Scherzo = set_combine(sets.Songs.Buffs, { feet="Fili Cothurnes +1" })

  -- Song Debuffs
  --
  sets.Songs.DebuffAccuracy = {
    main="Carnwenhan",
    ranged="Gjallarhorn",
    head="Brioso Roundlet +2",
    body="Brioso Justaucorps +2",
    hands="Inyanga Dastanas +2",
    legs="Brioso Cannions +2",
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
    ranged="Gjallarhorn",
    head="Brioso Roundlet +2",
    body="Fili Hongreline +1",
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
    { ranged="Daurdabla", hands="Brioso Cuffs +2" }
  )
  sets.Songs.Threnody = set_combine(sets.Songs.DebuffAccuracy,
    { body="Mousai Manteel" }
  )

  -- Abilities
  sets.JobAbility = {}
  sets.JobAbility.Troubadour = { body="Bihu Justaucorps", feet="Bihu Slippers" }
  sets.JobAbility.Nightingale = { body="Bihu Justaucorps", feet="Bihu Slippers" }
  -- sets.JobAbility['Soul Voice'] = { legs = 'Bihu Cannions' }

  -- Melee
  sets.Engaged = {
    main="Carnwenhan",
    sub="Genbu's Shield",
    head="Aya. Zucchetto +2",              -- 6%
    body="Ayanmo Corazza +2",              -- 4%
    hands=augments.chironic.gloves.tp,     -- 3%
    legs="Ayanmo Cosciales +2",            -- 9%
    feet=augments.chironic.feet.tp,        -- 3%
    neck="Bard's Charm",
    waist="Sailfi Belt +1",                -- 9%
    left_ear="Dedition Earring",
    right_ear="Brutal Earring",
    left_ring="Hetairoi Ring",
    right_ring="Petrov Ring",
    back=gear.cape.melee
  }                                        -- 31% Haste
  sets.WS = {}
  sets.WS.Rudra = {
    head="Aya. Zucchetto +2",             -- Lustratio
    body="Ayanmo Corazza +2",             -- Bihu +2/3
    hands="Ayanmo Manopolas +2",          -- Lustratio
    legs="Ayanmo Cosciales +2",           -- Lustratio
    feet="Lustratio Leggings +1",
    neck="Bard's Charm",
    waist="Grunfeld Rope",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Ilabrat Ring",
    right_ring="Apate Ring",
    back=gear.cape.ws
  }
  sets.WS['Mordant Rime'] = {
    head="Brioso Roundlet +2",
    body="Bihu Justaucorps",
    hands="Brioso Cuffs +2",
    legs="Brioso Cannions +2",
    feet="Brioso Slippers +3",
    neck="Bard's Charm",
    waist="Grunfeld Rope",
    left_ear="Regal Earring",
    right_ear="Ishvara Earring",
    left_ring="Ilabrat Ring",
    right_ring="Begrudging Ring",
    back=gear.cape.mordant
  }
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
    equip(sets.WS[spell.english] or sets.WS.Rudra)
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
end

function aftercast(spell)
  if player.status=='Engaged' then
    equip(sets.Engaged)
  else
    equip(sets.Idle)
    if player.mpp <= 50 then
      equip({waist = "Fucho-no-Obi"})
    end
  end
  if ForceHarpNext == true then
    ForceHarpNext = false
  end
end

function set_for_song(spell)
  if spell.english == 'Honor March' then
    return sets.Songs.HonorMarch

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

  else
    return sets.Songs.Buffs
  end
end

function status_change(new, old)
  if new == 'Engaged' then
    equip(sets.Engaged)
  else
    equip(sets.Idle)
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
    if player.status=='Engaged' then
      equip(sets.Engaged)
    else
      equip(sets.Idle)
    end
  elseif command == 'idle' then
    equip(sets.Idle)
  elseif command == 'harp' then
    if ForceHarpNext then
      add_to_chat(122, 'STOP using Harp now')
      ForceHarpNext = false
    else
      add_to_chat(122, 'Using HARP next')
      ForceHarpNext = true
    end
  end
end
