include('Mote-Mappings.lua')
include('Modes.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'Kenda', 'Accuracy', 'AccuracyHigh'}
  DamageDown = M(false, 'Damage Down')
  Capacity = M(false, 'Capacity Mantle')
  TreasureHunter = M(false, 'Treasure Hunter')
end

function define_binds()
  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  send_command("alias g15v2_m1g2 gs c cycle Capacity")
  send_command("alias g15v2_m1g3 gs c cycle DamageDown")
  send_command("alias g15v2_m1g4 gs c cycle TreasureHunter")

  -- send_command('bind !f11 input /equip main "Norifusa +1"; @wait 0.5; input /equip sub "Bloodrain Strap"')
  -- send_command('bind !f12 input /equip main "Amanomurakumo"; @wait 0.5; input /equip sub "Bloodrain Strap"')
  -- send_command('bind !f10 gs c toggle_ranged')
end

function define_gear()

end

function get_sets()

  define_modes()
  define_binds()

  gear = {
    valorous = {
      mask = {
        stp = {name = "Valorous Mask", augments = {'Accuracy+9 Attack+9','"Store TP"+5','DEX+10','Accuracy+4','Attack+8',}},
        da = { name="Valorous Mask", augments={'Accuracy+22','"Dbl.Atk."+4','VIT+1',}},
        ws_high ={ name="Valorous Mask", augments={'"Mag.Atk.Bns."+30','Enmity+3','Weapon skill damage +6%','Accuracy+16 Attack+16','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
        ws_acc = {name = 'Valorous mask', augments = {'Accuracy +28', 'Weapon skill damage +3%'}},
        waltz = { name="Valorous Mask", augments={'"Waltz" potency +10%','Accuracy+7','Accuracy+8 Attack+8',}},
        treasure = { name="Valorous Mask", augments={'INT+2','Pet: Attack+5 Pet: Rng.Atk.+5','"Treasure Hunter"+2','Accuracy+5 Attack+5',}},
      },
      mitts = {
        ws = { name="Valorous Mitts", augments={'Attack+19','Weapon skill damage +4%','AGI+1','Accuracy+14',}}
      },
      hose = {
        quad = { name="Valor. Hose", augments={'STR+12','VIT+6','Quadruple Attack +3',}},
        dt = { name="Valor. Hose", augments={'STR+5','AGI+2','Damage taken-2%','Accuracy+20 Attack+20',}}
      },
      greaves = {
        da = { name="Valorous Greaves", augments={'"Dbl.Atk."+4','INT+8','Accuracy+18 Attack+18',}},
        ws = { name="Valorous Greaves", augments={'Attack+15','Weapon skill damage +3%','STR+6','Accuracy+7',}}
      }
    },
    acro = {
      body = {
        stp = {name = "Acro Surcoat", augments = {"STR +4", "Accuracy +10", "Store TP +6"}},
        ws = {name = "Acro Surcoat", augments = {"Accuracy +8", "Weapon Skill Acc. +9", "Weapon Skill Damage +3%"}}
      }
    },
    smertrios = {
      ws = {name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
      tp = {name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
    }
  }

  sets.modes = {}
  sets.modes.Kenda = {
    sub = "Bloodrain Strap",
    head = "Flam. Zucchetto +2",
    neck = "Moonbeam Nodowa",
    lear = "Cessance Earring",
    rear = "Brutal Earring",
    body = "Ken. Samue",
    hands = "Wakido Kote +3",
    lring = "Flamma Ring",
    rring = "Petrov Ring",
    back = gear.smertrios.tp,
    waist = "Ioskeha Belt",
    legs = gear.valorous.hose.quad,
    -- legs = "Ken. Hakama",
    feet = "Flam. Gambieras +2"
  }
  sets.modes.Normal = {
    sub = "Bloodrain Strap",
    head = "Flam. Zucchetto +2",
    neck = "Moonbeam Nodowa",
    lear = "Cessance Earring",
    rear = "Brutal Earring",
    body = "Kasuga Domaru +1",
    hands = "Wakido Kote +3",
    lring = "Flamma Ring",
    rring = "Petrov Ring",
    back = gear.smertrios.tp,
    waist = "Ioskeha Belt",
    legs = gear.valorous.hose.quad,
    feet = "Flam. Gambieras +2"
  }
  sets.modes.Accuracy = {
    sub = "Bloodrain Strap",
    head = "Flam. Zucchetto +2",
    neck = "Moonbeam Nodowa",
    lear = "Cessance Earring",
    rear = "Brutal Earring",
    body = "Wakido domaru +2",
    hands = "Wakido Kote +3",
    lring = "Flamma Ring",
    rring = "Hizamaru Ring",
    back = gear.smertrios.tp,
    waist = "Ioskeha Belt",
    legs = "Wakido Haidate +3",
    feet = "Flam. Gambieras +2"
  }
  sets.modes.AccuracyHigh = set_combine(sets.modes.Accuracy, {
    rear = "Dignitary's Earring",
    legs = "Wakido Haidate +3",
    feet = "Wakido Sune-ate +2"
  })

  -- Modifiers
  sets.DamageDown = {
    neck = "Loricate Torque +1",
    body = "Wakido domaru +2",
    lring = "Gelatinous Ring +1",
    rring = "Defending Ring",
    -- rring = "Fortified Ring",
    waist = "Flume Belt +1",
    legs = gear.valorous.hose.dt
  }
  sets.TreasureHunter = {
    head = gear.valorous.mask.treasure,
    waist = "Chaac belt"
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.Normal = {
    head = gear.valorous.mask.ws_high,
    neck = "Fotia Gorget",
    lear = "Ishvara Earring",
    rear = "Moonshade earring",
    body = "Sakonji Domaru +3",
    hands = gear.valorous.mitts.ws,
    lring = "Karieyh Ring +1",
    rring = "Shukuyu Ring",
    back = gear.smertrios.ws,
    waist = "Fotia Belt",
    legs = "Wakido Haidate +3",
    feet = gear.valorous.greaves.ws
  }
  sets.WS.Kenda = sets.WS.Normal
  sets.WS.Accuracy = {
    head = gear.valorous.mask.ws_acc,
    neck = "Fotia Gorget",
    lear = "Ishvara Earring",
    rear = "Moonshade earring",
    body = "Sakonji Domaru +3",
    hands = "Wakido Kote +3",
    lring = "Karieyh Ring +1",
    rring = "Rajas Ring",
    back = gear.smertrios.ws,
    waist = "Fotia Belt",
    legs = "Wakido Haidate +3",
    feet = gear.valorous.greaves.ws
  }
  sets.WS.AccuracyHigh = set_combine(sets.WS.Accuracy, {
    body = "Wakido Domaru +2",
    feet = "Wakido Sune-Ate +2"
  })

  -- WS Specific Sets
  -- sets.WS['Tachi: Kasha'] = {}
  -- sets.WS['Tachi: Fudo'] = {}
  -- sets.WS['Tachi: Kaiten'] = {}
  -- sets.WS['Tachi: Shoha'] = {}
  -- sets.WS['Tachi: Gekko'] = {}
  -- sets.WS['Tachi: Rana'] = {}
  -- sets.WS['Apex Arrow'] = {}

  -- Job Abilities
  --
  sets.JAs = {}
  sets.JAs.Meditate = {
    head = "Wakido Kabuto +1",
    hands = "Sakonji Kote +2",
    back = gear.smertrios.tp
  }
  sets.JAs['Warding Circle'] = {
    head = "Wakido Kabuto +1"
  }
  sets.utsusemi = {
    -- ammo = "Impatiens",
    hands = "Leyline Gloves",
    lear = "Loquacious earring",
    lring = "Weatherspoon ring",
    rring = "Prolix Ring"
  }
  sets.waltz = {
    head = gear.valorous.mask.waltz,
    lring = 'Asklepian Ring'
  }

  -- Ranged Attack
  --
  sets.JAs.ranged = {
    head = "Sakonji Kabuto +1",
    neck = "Yarak torque",
    lear = "Enervating Earring",
    rear = "Matanki Earring",
    hands = "Ryuo tekko",
    body = "Aetosaur Jerkin",
    lear = "Drone Earring",
    rear = "Enervating Earring",
    lring = "Longshot Ring",
    rring = "Hajduk Ring",
    legs = "Wakido Haidate +3",
    feet = "Wakido Sune-Ate +2",
    back = "Moondoe Mantle +1",
    waist = "Yemaya Belt"
  }
end

function precast(spell)
  if spell.type == 'WeaponSkill' then
    equip(set_for_ws(spell.english))
  elseif spell.type == 'JobAbility' then
    if sets.JAs[spell.english] then
      equip(sets.JAs[spell.english])
    end
    if spell.english == 'Third Eye' and not (buffactive['Seigan']) then
      cast_delay(1.3)
      send_command('@input /ja "Seigan" <me>')
    end
  elseif spell.english == 'Utsusemi: Ichi' or spell.english == 'Utsusemi: Ni' then
    equip(sets.utsusemi)
    if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
      send_command('@wait 3.3; cancel 66; cancel 444; cancel 445')
    end
  elseif spell.english == 'Spectral Jig' then
    cast_delay(0.5)
    send_command('@cancel 71;')
  elseif spell.english == 'Curing Waltz II' or spell.english == 'Curing Waltz III' then
    equip(sets.waltz)
  elseif spell.english == 'Ranged' then
    equip(sets.JAs.ranged)
  end

  maintain_reraise_equip()
end

function midcast(spell)

end

function aftercast(spell)
  if player.in_combat and not (buffactive['Meikyo Shisui']) then
    equip(set_for_engaged())
  end

  if spell.english == 'Meditate' then
    send_command('@wait 175; input /echo | ******** Meditate ready in 5 ******** |')
  elseif spell.english == 'Konzen-ittai' then

  end

  maintain_reraise_equip()
end

function status_change(new, old)
  if new == 'Engaged' then
    equip_set_for_current_mode()
    maintain_reraise_equip()
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
    equip_set_for_current_mode()
  elseif command == 'cycle' then

    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
      equip_set_for_current_mode()
      if mode.description == 'Primary Mode' then
        -- equip_set_for_current_mode()
      elseif mode.description == 'Primary Element' then
        define_aliases()
      end
    end
  elseif command == 'idle' then
    equip(sets.base.idle)
  end
end

function set_for_engaged()
  local capcity_set = PrimaryMode.current..'_Capacity'
  local set = sets.modes[PrimaryMode.current]
  if DamageDown.value then
    set = set_combine(set, sets.DamageDown)
  end
  if TreasureHunter.value then
    set = set_combine(set, sets.TreasureHunter)
  end
  if bow_is_equipped() == false then
    set = set_combine(set, { ammo = "Ginsen" })
  end
  return set
end

function set_for_ws(named)
  local set = sets.WS[PrimaryMode.current]
  if sets.WS[named] then
    set = set_combine(set, sets.WS[named])
  end
  if bow_is_equipped() == false then
    set = set_combine(set, { ammo = "Knobkierrie" })
  end
  return set
end

function bow_is_equipped()
  local val = string.find(player.equipment.ammo, 'Arrow')
  return val ~= nil
end

function equip_set_for_current_mode()
  equip(set_for_engaged())
  maintain_reraise_equip()
end

function maintain_reraise_equip()
  if player.equipment.rear == 'Reraise Earring' then
    equip({rear = 'Reraise Earring'})
  end
  if player.equipment.lear == 'Reraise Earring' then
    equip({lear = 'Reraise Earring'})
  end
end
