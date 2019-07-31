include('Modes.lua')
include('augments_tadako.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'Hybrid'}
  Capacity = M(false, 'Capacity Mantle')
end

function define_aliases()
  -- Self Buffs
  send_command('bind !f5 stoneskin')
  send_command('bind !f6 phalanx')
  send_command('bind !f7 blink')
  send_command('bind !f8 aquaveil')
  send_command("alias g15v2_m2g1 gs c cycle PrimaryMode")
end

function get_sets()
  define_modes()
  define_aliases()

  gear = {}

  -- Modes
  sets.Engaged = {}
  sets.Engaged.Normal = {
    -- main="Aeneas",
    -- sub="Sandung",
    ranged="Compensator",
    -- ammo="Gashing Bolt",
    head="Skormoth Mask",
    body="Pillager's Vest +3",
    hands=augments.herc.hands.tp,
    legs="Samnuha Tights",
    feet=augments.herc.feet.tp,
    neck="Anu Torque",
    waist="Sarissapho. Belt",
    left_ear="Suppanomimi",
    right_ear="Sherida Earring",
    left_ring="Hetairoi Ring",
    right_ring="Petrov Ring",
    back="Camulus's Mantle"
  }
  sets.Engaged.Hybrid = sets.Engaged.Normal

  sets.Idle = {
    main="Mafic Cudgel",
    sub="Nusku Shield",
    range="Compensator",
    head="Mummu Bonnet +2",
    body="Mummu Jacket +2",
    hands="Mummu Wrists +2",
    legs="Meg. Chausses +2",
    feet="Mummu Gamash. +2",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Flashward Earring",
    right_ear="Etiolation Earring",
    left_ring="Gelatinous Ring +1",
    right_ring="Purity Ring",
    back="Camulus's Mantle"
  }

  -- Weapon Skills
  sets.WS = {}

  -- Abilities
  sets.JA = {}
  sets.JA.PhantomRoll = {
    ranged="Compensator",
    head="Lanun Tricorne",
    neck="Regal Necklace",
    hands="Navarch's gants +1",
    right_ring="Luzaf's Ring",
    back="Camulus's Mantle",
  }
  sets.JA['Snake Eye'] = { legs = "Lanun Trews" }
  sets.JA['Random Deal'] = { body = "Lanun Frac" }
  sets.JA['Wild Card'] = { feet = "Lanun Bottes" }

  sets.JA.QuickDraw = {
    head=augments.herc.head.magic,
    body=augments.herc.body.magic,
    hands=augments.herc.hands.magic,
    legs=augments.herc.legs.magic,
    feet=augments.herc.feet.magic,
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Digni. Earring",
    right_ear="Friomisi Earring",
    left_ring="Weatherspoon Ring",
    right_ring="Acumen Ring",
    back="Camulus's Mantle",
  }

  -- Ranged Attacks
  sets.Preshot = {
    -- head="Taeon Chapeau",
    body="Pursuer's Doublet",
    -- hands="Taeon Gloves",
    -- legs="Adhemar Kecks",
    feet="Meg. Jam. +2",
    -- waist="Yemaya Belt",
    -- back="Toutatis's Cape"
  }
  sets.Ranged = {
    head="Mummu Bonnet +2",
    body="Mummu Jacket +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Suppanomimi",
    right_ear="Sherida Earring",
    left_ring="Mummu Ring",
    right_ring="Petrov Ring",
    back="Camulus's Mantle"
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.Precast = {
    body="Samnuha Coat",
    hands="Leyline Gloves",
    neck="Orunmila's torque",
    left_ring="Weatherspoon Ring",
    left_ear="Loquacious earring",
    right_ear="Etiolation Earring"
  }
  sets.Magic.SpellInterrupt = {
  }
end

function precast(spell)
  if spell.type == 'CorsairRoll' or spell.english == "Double-Up" then
    equip(sets.JA.PhantomRoll)

  elseif spell.type == 'CorsairShot' then
    equip(sets.JA.QuickDraw)

  elseif spell.type == 'JobAbility' then
    equip(sets.JA[spell.english])

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.Precast)

  elseif spell.type == 'WeaponSkill' then
    equip(sets.WS[spell.english] or sets.WS.Rudra)

  elseif spell.english == "Ranged" then
    equip(sets.Preshot)
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
  if spell.english == 'Ranged' then
    equip(sets.Ranged)

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.SpellInterrupt)
  end
end

function aftercast(spell)
  if player.status=='Engaged' then
    equip(sets.Engaged[PrimaryMode.current])
  else
    equip(sets.Idle)
  end
end

function status_change(new, old)
  if new == 'Resting' then
    equip(sets.Resting)
  elseif new == 'Engaged' then
    equip(sets.Engaged[PrimaryMode.current])
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
      equip(sets.Engaged[PrimaryMode.current])
    else
      equip(sets.Idle)
    end
  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
      equip(sets.Engaged[mode.current])
    end
  elseif command == 'idle' then
    equip(sets.Idle)
  end
end
