include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'Accuracy'}
  TreasureHunter = M(true, 'Treasure Hunter')
  Capacity = M(false, 'Capacity Mantle')
  DamageDown = M(false, 'Damage Down')
end

function define_binds()
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  send_command("alias g15v2_m1g2 gs c cycle Capacity")
  send_command("alias g15v2_m1g3 gs c cycle DamageDown")
  send_command("alias g15v2_m1g4 gs c cycle TreasureHunter")
end

function define_gear()

end

function get_sets()

  define_modes()
  define_binds()

  gear = {
  }

  sets.idle = {
  }
  sets.modes = {}
  sets.modes.Normal = {
    ammo="Ginsen",
    head="Adhemar Bonnet",
    neck="Lissome Necklace",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    body="Adhemar Jacket +1",
    hands="Herculean Gloves",
    left_ring="Ilabrat Ring",
    right_ring="Epona's Ring",
    back={ name="Canny Cape", augments={'DEX+2','AGI+1','"Dual Wield"+4','Crit. hit damage +2%',}},
    waist="Windbuffet Belt +1",
    legs="Meg. Chausses +2",
    feet=augments.herc.feet.triple
  }
  sets.modes.TreasureHunter = set_combine(sets.modes.Normal, {
    hands="Plunderer's Armlets +1",
    waist="Chaac Belt",
    legs = { name="Herculean Trousers", augments={'"Conserve MP"+1','"Mag.Atk.Bns."+24','"Treasure Hunter"+1','Accuracy+18 Attack+18',}}
  })
  sets.run = {
    feet = "Fajin boots"
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.Normal = {
    ammo="Falcon Eye",
    head={ name="Herculean Helm", augments={'Rng.Atk.+18','Weapon skill damage +4%','MND+10','Rng.Acc.+13',}},
    body="Meg. Cuirie +1",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Karieyh Ring +1",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
  }
  sets.WS['Exenterator'] = {
  }
  sets.WS['Evisceration'] = {
  }
  sets.WS['Aeolian Edge'] =  {
    ammo="Ombre Tathlum +1",
    head=augments.herc.head.magic,
    neck = "Sanctity Necklace",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    body="Samnuha Coat",
    hands="Leyline Gloves",
    left_ring="Acumen Ring",
    right_ring = "Dingir Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
    waist="Fotia Belt",
    legs= { name="Herculean Trousers", augments={'"Mag.Atk.Bns."+25','Pet: Mag. Acc.+14','Accuracy+12 Attack+12','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    feet= {name="Herculean Boots", augments={'Mag. Acc.+18','Weapon skill damage +2%','INT+4','"Mag.Atk.Bns."+10',}}
  }
  sets.WS['Circle Blade'] = {
    ammo="Falcon Eye",
    head={ name="Herculean Helm", augments={'Rng.Atk.+18','Weapon skill damage +4%','MND+10','Rng.Acc.+13',}},
    body="Herculean Vest",
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','Weapon skill damage +3%','DEX+7',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+18','Weapon skill damage +2%','INT+4','"Mag.Atk.Bns."+10',}},
    neck="Fotia Gorget",
    waist="Caudata Belt",
    left_ear="Ishvara Earring",
    right_ear="Moonshade Earring",
    left_ring="Ilabrat Ring",
    right_ring="Karieyh Ring +1",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
  }

  -- Job Abilities
  --
  sets.JAs = {}
  sets.JAs.Waltz = {
    lring = 'Asklepian Ring'
  }
  sets.TreasureHunter = {
    hands="Plunderer's Armlets +1",
    waist="Chaac Belt",
    legs={ name="Herculean Trousers", augments={'"Conserve MP"+1','"Mag.Atk.Bns."+24','"Treasure Hunter"+1','Accuracy+18 Attack+18',}},
  }
  sets.DamageDown = {
    neck = "Loricate Torque +1",
    lring = "Gelatinous Ring +1",
    rring = "Defending Ring",
    waist = "Flume Belt +1",
  }

  -- Ranged Attack
  --
  sets.JAs.Ranged = {
  }

  -- Magic
  sets.MA = {}
  sets.MA.FastCast = {
    ammo = "Impatiens",
    neck = "Loricate torque",
    hands = "Leyline Gloves",
    lear = "Loquacious earring",
    rear = "Magnetic earring",
    lring = "Kishar Ring",
    rring = "Prolix Ring"
  }
end

function precast(spell)
  if spell.type == 'WeaponSkill' then
    equip(set_for_ws(spell.english))
  elseif spell.type == 'JobAbility' then
    if sets.JAs[spell.english] then
      equip(sets.JAs[spell.english])
    end
  elseif spell.action_type == 'Magic' then
    equip(sets.MA.FastCast)
    if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
      send_command('@wait 3.0; cancel 66; cancel 444; cancel 445')
    end
  elseif spell.english == 'Spectral Jig' then
    cast_delay(0.5)
    send_command('@cancel 71;')
  elseif spell.english == 'Curing Waltz II' or spell.english == 'Curing Waltz III' then
    equip(sets.JAs.Waltz)
  elseif spell.english == 'Ranged' then
    equip(sets.JAs.Ranged)
  end

  maintain_reraise_equip()
end

function midcast(spell)

end

function aftercast(spell)
  if player.in_combat then
    equip_set_for_current_mode()
  end
  maintain_reraise_equip()
end

function status_change(new, old)
  if new == 'Engaged' then
    equip_set_for_current_mode()
    maintain_reraise_equip()
  elseif new == 'Idle' then
    equip(sets.run)
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
    end
  elseif command == 'idle' then
    equip(sets.idle)
  elseif command == 'run' then
    equip(sets.run)
  end
end

function set_for_engaged()
  local set = sets.modes[PrimaryMode.current]
  if DamageDown.value then
    set = set_combine(set, sets.DamageDown)
  end
  if TreasureHunter.value then
    set = set_combine(set, sets.TreasureHunter)
  end
  if Capacity.value then
    set = set_combine(set, {back = "Mecistopins Mantle"})
  end
  return set
end

function set_for_ws(named)
  local set =  sets.WS.Normal
  if sets.WS[named] then
    set = set_combine(set, sets.WS[named])
  end
  return set
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
