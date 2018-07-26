include('Mote-Mappings.lua')
include('Modes.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'Hybrid'}
  Capacity = M(false, 'Capacity Mantle')
  Luzaf = M(true, 'Luzaf')
  Weapons = M{['description'] = 'Weapons', 'HollidayMagic', 'HollidayPhys', 'Compensator'}
end

function define_binds()
  windower.send_command('lua reload autora')

  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  send_command("alias g15v2_m1g2 gs c cycle Capacity")
  send_command("alias g15v2_m1g3 gs c cycle Luzaf")
  send_command("alias g15v2_m1g4 gs c weapon")
end

function define_gear()

end

function get_sets()

  define_modes()
  define_binds()
  define_roll_values()

  gear = {
    herc = {
      head = {
        wsd = { name="Herculean Helm", augments={'Rng.Atk.+18','Weapon skill damage +4%','MND+10','Rng.Acc.+13',}},
        mab = { name="Herculean Helm", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Crit. hit damage +3%','INT+2','Mag. Acc.+13','"Mag.Atk.Bns."+15',}},
        pdt = { name="Herculean Helm", augments={'DEX+3','Phys. dmg. taken -5%',}}
      },
      hands = {
        triple = { name="Herculean Gloves", augments={'"Triple Atk."+2','Accuracy+13','Attack+7',}},
        magicWs = {}
      },
      legs = {
        ws = { name="Herculean Trousers", augments={'Accuracy+25 Attack+25','Weapon skill damage +3%','DEX+7',}},
        magicWs = { name="Herculean Trousers", augments={'"Mag.Atk.Bns."+25','Pet: Mag. Acc.+14','Accuracy+12 Attack+12','Mag. Acc.+17 "Mag.Atk.Bns."+17',}}
      },
      feet = {
        triple = { name="Herculean Boots", augments={'Accuracy+9','"Triple Atk."+2','STR+5','Attack+12',}},
        magicWs = {name="Herculean Boots", augments={'Mag. Acc.+18','Weapon skill damage +2%','INT+4','"Mag.Atk.Bns."+10',}}
      }
    },
    adhemar = {
      kecks = {
        rapidShot = { name="Adhemar Kecks", augments={'AGI+10','"Rapid Shot"+10','Enmity-5',}},
        racc = {}
      }
    },
    carmine = {
      hands = {
        magic = { name="Carmine Fin. Ga.", augments={'Rng.Atk.+15','"Mag.Atk.Bns."+10','"Store TP"+5',}}
      }
    },
    taeon = {
      chapeau = { name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+3',}}
    },
    camulus = {
      meleeTp = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
      rangedTp = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
      rangedWsMagic = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}},
      rangedWsPhys = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
      meleeWs = { name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
      snapShot = { name="Camulus's Mantle", augments={'"Snapshot"+10',}}
    }
  }

  gear.weapons = {
    HollidayMagic = { name="Holliday", augments={'"Mag.Atk.Bns."+21','Potency of "Cure" effect received+7%','Mag. Acc.+20 "Mag.Atk.Bns."+20','DMG:+5',}},
    HollidayPhys = { name="Holliday", augments={'"Store TP"+6','Rng.Acc.+28','Rng.Atk.+18','DMG:+28',}},
    Compensator = "Compensator"
  }

  gear.bullets = {
    quickDraw = "Animikii Bullet",
    rangedAtt = "Eminent Bullet"
  }

  sets.modes = {}
  sets.modes.Normal = {}
  sets.modes.Normal.Engaged = {
    head="Adhemar Bonnet",
    body="Adhemar Jacket +1",
    hands=gear.herc.hands.triple,
    legs="Carmine Cuisses +1",
    feet=gear.herc.feet.triple,
    neck="Iskur Gorget",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Ilabrat Ring",
    right_ring="Epona's Ring",
    back=gear.camulus.meleeTp,
  }
  sets.modes.Normal.Ranged = {
    -- ammo=gear.bullets.rangedAtt,
    head="Meghanada Visor +2",
    -- body="Laksamana's Frac +3",
    body = "Mummu Jacket +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Enervating Earring",
    left_ring="Longshot Ring",
    right_ring="Arvina Ringlet +1",
    back=gear.camulus.rangedTp
  }
  sets.modes.Normal.Idle = set_combine(sets.modes.Normal.Engaged, {
    head = gear.herc.head.pdt,
    neck="Loricate Torque +1",
    body="Laksamana's Frac +3",
    hands = "Herculean Gloves",
    legs="Carmine Cuisses +1",
    lring = "Gelatinous Ring +1",
    rring = "Defending Ring",
    back="Solemnity Cape",
    waist="Flume Belt +1",
    legs = "Carmine Cuisses +1",
    feet = "Lanun Bottes +3"
  })

  sets.DamageDown = {
    neck = "Loricate Torque +1",
    body = "Lanun Frac +2",
    left_ear = "Etiolation Earring",
    lring = "Gelatinous Ring +1",
    rring = "Defending Ring",
    waist = "Flume Belt +1",
  }

  sets.modes.Hybrid = {}
  sets.modes.Hybrid.Engaged = set_combine(
    sets.modes.Normal.Engaged, 
    sets.DamageDown
  )
  sets.modes.Hybrid.Ranged = set_combine(
    sets.modes.Normal.Ranged, 
    sets.DamageDown
  )
  sets.modes.Hybrid.Idle = set_combine(
    sets.modes.Normal.Idle, 
    sets.DamageDown
  )

  sets.Preshot = {                       -- Snap | Rapid
    head=gear.taeon.chapeau,             --   8    0
    body="Laksamana's Frac +3",          --   0    18
    hands="Carmine Finger Gauntlets",    --   7    10
    legs=gear.adhemar.kecks.rapidShot,   --   9    10
    feet="Meg. Jam. +2",                 --  10    0
    waist="Yemaya Belt",                 --   0    a5
    back=gear.camulus.snapShot           --  10    0
                                  -- Total:  44    43
  }
  sets.TripleShot = {
    body = "Chasseur's Frac"
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.FastCast = {
    hands = "Leyline Gloves", -- 5
    lear = "Loquacious earring",   -- 2
    rear = "Magnetic earring",
    -- lring = "Weatherspoon Ring",   -- 5
    rring = "Prolix Ring"         -- 2
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.RangedPhys = {
    head="Meghanada Visor +2",
    neck="Fotia Gorget",
    left_ear="Ishvara Earring",
    right_ear="Enervating earring",
    body="Laksamana's Frac +3",
    hands="Meg. Gloves +2",
    lring="Karieyh Ring +1",
    right_ring="Dingir Ring",
    back=gear.camulus.rangedWsPhys,
    waist="Fotia Belt",
    legs="Meg. Chausses +2",
    feet="Lanun Bottes +3"
  }
  sets.WS.RangedMagic = {
    head=gear.herc.head.mab,
    neck="Sanctity Necklace",
    left_ear="Friomisi Earring",
    right_ear="Ishvara Earring",
    body="Lanun Frac +2",
    hands="Carmine Fin. Ga. +1",
    left_ring="Karieyh Ring +1",
    right_ring="Dingir Ring",
    back=gear.camulus.rangedWsMagic,
    waist="Svelt. Gouriz +1",
    legs=gear.herc.legs.magicWs,
    feet="Lanun Bottes +3"
  }
  sets.WS.Melee = {
    head=gear.herc.head.wsd,
    neck="Fotia Gorget",
    left_ear="Ishvara Earring",
    right_ear="Moonshade Earring",
    body="Laksamana's Frac +3",
    hands="Meg. Gloves +2",
    left_ring="Karieyh Ring +1",
    right_ring="Shukuyu Ring",
    back=gear.camulus.meleeWs,
    waist="Prosilio Belt +1",
    legs=gear.herc.legs.ws,
    feet="Lanun Bottes +3"
  }

  -- WS Specific
  sets.WS['Leaden Salute'] = set_combine(sets.WS.RangedMagic, {
    head = "Pixie Hairpin +1",
    lring = "Archon Ring"
  })
  sets.WS['Wildfire'] = sets.WS.RangedMagic
  sets.WS['Last Stand'] = sets.WS.RangedPhys
  sets.WS['Detonator'] = {}
  sets.WS['Slug Shot'] = sets.WS.RangedPhys
  sets.WS['Requiescat'] = sets.WS.Melee
  sets.WS['Savage Blade'] = sets.WS.Melee
  sets.WS['Aeolian Edge'] = {
    ammo=gear.bullets.quickDraw,
    head=gear.herc.head.mab,
    neck = "Sanctity Necklace",
    left_ear="Friomisi Earring",
    right_ear="Ishvara Earring",
    body="Laksamana's Frac +3",
    hands="Carmine Fin. Ga. +1",
    left_ring="Acumen Ring",
    right_ring = "Dingir Ring",
    back=gear.camulus.rangedWsMagic,
    waist="Caudata Belt",
    legs=gear.herc.legs.magicWs,
    feet="Lanun Bottes +3"
  }

  -- Job Abilities
  --
  sets.JAs = {}
  sets.JAs.QuickDrawMab = set_combine(sets.modes.Normal.Ranged, {
    ammo=gear.bullets.quickDraw,
    head=gear.herc.head.mab,
    neck = "Sanctity Necklace",
    left_ear="Friomisi Earring",
    right_ear="Strophadic Earring",
    body = "Lanun Frac +2",
    hands = "Carmine Fin. Ga. +1",
    left_ring="Arvina Ringlet +1",
    right_ring = "Dingir Ring",
    back=gear.camulus.rangedWsMagic,
    legs=gear.herc.legs.magicWs,
    feet="Lanun Bottes +3",
    waist="Yemaya Belt"
    -- waist="Salir Belt"
  })
  sets.JAs.QuickDrawAcc = set_combine(sets.modes.Normal.Ranged, {
    ammo=gear.bullets.quickDraw,
    left_ear="Dignitary's Earring",
    right_ear="Gwati Earring",
    left_ring="Arvina Ringlet +1"
  })
  sets.JAs.PhantomRoll = {
    head = "Lanun Tricorne +1",
    neck = "Regal Necklace",
    hands = "Chasseur's Gants",
    -- lring = "Barataria Ring",
    -- rring = "Luzaf's Ring",
    back = "Camulus's Mantle",
    legs = "Desultor Tassets"
  }
  sets.JAs['Snake Eye'] = { legs = "Lanun Culottes" }
  sets.JAs['Random Deal'] = { body = "Lanun Frac +2" }
  sets.JAs['Wild Card'] = { feet = "Lanun Bottes +3" }
  sets.JAs.Waltz = { lring = 'Asklepian Ring' }
end

function precast(spell)
  precast_cancelations(spell)

  if spell.type == 'CorsairRoll' or spell.english == "Double-Up" then
    equip(sets.JAs.PhantomRoll)
    if Luzaf.value then
      equip({rring = "Luzaf's Ring"})
    end
    if not spell.interrupted then
      display_roll_info(spell)
    end

  elseif sets.JAs[spell.english] then
    equip(sets.JAs[spell.english])

  elseif spell.type == 'CorsairShot' then
    equip({ammo = gear.bullets.quickDraw})
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
    precast_magic(spell)

  elseif spell.type == 'WeaponSkill' then
    equip(set_for_ws(spell.english))
    equip({ ammo = gear.bullets.rangedAtt })

    -- Equip moonshade if TP is not capped
    if player.tp < 2900 then
      equip({ right_ear = "Moonshade Earring" })
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

function precast_magic(spell)
  equip(sets.Magic.FastCast)
end


function midcast(spell)
  if spell.english == 'Ranged' then
    equip(sets.modes[PrimaryMode.current].Ranged)
  end
end

function aftercast(spell)
  if player.in_combat then
    -- if player.status == 'Engaged' then
      equip(sets.modes[PrimaryMode.current].Engaged)
    -- else
    --   equip(sets.modes[PrimaryMode.current].Idle)
    -- end
  end
end

function status_change(new, old)
  if new == 'Engaged' then
    equip(sets.modes[PrimaryMode.current].Engaged)
  else
    -- equip(sets.modes[PrimaryMode.current].Idle)
  end
  if Capacity.value then
    equip(sets.CapacityMantle)
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
    equip(sets.modes[PrimaryMode.current].Idle)
  elseif command == "mode" then
    equip(sets.modes[PrimaryMode.current].Engaged)
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
    equip(sets.modes[PrimaryMode.current].Engaged)
  end
end

function set_for_ws(named)
  if sets.WS[named] then
    return sets.WS[named]
  else
    return sets.WS
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

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function define_roll_values()
  rolls = {
    ["Corsair's Roll"]   = {lucky=5, unlucky=9, bonus="Experience Points"},
    ["Ninja Roll"]       = {lucky=4, unlucky=8, bonus="Evasion"},
    ["Hunter's Roll"]    = {lucky=4, unlucky=8, bonus="Accuracy"},
    ["Chaos Roll"]       = {lucky=4, unlucky=8, bonus="Attack"},
    ["Magus's Roll"]     = {lucky=2, unlucky=6, bonus="Magic Defense"},
    ["Healer's Roll"]    = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
    ["Puppet Roll"]      = {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
    ["Choral Roll"]      = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
    ["Monk's Roll"]      = {lucky=3, unlucky=7, bonus="Subtle Blow"},
    ["Beast Roll"]       = {lucky=4, unlucky=8, bonus="Pet Attack"},
    ["Samurai Roll"]     = {lucky=2, unlucky=6, bonus="Store TP"},
    ["Evoker's Roll"]    = {lucky=5, unlucky=9, bonus="Refresh"},
    ["Rogue's Roll"]     = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
    ["Warlock's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
    ["Fighter's Roll"]   = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
    ["Drachen Roll"]     = {lucky=3, unlucky=7, bonus="Pet Accuracy"},
    ["Gallant's Roll"]   = {lucky=3, unlucky=7, bonus="Defense"},
    ["Wizard's Roll"]    = {lucky=5, unlucky=9, bonus="Magic Attack"},
    ["Dancer's Roll"]    = {lucky=3, unlucky=7, bonus="Regen"},
    ["Scholar's Roll"]   = {lucky=2, unlucky=6, bonus="Conserve MP"},
    ["Bolter's Roll"]    = {lucky=3, unlucky=9, bonus="Movement Speed"},
    ["Caster's Roll"]    = {lucky=2, unlucky=7, bonus="Fast Cast"},
    ["Courser's Roll"]   = {lucky=3, unlucky=9, bonus="Snapshot"},
    ["Blitzer's Roll"]   = {lucky=4, unlucky=9, bonus="Attack Delay"},
    ["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain"},
    ["Allies's Roll"]    = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
    ["Miser's Roll"]     = {lucky=5, unlucky=7, bonus="Save TP"},
    ["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
    ["Avenger's Roll"]   = {lucky=4, unlucky=8, bonus="Counter Rate"},
    ["Runeist's Roll"]   = {lucky=4, unlocky=8, bonus="Magic Evasion"},
  }
end

function display_roll_info(spell)
  rollinfo = rolls[spell.english]
  -- local rollsize = (state.LuzafRing.value and 'Large') or 'Small'

  if rollinfo then
    -- add_to_chat(104, spell.english..' provides a bonus to '..rollinfo.bonus..'.  Roll size: '..rollsize)
    add_to_chat(104, spell.english..' provides a bonus to '..rollinfo.bonus..'.')
    add_to_chat(104, 'Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'.')
  end
end
