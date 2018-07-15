include('Mote-Mappings.lua')
include('Modes.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'Accuracy', 'Capacity'}
  Capacity = M(false, 'Capacity Mantle')
  TreasureHunter = M(true, 'Treasure Hunter')

  Abyssea = {
    current = 0,
    weapons = {
      { name="Pluto's Staff", ws="Earth Crusher=Earth, Sunburst=Light" },
      { name="Wax Sword", ws="Red Lotus Blade=Fire, Seraph Blade=Light" },
      { name="Ash Club", ws="Seraph Strike=Light" },
      { name="Uchigatana", ws="Tachi Jinpu=Wind, Koki=Light" },
      { name="Bronze Dagger", ws="Cyclone=Wind, Energy Drain=Dark" },
      { name="Kunai", ws="Blade: Ei=Dark" },
      { name="Hoe", ws="Shadow of Death=Dark" },
      { name="Tzee Xicu's Blade", ws="Raiden Thrust=Thunder"}
    }
  }
end

function define_binds()
  send_command("alias g15v2_m1g3 gs c abbyweapon")
  send_command("alias g15v2_m1g4 gs c cycle TreasureHunter")
end

function define_gear()

end

function get_sets()

  define_modes()
  define_binds()

  gear = {
  }

  sets.modes = {}
  sets.modes.Normal = {
    ammo="Ginsen",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Herculean Gloves", augments={'"Triple Atk."+2','Accuracy+13','Attack+7',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','Weapon skill damage +3%','DEX+7',}},
    feet={ name="Herculean Boots", augments={'Accuracy+9','"Triple Atk."+2','STR+5','Attack+12',}},
    neck="Moonbeam Nodowa",
    waist="Windbuffet Belt +1",
    left_ear="Digni. Earring",
    right_ear="Brutal Earring",
    left_ring="Ilabrat Ring",
    right_ring="Epona's Ring",
    back="Yokaze Mantle",
  }
  sets.modes.Accuracy = {

  }
  sets.modes.Capacity = {
  }

  sets.TreasureHunter = {
    legs={ name="Herculean Trousers", augments={'"Conserve MP"+1','"Mag.Atk.Bns."+24','"Treasure Hunter"+1','Accuracy+18 Attack+18',}},
    waist="Chaac Belt"
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.Normal = {
    ammo="Ginsen",
    head={ name="Herculean Helm", augments={'Rng.Atk.+18','Weapon skill damage +4%','MND+10','Rng.Acc.+13',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Herculean Gloves", augments={'"Triple Atk."+2','Accuracy+13','Attack+7',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','Weapon skill damage +3%','DEX+7',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+18','Weapon skill damage +2%','INT+4','"Mag.Atk.Bns."+10',}},
    neck="Fotia Gorget",
    waist="Grunfeld Rope",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    left_ring="Ilabrat Ring",
    right_ring="Karieyh Ring +1",
    back="Yokaze Mantle",
  }
  sets.WS.Accuracy = {

  }
  sets.WS.Capacity = {
  }
  -- sets.WS['Blade: Ten'] = {
  --   neck = "Shadow Gorget"
  -- }

  -- Job Abilities
  --
  sets.JAs = {}
  sets.utsusemi = {
    ammo = "Impatiens",
    lear = "Loquacious earring",
    rring = "Prolix Ring",
  }
  sets.waltz = {
    lring = 'Asklepian Ring'
  }

  -- Ranged Attack
  --
  sets.JAs.ranged = {
  }

  -- Other
  sets.move_speed = {
    legs = "Track Pants +1"
  }
end

function precast(spell)
  if spell.type == 'WeaponSkill' then
    equip(sets.WS[get_primary_mode()])
    if sets.WS[spell.english] then
      equip(sets.WS[spell.english])
    end
  elseif spell.type == 'JobAbility' then
    if sets.JAs[spell.english] then
      equip(sets.JAs[spell.english])
    end
  elseif spell.english == 'Utsusemi: Ichi' or spell.english == 'Utsusemi: Ni' then
    equip(sets.utsusemi)
    if spell.english == 'Utsusemi: Ichi' and (
      buffactive['Copy Image'] or
      buffactive['Copy Image (2)'] or
      buffactive['Copy Image (3)'] or
      buffactive['Copy Image (4+)']) then
        send_command('@wait 3.3; cancel 66; cancel 444; cancel 445; cancel 446')
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
  if player.in_combat then
    equip_set_for_current_mode()
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
      if mode.description == 'Primary Mode' then
        equip_set_for_current_mode()
      elseif mode.description == 'Primary Element' then
        define_aliases()
      end
    end
  elseif command == 'idle' then
    equip(sets.base.idle)
  elseif command == 'run' then
    -- equip_set_for_current_mode()
    equip(sets.move_speed)
  elseif command == 'abbyweapon' then
    cycle_weapon()
  end
end

function set_for_engaged()
  local set = sets.modes[get_primary_mode()]
  if TreasureHunter.value then
    set = set_combine(set, sets.TreasureHunter)
  end
  return set
end

function get_primary_mode()
	return PrimaryMode.current
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

function cycle_weapon()
  Abyssea.current = Abyssea.current + 1
  local len = tablelength(Abyssea.weapons)

  -- if Abyssea.current > tablelength(Abyssea.weapons) then
  if Abyssea.current > #Abyssea.weapons then
    add_to_chat(122, '*** DD Weapons Equiped ***')
    equip({ main = "Kanaria", sub = "Raicho" })
    Abyssea.current = 0
  else
    local set = Abyssea.weapons[Abyssea.current]
    add_to_chat(122, 'Switching to ' .. set.name ..'. Use weapon skills: ' .. set.ws)
    equip({ main = set.name, sub = '-' })
  end
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
