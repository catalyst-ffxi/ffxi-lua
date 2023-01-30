include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'FullDD', 'Hybrid', 'TreasureHunter'}

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

function define_aliases()
  send_command("bind ^f1 gs c cycle PrimaryMode")
  send_command("bind ^f3 gs c abbyweapon")
end

function define_gear()

end

function get_sets()

  define_modes()
  define_aliases()

  sets.Idle = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Track Pants +1",
    -- feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Purity Ring",
    back="Andartia's Mantle"
  }

  sets.modes = {}
  sets.modes.FullDD = {
    ammo="Coiste Bodhar",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands="Adhemar Wristbands +1",
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,
    neck="Iskur Gorget",
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Gere Ring",
    back="Andartia's Mantle"
  }
  sets.modes.Hybrid = {
    ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Sailfi Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Defending Ring",
    right_ring="Gere Ring",
    back="Andartia's Mantle"
  }
  sets.modes.TreasureHunter = {
    ammo="Per. Lucky Egg",
    head="Malignance Chapeau",
    body="Adhemar Jacket +1",
    hands="Adhemar Wristbands +1",
    legs="Malignance Tights",
    feet=augments.herc.feet.th2,
    neck="Iskur Gorget",
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Gere Ring",
    back="Andartia's Mantle"
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS['Blade: Ten'] = { -- 30 DEX / 30 STR, 1 hit, dmg varies w/ TP
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Epaminondas's Ring",
    back="Andartia's Mantle"
  }
  sets.WS['Blade: Shun'] = { -- 85 DEX, 5 hit, attack varies w/ TP
    ammo="Coiste Bodhar",
    head="Mpaca's Cap",
    body="Mpaca's Doublet",
    hands="Adhemar Wristbands +1",
    legs="Mpaca's Hose",
    feet=augments.herc.feet.triple,
    neck="Fortia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Hattori Earring +1",
    left_ring="Regal Ring",
    right_ring="Gere Ring",
    back="Andartia's Mantle"
  }
  sets.WS['Blade: Chi'] = {
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Gere Ring",
    back="Andartia's Mantle"
  }
  sets.WS['Blade: Kamu'] = { -- 60% STR / 60% INT, Lowers eva, attack bonus
  ammo="Coiste Bodhar",
  head="Nyame Helm",
  body="Nyame Mail",
  hands="Nyame Gauntlets",
  legs="Nyame Flanchard",
  feet="Nyame Sollerets",
  neck="Fotia Gorget",
  waist="Sailfi Belt +1",
  left_ear="Hattori Earring +1",
  right_ear="Ishvara Earring",
  left_ring="Regal Ring",
  right_ring="Gear Ring",
  back="Andartia's Mantle"
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
    lear="Odnowa Earring +1",           -- PDT
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

  sets.Enmity = {
    ammo="Sapience Orb",
    -- head=
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Zoar Subligar +1",
    -- feet=
    neck="Unmoving Collar",
    waist={ name="Kasiri Belt", priority=4 },
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Eihwaz Ring",
    right_ring="Supershear Ring"
    -- back=
  }
end

function precast(spell)
  if spell.type == 'WeaponSkill' then
    equip(sets.WS[spell.english])
  elseif spell.type == 'JobAbility' then
    equip(sets.Enmity)
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
    equip(sets.Idle)
  elseif command == 'abbyweapon' then
    cycle_weapon()
  end
end

function set_for_engaged()
  local set = sets.modes[PrimaryMode.current]

  set = set_combine(set,
)

  return set
end

function equip_set_for_current_mode()
  equip(set_for_engaged())
end

function cycle_weapon()
  Abyssea.current = Abyssea.current + 1

  if Abyssea.current > #Abyssea.weapons then
    add_to_chat(122, '*** DD Weapons Equiped ***')
    equip({ main = "Heishi Shorinken", sub = "Gleti's Knife" })
    Abyssea.current = 0
  else
    local set = Abyssea.weapons[Abyssea.current]
    add_to_chat(122, 'Switching to ' .. set.name ..'. Use weapon skills: ' .. set.ws)
    equip({ main = set.name })
  end
end

function current_weapon()
  
end