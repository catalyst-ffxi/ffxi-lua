include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'FullDD', 'HybridLight', 'HybridHeavy'}
  TreasureHunter = M(false, 'Treasure Hunter')

  Abyssea = {
    current = 0,
    weapons = {
      { name="Pluto's Staff", ws="Earth Crusher=Earth, Sunburst=Light" },
      { name="Wax Sword", ws="Red Lotus Blade=Fire, Seraph Blade=Light" },
      { name="Ash Club", ws="Seraph Strike=Light" },
      { name="Uchigatana", ws="Tachi Jinpu=Wind, Koki=Light" },
      { name="Bronze Dagger", ws="Cyclone=Wind, Energy Drain=Dark" },
      { name="Kunai", ws="Blade: Ei=Dark" },
      { name="Lost Sickle", ws="Shadow of Death=Dark" },
      { name="Lament", ws="Freezebite=Ice" },
      { name="Tzee Xicu's Blade", ws="Raiden Thrust=Thunder"}
    }
  }
end

function define_binds()
  -- send_command("alias g15v2_m1g3 gs c abbyweapon")
  -- send_command("alias g15v2_m1g4 gs c cycle TreasureHunter")
end

function define_gear()

end

function get_sets()

  define_modes()
  define_binds()

  gear = {
  }

  sets.modes = {}
  sets.modes.FullDD = {
    ammo="Yamarang",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands=augments.herc.hands.triple,
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,
    neck="Iskur Gorget",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back="Yokaze Mantle"
  }
  sets.modes.HybridLight = {
    ammo="Staunch Tathlum +1",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands=augments.herc.hands.triple,
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Defending Ring",
    right_ring="Epona's Ring",
    back="Yokaze Mantle"
  }
  sets.modes.HybridHeavy = {
    ammo="Staunch Tathlum +1",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands=augments.herc.hands.triple,
    -- legs="Mummu Kecks +2", -- dont have
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back="Yokaze Mantle"
  }

  sets.TreasureHunter = {
    legs={ name="Herculean Trousers", augments={'"Conserve MP"+1','"Mag.Atk.Bns."+24','"Treasure Hunter"+1','Accuracy+18 Attack+18',}},
    waist="Chaac Belt"
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.Normal = {
    ammo="Falcon Eye",
    head=augments.herc.head.wsDex,
    body="Meghanada Cuirie +2",
    hands="Meg. Gloves +2",
    legs=augments.herc.legs.wsDex,
    feet=augments.herc.feet.wsDex,
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring +1",
    back="Yokaze Mantle",
  }
  sets.WS['Blade: Ten'] = set_combine(sets.WS.Normal, {
    neck="Caro Necklace",
    waist="Grunfeld Rope"
  })

  -- Job Abilities
  --
  sets.JAs = {}
  sets.Waltz = {
    lring = 'Asklepian Ring'
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.Precast = {
    ammo="Sapience Orb",                -- 2
    head="Herculean Helm",              -- 7
    neck="Orunmila's Torque",           -- 5
    body="Taeon Tabard",                -- 8
    hands="Leyline Gloves",             -- 7
    lear="Loquacious earring",          -- 2
    rear="Etiolation Earring",          -- 1
    lring="Kishar Ring",                -- 4
    rring="Rahab Ring",                -- 2
    legs=augments.taeon.legs.phalanx,   -- 3
  }
  sets.Magic.SpellInterrupt = {
    ammo="Staunch Tathlum +1",       -- 11
    -- head="",
    neck="Loricate Torque +1",       -- PDT
    lear="Genmei Earring",           -- PDT
    rear="Magnetic Earring",         -- 8
    -- body="",
    hands="Rawhide Gloves",          -- 15
    left_ring="Defending Ring",      -- DT
    right_ring="Gelatinous Ring +1", -- PDT
    -- back="",
    waist="Flume Belt +1",            -- PDT
    -- legs="",
    feet=augments.taeon.feet.phalanx -- 9
  }

  -- Ranged Attack
  --
  sets.Ranged = {
  }

  -- Other
  sets.MoveSpeed = {
    legs = "Track Pants +1"
  }
end

function precast(spell)
  if spell.type == 'WeaponSkill' then
    if sets.WS[spell.english] then
      equip(sets.WS[spell.english])
    else
      equip(sets.WS.Normal)
    end
  elseif spell.type == 'JobAbility' then
    if sets.JAs[spell.english] then
      equip(sets.JAs[spell.english])
    end
  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.FastCast)
    if spell.english == 'Utsusemi: Ichi' and (
      buffactive['Copy Image'] or
      buffactive['Copy Image (2)'] or
      buffactive['Copy Image (3)'] or
      buffactive['Copy Image (4+)']) then
        send_command('@wait 1.0; cancel 66; cancel 444; cancel 445; cancel 446')
    end
  elseif spell.english == 'Spectral Jig' then
    cast_delay(0.5)
    send_command('@cancel 71;')
  elseif spell.english == 'Curing Waltz II' or spell.english == 'Curing Waltz III' then
    equip(sets.Waltz)
  elseif spell.english == 'Ranged' then
    equip(sets.Ranged)
  end
end

function midcast(spell)
  if spell.action_type == 'Magic' then
    equip(sets.Magic.SpellInterrupt)
  end
end

function aftercast(spell)
  if player.in_combat then
    equip_set_for_current_mode()
  end
end

function status_change(new, old)
  if new == 'Engaged' then
    equip_set_for_current_mode()
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
    equip(sets.MoveSpeed)
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
end

function cycle_weapon()
  Abyssea.current = Abyssea.current + 1
  local len = tablelength(Abyssea.weapons)

  if Abyssea.current > #Abyssea.weapons then
    add_to_chat(122, '*** DD Weapons Equiped ***')
    equip({ main = "Kanaria", sub = "Ochu" })
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
