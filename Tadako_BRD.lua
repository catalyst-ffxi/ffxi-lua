include('Modes.lua')
include('augments_tadako.lua')

function define_modes()
  DummySongs = S{"Swift Etude", "Bewitching Etude", "Enchanting Etude", "Spirited Etude", "Vital Etude"}
  DummyIndex = 0
end

function define_aliases()
  -- Self Buffs
  send_command('bind !f5 stoneskin')
  send_command('bind !f6 phalanx')
  send_command('bind !f7 blink')
  send_command('bind !f8 aquaveil')
end

function get_sets()
  send_command('lua load setlist')
  -- send_command('lua load dressup')
  define_modes()
  define_aliases()

  gear = {
    kali = {
      skill={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
      refresh={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}}
    },
    cape = {
      fastCast = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}},
      enmity = { name="Intarabus's Cape", augments={'MND+10','Enmity-10',}},
      melee = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
    }
  }

  -- Modes
  sets.Idle = {
    main=gear.kali.refresh,
    sub="Genbu's Shield",           -- 10 PDT
    head="Inyanga Tiara +1",        -- 4 MDT
    neck="Loricate Torque +1",      -- 6 DT
    left_ear="Flashward Earring",
    right_ear="Etiolation Earring", -- 3 MDT
    body="Inyanga Jubbah +2",       -- 8 MDT
    hands="Inyanga Dastanas +2",    -- 4 MDT
    left_ring="Gelatinous Ring +1", -- 7 PDT
    right_ring="Inyanga Ring",      -- 2 MDT
    back=gear.cape.fastCast,        -- 5 DT
    waist="Flume Belt",             -- 4 PDT
    legs="Inyanga Shalwar +2",      -- 6 MDT
    feet="Fili Cothurnes +1"
  }
  sets.Engaged = {
    sub="Genbu's Shield",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands=augments.chironic.gloves.tp,
    legs=augments.telchine.legs.enhancing,
    feet=augments.chironic.feet.tp,
    neck="Bard's Charm",
    waist="Sarissapho. Belt",
    left_ear="Digni. Earring",
    right_ear="Brutal Earring",
    back=gear.cape.melee,
    left_ring="Ayanmo Ring",
    right_ring="Rajas Ring",
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.Precast = {
    main=gear.kali.refresh,
    head="Kaykaus Mitra",
    neck="Orunmila's torque",
    body="Inyanga Jubbah +2",
    hands=augments.telchine.gloves.fastCast,
    left_ring="Weatherspoon Ring",
    right_ring="Kishar Ring",
    left_ear="Loquacious earring",
    right_ear="Etiolation Earring",
    legs="Kaykaus Tights",
    back=gear.cape.fastCast,
    waist="Witful Belt"
  }
  sets.Magic.Healing = {
    head="Kaykaus Mitra",
    -- neck="Henic Torque",
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
  sets.Magic.HealingPrecast = {
    head="Kaykaus Mitra",
    right_ear="Mendicant's Earring",
  }
  sets.Magic.HealingSelf = {
    waist="Chuq'aba belt"
  }
  sets.Magic.Cursna = {
    head="Kaykaus Mitra",                -- Cursna/Skill
    neck="Malison Medallion",            -- Cursna
    left_ear="Loquacious earring",       -- FC
    right_ear="Etiolation Earring",      -- FC
    body="Inyanga Jubbah +2",            -- FC
    hands=augments.telchine.gloves.enhancing,-- FC
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
    feet=augments.telchine.feet.enhancing
  }
  sets.Magic.Enfeebling = {
    main=gear.kali.refresh,
    head="Inyanga Tiara +1",
    body="Fili Hongreline +1",
    hands="Inyanga Dastanas +2",
    legs="Fili Rhingrave",
    feet="Inyan. Crackows +1",
    neck="Moonbow Whistle +1",
    left_ear="Digni. Earring",
    right_ear="Gwati Earring",
    left_ring="Weatherspoon Ring",
    right_ring="Inyanga Ring",
    waist="Porous Rope",
    back="Intarabus's Cape"
  }

  -- Songs
  sets.Songs = {}
  sets.Songs.Precast = set_combine(sets.Magic.Precast, {
    head="Fili Calot",
    feet=augments.telchine.feet.enhancing
  })
  sets.Songs.Dummy = {
    main=gear.kali.skill,
    ranged="Daurdabla",
    neck="Moonbow Whistle +1",
    body="Fili Hongreline +1",
    -- legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2"
  }
  sets.Songs.Duration = {
    main=gear.kali.skill,
    ranged="Gjallarhorn",
    neck="Moonbow Whistle +1",
    body="Fili Hongreline +1",
    right_ring="Stikini Ring",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2"
  }
  sets.Songs.Accuracy = {
    main=gear.kali.skill,
    ranged="Gjallarhorn",
    head="Inyanga Tiara +1",
    body="Fili Hongreline +1",
    hands="Inyanga Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Moonbow Whistle +1",
    left_ear="Digni. Earring",
    right_ear="Regal Earring",
    left_ring="Weatherspoon Ring",
    right_ring="Stikini Ring",
    waist="Porous Rope",
    back="Intarabus's Cape",
  }
  sets.Songs.List = {}
  sets.Songs.List.Ballad = { legs="Fili Rhingrave" }
  sets.Songs.List.Carol = { hands="Mousai Gages" }
  sets.Songs.List.Elegy = { }
  sets.Songs.List.Finale = {}
  sets.Songs.List.Lullaby = { ranged="Daurdabla", hands="Brioso Cuffs +2" }
  sets.Songs.List.Madrigal = { head="Fili Calot" }
  sets.Songs.List.March = { hands="Fili Manchettes" }
  sets.Songs.List.Mambo = { }
  sets.Songs.List.Mazurka = { }
  sets.Songs.List.Minne = { legs="Mousai Seraweels" }
  sets.Songs.List.Minuet = { body="Fili Hongreline +1" }
  sets.Songs.List.Paeon = { }
  sets.Songs.List.Scherzo = { feet="Fili Cothurnes +1" }
  sets.Songs.List.Threnody = { body="Mousai Manteel" }

  -- Abilities
  sets.JobAbility = {}
  sets.JobAbility.Troubadour = { body="Bihu Justaucorps" }
  sets.JobAbility.Nightingale = { feet="Bihu Slippers" }

  -- Melee
  sets.WeaponSkill = set_combine(sets.Engaged, {

  })
end

function precast(spell)
  if spell.type == 'JobAbility' then
    equip(sets.JobAbility[spell.english])

  elseif spell.type == 'BardSong' then
    equip(sets.Songs.Precast)
    if string.find(spell.english, 'Lullaby') then
      equip({ ranged="Daurdabla" })
    end

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.Precast)
    if string.find(spell.english, 'Cure') or string.find(spell.english, 'Curaga') then
      equip(sets.Magic.HealingPrecast)
    end

  elseif spell.type == 'WeaponSkill' then
    equip(sets.WeaponSkill)
    equip(sets.WeaponSkill[spell.english])
  end

  precast_cancelations(spell)
  maintain_reraise_equip()
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
    if DummySongs:contains(spell.english) then
      equip(sets.Songs.Dummy)
    elseif spell.target.type == 'MONSTER' then
      equip(sets.Songs.Accuracy)
    else
      equip(sets.Songs.Duration)
    end
    for key, gear in pairs(sets.Songs.List) do
      if string.find(spell.english, key) then
        equip(gear)
        break
      end
    end

  -- Cures
  elseif spell.skill == 'Healing Magic' then
    if eng == "Cursna" then
      equip(sets.Magic.Cursna)

    elseif string.find(eng, 'Cure') or string.find(eng, 'Curaga') then
      equip(sets.Magic.Healing)
      if spell.target.type == 'SELF' then
        equip(sets.Magic.HealingSelf)
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

  maintain_reraise_equip()
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
end

function status_change(new, old)
  if new == 'Resting' then
    equip(sets.Resting)
  elseif new == 'Engaged' then
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
  elseif command == 'cycle' then
    -- local mode = _G[commandArgs[2]]
    -- if mode ~= nil and mode._class == 'mode' then
    --   mode:cycle()
    --   add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
    -- end
    equip(sets.Idle)
  elseif command == 'idle' then
    equip(sets.Idle)
  elseif command == 'run' then
    equip(sets.MoveSpeed)
  elseif command == 'dummy' then
    play_dummy()
  end
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

function play_dummy()
  DummyIndex = DummyIndex + 1
  if DummyIndex > #DummySongs then
    DummyIndex = 1
  end
  local song = DummySongs[DummyIndex]
  send_command('@input /ma "'..song..'" <me>')
end
