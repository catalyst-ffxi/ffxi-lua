include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'FullDD', 'Hybrid', 'CritRate'}

  Abyssea = {
    current = 0,
    weapons = {
      { name="Pluto's Staff", ws="Earth Crusher=Earth, Sunburst=Light" },
      { name="Wax Sword", ws="Red Lotus Blade=Fire, Seraph Blade=Light" },
      { name="Ash Club", ws="Seraph Strike=Light" },
      { name="Uchigatana", ws="Tachi Jinpu=Wind, Koki=Light" },
      { name="Qutrub Knife", ws="Cyclone=Wind, Energy Drain=Dark" },
      { name="Kunai", ws="Blade: Ei=Dark" },
      { name="Lost Sickle", ws="Shadow of Death=Dark" },
      { name="Lament", ws="Freezebite=Ice" },
      { name="Tzee Xicu's Blade", ws="Raiden Thrust=Thunder"}
    }
  }
end

function define_binds()
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  send_command("alias g15v2_m1g3 gs c abbyweapon")
end

function define_gear()

end

function get_sets()

  define_modes()
  define_binds()

  gear = {
  }

  sets.weapons = {
    main="Heishi Shorinken",
    sub="ochu"
  }

  sets.modes = {}
  sets.modes.FullDD = {
    -- main="Heishi Shorinken",
    -- sub="Ochu",
    ammo="Aurgelmir Orb +1",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands=augments.herc.hands.triple,
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Gere Ring",
    back="Andartia's Mantle"
  }
  sets.modes.Hybrid = {
    -- main="Heishi Shorinken",
    -- sub="Ochu",
    ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands=augments.herc.hands.triple,
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Defending Ring",
    right_ring="Gere Ring",
    back="Andartia's Mantle"
  }
  sets.modes.CritRate = {
    -- main="Heishi Shorinken",
    -- sub="Ochu",
    ammo="Aurgelmir Orb +1",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands="Mummu Wrists +2",
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Gere Ring",
    back="Andartia's Mantle"
  }

  sets.TreasureHunter = {
    legs={ name="Herculean Trousers", augments={'"Conserve MP"+1','"Mag.Atk.Bns."+24','"Treasure Hunter"+1','Accuracy+18 Attack+18',}},
    waist="Chaac Belt"
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS['Blade: Ten'] = { -- 30 DEX / 30 STR, 1 hit, dmg varies w/ TP
    ammo="Aurgelmir Orb +1",
    head=augments.herc.head.wsDex,
    body="Adhemar Jacket +1",
    hands=augments.herc.hands.triple,
    legs=augments.herc.legs.wsDex,
    feet=augments.herc.feet.wsDex,
    neck="Caro Necklace",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Epaminondas's Ring",
    back="Andartia's Mantle",
  }
  sets.WS['Blade: Shun'] = { -- 85 DEX, 5 hit, attack varies w/ TP
    ammo="Aurgelmir Orb +1",
    head="Adhemar Bonnet +1",
    -- body="Ken. Samue +1",
    body="Adhemar Jacket +1",
    hands=augments.herc.hands.triple,
    -- legs="Ken. Hakama +1",
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,
    neck="Caro Necklace",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Brutal Earring",
    left_ring="Regal Ring",
    right_ring="Gere Ring",
    back="Andartia's Mantle",
  }

  -- Job Abilities
  --
  sets.JAs = {}

  -- Magic
  sets.Magic = {}
  sets.Magic.FastCast = {
    ammo="Sapience Orb",                -- 2
    head="Herculean Helm",              -- 7
    neck="Orunmila's Torque",           -- 5
    body="Taeon Tabard",                -- 8
    hands="Leyline Gloves",             -- 7
    lear="Loquacious earring",          -- 2
    rear="Etiolation Earring",          -- 1
    lring="Kishar Ring",                -- 4
    rring="Weatherspoon Ring +1",                -- 2
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
    equip(sets.WS[spell.english] or sets.WS['Blade: Ten'])
  elseif spell.type == 'JobAbility' then
    equip(sets.JAs[spell.english])
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
  equip_set_for_current_mode()
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
  local set = sets.modes[PrimaryMode.current]

  return set
end

function equip_set_for_current_mode()
  equip(set_for_engaged())
end

function cycle_weapon()
  Abyssea.current = Abyssea.current + 1

  if Abyssea.current > #Abyssea.weapons then
    add_to_chat(122, '*** DD Weapons Equiped ***')
    equip({ main = "Heishi Shorinken", sub = "Ochu" })
    Abyssea.current = 0
  else
    local set = Abyssea.weapons[Abyssea.current]
    add_to_chat(122, 'Switching to ' .. set.name ..'. Use weapon skills: ' .. set.ws)
    equip({ main = set.name })
  end
end
