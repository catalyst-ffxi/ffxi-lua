include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')
include('utils.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'Hybrid', 'Accuracy'}
  Luzaf = M(true, 'Luzaf')
  Compensator = M(true, 'Compensator')
  Weapons = M{
    ['description'] = 'Weapons',
    'Fomalhaut',
    'HollidayMagic',
    -- 'HollidayPhys',
    'Anarchy',
  }
end

function define_binds()
  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  send_command("alias g15v2_m1g3 gs c cycle Luzaf")
  send_command("alias g15v2_m1g4 gs c weapon")
  send_command('bind !f9 input /item "Echo Drops" <me>')
  send_command('bind !f10 input /item "Remedy" <me>')
  send_command('bind !f11 input /item "Holy Water" <me>')
end

function define_gear()

end

function get_sets()

  define_modes()
  define_binds()

  gear = {
    camulus = {
      meleeTp = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
      rangedTp = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
      rangedWsMagic = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}},
      rangedWsPhys = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
      meleeWs = { name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
      snapShot = { name="Camulus's Mantle", augments={'"Snapshot"+10',}}
    },
    weapons = {
      HollidayMagic = { name="Holliday", augments={'"Mag.Atk.Bns."+21','Potency of "Cure" effect received+7%','Mag. Acc.+20 "Mag.Atk.Bns."+20','DMG:+5',}},
      -- HollidayPhys = { name="Holliday", augments={'"Store TP"+6','Rng.Acc.+28','Rng.Atk.+18','DMG:+28',}},
      Fomalhaut = "Fomalhaut",
      Anarchy = "Anarchy +2",
    },
    bullets = {
      quickDraw = "Animikii Bullet",
      rangedAtt = "Chrono Bullet",
      magicWs = "Orichalc. Bullet"
    }
  }

  sets.modes = {}
  sets.modes.Normal = {
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands=augments.herc.hands.triple,
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,
    neck="Iskur Gorget",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back=gear.camulus.meleeTp,
  }
  sets.modes.Hybrid = {
    -- Lanun:                         -- 8 DT
    head="Adhemar Bonnet +1",
    body="Lanun Frac +3",             -- 6 PDT
    hands=augments.herc.hands.triple, -- 2 PDT
    legs="Meg. Chausses +2",          -- 6 PDT
    feet=augments.herc.feet.triple,   -- 2 PDT
    neck="Loricate Torque +1",        -- 6 DT
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Gelatinous Ring +1",   -- 7 PDT
    right_ring="Defending Ring",      -- 10 DT
    back=gear.camulus.meleeTp,        -- 5 DT
  }                                   -- 52 PDT | 29 MDT
  sets.modes.Accuracy = {
    head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Sanctity Necklace",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Regal Ring",
    right_ring="Ilabrat Ring",
    back=gear.camulus.meleeTp
  }

  sets.Idle = {
    head="Adhemar Bonnet +1",
    body="Lanun Frac +3",
    hands=augments.herc.hands.triple,
    legs="Meg. Chausses +2",
    feet=augments.herc.feet.triple,
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Genmei Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring +1",
    back=gear.camulus.meleeTp,
  }

  -- sets.Idle = set_combine(
  --   sets.modes.Normal,
  --   { left_ring="Karieyh Ring +1" }
  -- )

  -- Shooting
  sets.Preshot = {                           -- Snap | Rapid
    head=augments.taeon.head.shapshot,       --   8    0
    neck="Commodore Charm +1",               --   3
    body="Laksamana's Frac +3",              --   0    18
    hands="Carmine Finger Gauntlets +1",     --   8    11
    legs=augments.adhemar.kecks.rapidShot,   --   9    10
    feet="Meg. Jam. +2",                     --  10    0
    waist="Yemaya Belt",                     --   0    5
    back=gear.camulus.snapShot               --  10    0
                                      -- Total:  48    44
  }
  sets.TripleShot = {
    -- body="Chasseur's Frac"
  }
  sets.Ranged = {
    ammo=gear.bullets.rangedAtt,
    head="Meghanada Visor +2",
    body="Nisroch Jerkin",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Enervating Earring",
    left_ring="Regal Ring",
    right_ring="Dingir Ring",
    back=gear.camulus.rangedTp
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.FastCast = {
    head=augments.herc.head.fc,         -- 12
    neck="Orunmila's Torque",           -- 5
    body="Taeon Tabard",                -- 8
    hands="Leyline Gloves",             -- 7
    lear="Loquacious earring",          -- 2
    rear="Etiolation Earring",          -- 1
    lring="Kishar Ring",                -- 4
    rring="Prolix Ring",                -- 2
    legs=augments.taeon.legs.phalanx,   -- 3
    feet="Carmine Greaves +1"           -- 8
  }
  sets.Magic.SpellInterrupt = {
    head=augments.taeon.head.SID,    -- 7
    neck="Loricate Torque +1",
    -- lear="Halasz Earring",           -- 5
    rear="Magnetic earring",         -- 8
    body="Lanun Frac +3",
    hands="Rawhide Gloves",          -- 15
    left_ring="Gelatinous Ring +1",
    right_ring="Defending Ring",
    back=gear.camulus.meleeTp,
    waist="Flume Belt +1",
    legs="Carmine Cuisses +1",       -- 20
    feet=augments.taeon.feet.phalanx -- 9
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.RangedPhys = {
    ammo=gear.bullets.rangedAtt,
    head="Meghanada Visor +2",
    neck="Fotia Gorget",
    left_ear="Ishvara Earring",
    right_ear="Moonshade earring",
    body="Laksamana's Frac +3",
    hands="Meg. Gloves +2",
    left_ring="Regal Ring",
    right_ring="Dingir Ring",
    back=gear.camulus.rangedWsPhys,
    waist="Fotia Belt",
    legs="Meg. Chausses +2",
    feet="Lanun Bottes +3"
  }
  sets.WS.RangedMagic = {
    ammo=gear.bullets.magicWs,
    head=augments.herc.head.mab,
    neck="Commodore Charm +1",
    left_ear="Friomisi Earring",
    right_ear="Ishvara Earring",
    body="Lanun Frac +3",
    hands="Carmine Fin. Ga. +1",
    left_ring="Karieyh Ring +1",
    right_ring="Dingir Ring",
    back=gear.camulus.rangedWsMagic,
    waist="Eschan Stone",
    legs=augments.herc.legs.magic,
    feet="Lanun Bottes +3"
  }
  sets.WS.Melee = {
    head=augments.herc.head.wsd,
    neck="Fotia Gorget",
    left_ear="Ishvara Earring",
    right_ear="Moonshade Earring",
    body="Laksamana's Frac +3",
    hands="Meg. Gloves +2",
    left_ring="Karieyh Ring +1",
    right_ring="Regal Ring",
    back=gear.camulus.meleeWs,
    waist="Prosilio Belt +1",
    legs=augments.herc.legs.ws,
    feet="Lanun Bottes +3"
  }

  -- WS Specific
  sets.WS['Leaden Salute'] = set_combine(sets.WS.RangedMagic, {
    head="Pixie Hairpin +1",
    right_ear="Moonshade Earring",
    left_ring="Archon Ring",
    waist="Svelt. Gouriz +1"
  })
  sets.WS['Wildfire'] = sets.WS.RangedMagic
  sets.WS['Last Stand'] = sets.WS.RangedPhys
  sets.WS['Detonator'] = sets.WS.RangedPhys
  sets.WS['Slug Shot'] = sets.WS.RangedPhys
  sets.WS['Requiescat'] = sets.WS.Melee
  sets.WS['Savage Blade'] = sets.WS.Melee
  sets.WS['Circle Blade'] = sets.WS.Melee
  sets.WS['Evisceration'] = sets.WS.Melee
  sets.WS['Aeolian Edge'] = {
    ammo=gear.bullets.quickDraw,
    head=augments.herc.head.mab,
    neck="Sanctity Necklace",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    body="Lanun Frac +3",
    hands="Carmine Fin. Ga. +1",
    left_ring="Acumen Ring",
    right_ring="Dingir Ring",
    back=gear.camulus.rangedWsMagic,
    waist="Eschan Stone",
    legs=augments.herc.legs.magic,
    feet="Lanun Bottes +3"
  }

  -- Quick Draw
  --
  sets.JAs = {}
  sets.JAs.QuickDrawMab = {
    ammo=gear.bullets.quickDraw,
    head=augments.herc.head.mab,
    neck="Sanctity Necklace",
    left_ear="Friomisi Earring",
    right_ear="Strophadic Earring",
    body="Lanun Frac +3",
    hands="Carmine Fin. Ga. +1",
    left_ring="Arvina Ringlet +1",
    right_ring="Dingir Ring",
    back=gear.camulus.rangedWsMagic,
    legs=augments.herc.legs.magic,
    feet="Lanun Bottes +3",
    waist="Eschan Stone"
  }
  sets.JAs.QuickDrawSTP = {
    ammo=gear.bullets.quickDraw,
    -- head=augments.herc.head.mab,
    neck="Iskur Gorget",
    -- left_ear="Friomisi Earring",
    -- right_ear="Strophadic Earring",
    -- body="Lanun Frac +3",
    -- hands="Carmine Fin. Ga. +1",
    -- left_ring="Arvina Ringlet +1",
    -- right_ring="Dingir Ring",
    back=gear.camulus.rangedTp,
    -- legs=augments.herc.legs.magic,
    -- feet="Lanun Bottes +3",
    -- waist="Eschan Stone"
  }
  sets.JAs.QuickDrawAcc = {
    ammo=gear.bullets.quickDraw,
    head=augments.herc.head.mab,
    neck="Sanctity Necklace",
    left_ear="Dignitary's Earring",
    right_ear="Gwati Earring",
    body="Lanun Frac +3",
    hands="Leyline Gloves ",
    left_ring="Arvina Ringlet +1",
    right_ring="Stikini Ring",
    back=gear.camulus.rangedWsMagic,
    legs=augments.herc.legs.magic,
    feet="Lanun Bottes +3",
    waist="Eschan Stone"
  }

  -- Job Abilities
  --
  sets.JAs.PhantomRoll = {
    -- ranged = "Compensator",  -- See precast
    head="Lanun Tricorne +1",
    neck="Regal Necklace",
    hands="Chasseur's Gants +1",
    -- rring = "Luzaf's Ring",  -- See precast
    back="Camulus's Mantle",
    legs="Desultor Tassets"
  }
  sets.JAs['Snake Eye'] = { legs = "Lanun Trews" }
  sets.JAs['Random Deal'] = { body = "Lanun Frac +3" }
  sets.JAs['Wild Card'] = { feet = "Lanun Bottes +3" }
  sets.JAs.Waltz = { lring = 'Asklepian Ring' }

  sets.Doom = {
    neck="Nicander's Necklace",
    left_ring="Purity Ring",
    right_ring="Blenmot's Ring",
    waist="Gishdubar Sash"
  }
end

function precast(spell)
  precast_cancelations(spell)

  if spell.type == 'CorsairRoll' or spell.english == "Double-Up" then
    equip(sets.JAs.PhantomRoll)
    if Luzaf.value then
      equip({rring = "Luzaf's Ring"})
    end
    -- if Compensator.value
    --     and player.tp < 1000
    --     and player.status ~= 'Engaged'
    --     and spell.type == 'CorsairRoll' then
    --   equip({ranged = "Compensator"})
    -- end

  elseif sets.JAs[spell.english] then
    equip(sets.JAs[spell.english])

  elseif spell.type == 'CorsairShot' then
    if spell.english == 'Light Shot' or spell.english == 'Dark Shot' then
      equip(sets.JAs.QuickDrawAcc)
    else
      equip(sets.JAs.QuickDrawMab)
    end

  elseif spell.english == "Ranged" then
    equip(sets.Preshot)
    equip({ammo = gear.bullets.rangedAtt})

    if buffactive['Triple Shot'] then
      equip(sets.TripleShot)
    end

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.FastCast)

  elseif spell.type == 'WeaponSkill' then
    equip(sets.WS[spell.english])

    if spell.english == "Leaden Salute" then
      -- Replace moonshade earring if tp is capped
      if player.tp > 2900 then
        equip({ right_ear="Ishvara Earring" })
      end
      -- Equip elemental obi in dark weather
      if world.weather_element == "Dark" or world.day_element == "Dark" then
        equip({ waist = "Anrin Obi" })
      end
    end
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
  if spell.english == 'Ranged' then
    equip(sets.Ranged)

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.SpellInterrupt)
  end
end

function aftercast(spell)
  if player.in_combat then
    if player.status == 'Engaged' then
      equip(set_for_engaged())
    else
      -- equip(sets.Idle)
    end
  end
  -- if Compensator.value and player.equipment.ranged == 'Compensator' then
  --   equip({ ranged = gear.weapons[Weapons.current] })
  -- end
end

function status_change(new, old)
  if new == 'Engaged' then
    equip(set_for_engaged())
  else
    -- equip(sets.Idle)
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

  if command == 'run' then
    equip({ legs="Carmine Cuisses +1" })
  elseif command == "mode" then
    equip(set_for_engaged())
  elseif command == 'weapon' then
    Weapons:cycle()
    add_to_chat(122, 'SET [Weapon] to ' .. Weapons.current)
    equip({ ranged = gear.weapons[Weapons.current] })
  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
    end
    equip(set_for_engaged())
  end
end

function set_for_engaged()
  return sets.modes[PrimaryMode.current]
end

function set_for_ws(named)
  if sets.WS[named] then
    return sets.WS[named]
  else
    return sets.WS.Melee
  end
end
