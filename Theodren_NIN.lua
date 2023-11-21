include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'FullDD', 'Hybrid', 'TreasureHunter'}

  Weapons = M{
    { main="Heishi Shorinken", sub="Gleti's Knife", text="Full attack!" },
    { main="Pluto's Staff", text="Earth Crusher=Earth, Sunburst=Light" },
    { main="Wax Sword", sub="Kunai", text="Red Lotus Blade=Fire, Seraph Blade=Light" },
    { main="Ash Club", sub="Kunai", text="Seraph Strike=Light" },
    { main="Qutrub Knife", sub="Kunai", text="Cyclone=Wind, Energy Drain=Dark" },
    { main="Uchigatana", text="Tachi Jinpu=Wind, Koki=Light" },
    { main="Kunai", sub="Qutrub Knife", text="Blade: Ei=Dark" },
    { main="Lost Sickle", text="Shadow of Death=Dark" },
    { main="Lament", text="Freezebite=Ice" },
    { main="Tzee Xicu's Blade", text="Raiden Thrust=Thunder"}
  }
end

function define_aliases()
  send_command("bind ^f1 gs c cycle PrimaryMode")
  send_command("bind ^f2 gs c WeaponMode")
end

function define_gear()

end

function get_sets()

  define_modes()
  define_aliases()
  define_ninjutsu()

  sets.Idle = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
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
    head=augments.adhemar.head.pathA,
    body="Mpaca's Doublet",
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
    body="Mpaca's Doublet",
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
    left_ring="Ephramad's Ring",
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
    right_ear="Brutal Earring",
    left_ring="Ephramad's Ring",
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
  left_ear="Telos Earring",
  right_ear="Ishvara Earring",
  left_ring="Ephramad's Ring",
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
    rring="Weatherspoon Ring +1",       -- 2
    legs=augments.taeon.legs.phalanx,   -- 3
  }
  sets.Magic.FastCastUtsusemi = set_combine(sets.Magic.FastCast, {
    neck="Magoraga Beads"
  })
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
  sets.Magic.NinjutsuEnfeeble = {
    -- fill me in
    right_ear="Crep. Earring"
  }
  sets.Magic.NinjutsuMab = {
    -- fill me in
    waist="Orpheus's Sash",
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
    if string.find(spell.english, 'Utsusemi') then
      equip(sets.Magic.FastCastUtsusemi)
    else
      equip(sets.Magic.FastCast)
    end
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
    if NinjutsuEnfeeble:contains(spell.english) then
      equip(sets.Magic.NinjutsuEnfeeble)
    elseif NinjutsuMab:contains(spell.english) then
      equip(sets.Magic.NinjutsuMab)
    else
      equip(sets.Magic.SpellInterrupt)
    end
  end
end

function aftercast(spell)
  equip_set_for_current_mode()
end

function status_change(new, old)
  equip_set_for_current_mode()
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
    equip(set_for_engaged())
  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
      equip(set_for_engaged())
    end
  elseif command == 'idle' then
    equip(sets.Idle)
  elseif command == 'WeaponMode' then
    cycle_weapon()
  end
end

function equip_set_for_current_mode()
  equip(set_for_current_mode())
end

function set_for_engaged()
  return set_combine(
    Weapons.current,
    sets.modes[PrimaryMode.current]
  )
end

function set_for_current_mode()
  if player.status == 'Engaged' then
    return set_for_engaged()
  else
    return sets.Idle
  end
end

function cycle_weapon()
  Weapons:cycle()

  add_to_chat(122, 'Weapon [ ' .. Weapons.current.main .. ' ] = { ' .. Weapons.current.text .. ' }')
  equip(Weapons.current)
end

function define_ninjutsu()
  NinjutsuEnfeeble = S{
    'Kurayami: Ichi', 'Hojo: Ichi', 'Dokumori: Ichi', 'Jubaku: Ichi',
    'Kurayami: Ni', 'Hojo: Ni',
    'Aisha: Ichi', 'Yurin: Ichi'
  }
  NinjutsuMab = S{
    'Katon: Ichi', 'Suiton: Ichi', 'Doton: Ichi', 'Hyoton: Ichi', 'Huton: Ichi', 'Raiton: Ichi',
    'Katon: Ni', 'Suiton: Ni', 'Doton: Ni', 'Hyoton: Ni', 'Huton: Ni', 'Raiton: Ni',
    'Katon: San', 'Suiton: San', 'Doton: San', 'Hyoton: San', 'Huton: San', 'Raiton: San'
  }
end
