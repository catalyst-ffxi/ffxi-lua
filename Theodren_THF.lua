include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'FullTH', 'HybridTH', 'FullDD', 'HybridDD'}

  Abyssea = {
    current = 0,
    weapons = {
      { name="Pluto's Staff", ws="Earth Crusher=Earth, Sunburst=Light" },
      { name="Wax Sword", ws="Red Lotus Blade=Fire, Seraph Blade=Light" },
      { name="Ash Club", ws="Seraph Strike=Light" },
      -- { name="Uchigatana", ws="Tachi Jinpu=Wind, Koki=Light" },
      { name="Bronze Dagger", ws="Cyclone=Wind, Energy Drain=Dark" },
      -- { name="Kunai", ws="Blade: Ei=Dark" },
      { name="Lost Sickle", ws="Shadow of Death=Dark" },
      { name="Lament", ws="Freezebite=Ice" },
      { name="Tzee Xicu's Blade", ws="Raiden Thrust=Thunder"}
    }
  }
end

function define_aliases()
  send_command("bind ^f1 gs c cycle PrimaryMode")
  send_command("bind ^f5 gs c abbyweapon")
end

function define_gear()

end

function get_sets()

  define_modes()
  define_aliases()

  gear = {
    toutatis = {
      tp={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},
      ws={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
    }
  }

  sets.Idle = {
    ranged="Exalted Crossbow +1",
    ammo="Gashing Bolt",
    head="Malignance Chapeau",        -- 6 DT
    body="Gleti's Cuirass",           -- 9 PDT
    hands="Gleti's Gauntlets",        -- 7 PDT
    legs="Malignance Tights",         -- 7 DT
    feet="Fajin boots",
    neck="Loricate Torque +1",        -- 6 DT
    waist="Reiki Yotai",
    left_ear="Suppanomimi",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Defending Ring",      -- 10 DT
    back=gear.toutatis.tp,            -- 10 PDT
  }
  sets.modes = {}
  sets.modes.FullDD = {
    ammo="Coiste Bodhar",
    head=augments.adhemar.head.pathA,
    body="Adhemar Jacket +1",
    hands="Adhemar Wristbands +1",
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,
    neck="Iskur Gorget",
    waist="Windbuffet Belt +1",
    left_ear="Sherida Earring",
    right_ear="Skulk. Earring +2",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back=gear.toutatis.tp,
  }
  sets.modes.HybridDD = {
    ammo="Coiste Bodhar",
    head=augments.adhemar.head.pathA,
    body="Gleti's Cuirass",           -- 9 PDT
    hands="Gleti's Gauntlets",        -- 7 PDT
    legs="Gleti's Breeches",          -- 8 PDT
    feet=augments.herc.feet.triple,   -- 2 PDT
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Skulk. Earring +2",
    left_ring="Gere Ring",
    right_ring="Moonlight Ring",      -- 5 DT
    back=gear.toutatis.tp,            -- 10 PDT
  }                                   -- 40 PDT
  sets.modes.FullTH = {
    ammo="Coiste Bodhar",
    head=augments.adhemar.head.pathA,
    body="Adhemar Jacket +1",
    hands="Plunderer's Armlets +1",
    legs="Samnuha Tights",
    feet=augments.herc.feet.th2,
    neck="Iskur Gorget",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back=gear.toutatis.tp,
  }
  sets.modes.HybridTH = {
    ammo="Coiste Bodhar",
    head="Malignance Chapeau",        -- 6 DT
    body="Gleti's Cuirass",           -- 9 PDT
    hands="Plunderer's Armlets +1",
    legs="Gleti's Breeches",          -- 8 PDT
    feet=augments.herc.feet.th2,      -- 2 PDT
    neck="Loricate Torque +1",        -- 6 DT
    waist="Windbuffet Belt +1",
    left_ear="Suppanomimi",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Defending Ring",      -- 10 DT
    back=gear.toutatis.tp,            -- 10 PDT
  }                                   -- 50 PDT

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.Rudra = {
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Regal Ring",
    right_ring="Ephramad's Ring",
    back=gear.toutatis.ws
  }
  sets.WS['Evisceration'] = {
    ammo="Yetshila +1",
    head=augments.adhemar.head.pathB,
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Adhe. Gamashes +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Regal Ring",
    right_ring="Ephramad's Ring",
    back=gear.toutatis.ws
  }
  sets.WS['Aeolian Edge'] =  {
    -- ammo="Ombre Tathlum +1",
    head="Nyame Helm",
    neck="Sanctity Necklace",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    body="Samnuha Coat",
    hands="Leyline Gloves",
    left_ring="Dingir Ring",
    right_ring="Shiva Ring +1",
    back=gear.toutatis.ws,
    waist="Eschan Stone",
    legs="Nyame Flanchard",
    feet= "Nyame Sollerets"
  }
  sets.WS['Savage Blade'] = {
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
    left_ring="Gere Ring",
    right_ring="Regal Ring",
    back=gear.toutatis.ws
  }

  -- Job Abilities
  --
  sets.JAs = {}
  sets.JAs.Waltz = {
    lring = 'Asklepian Ring'
  }
  sets.run = {
    feet = "Fajin boots"
  }

  -- Magic
  sets.MA = {}
  sets.MA.FastCast = {
    -- ammo="Impatiens",
    head=augments.herc.head.fc,            -- 12
    neck="Orunmila's Torque",           -- 5
    body="Taeon Tabard",                -- 8
    hands="Leyline Gloves",             -- 7
    lear="Loquacious earring",          -- 2
    rear="Etiolation Earring",          -- 1
    lring="Kishar Ring",                -- 4
    rring="Weatherspoon Ring +1",                -- 2
    legs=augments.taeon.legs.phalanx,   -- 3
  }
  sets.MA.SpellInterrupt = {
    -- ammo="Staunch Tathlum +1",          -- 10
    head=augments.taeon.head.SID,    -- 7
    neck="Loricate Torque +1",
    -- lear="Halasz Earring",           -- 5
    rear="Magnetic earring",         -- 8
    hands="Rawhide Gloves",          -- 15
    left_ring="Defending Ring",      -- PDT
    right_ring="Warden's Ring",      -- PDT
    waist="Flume Belt +1",
    feet=augments.taeon.feet.phalanx -- 9
  }
  sets.Preshot = {                           -- Snap | Rapid
    head=augments.taeon.head.snapshot,       --  10    0
    legs="Adhemar Kecks",                    --   9    10
    feet="Meg. Jam. +2",                     --  10    0
    waist="Yemaya Belt",                     --   0    5
  }
  sets.Ranged = {
    ranged="Exalted Crossbow +1",
    ammo="Gashing Bolt",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Regal Ring",
    right_ring="Crepuscular Ring",
    back=gear.toutatis.tp
  }
end

function precast(spell)
  if spell.type == 'WeaponSkill' then
    equip(sets.WS[spell.english])
  elseif spell.type == 'JobAbility' then
    if sets.JAs[spell.english] then
      equip(sets.JAs[spell.english])
    end
  elseif spell.action_type == 'Magic' then
    equip(sets.MA.FastCast)
    if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
      send_command('@wait 3.0; cancel 66; cancel 444; cancel 445')
    end
  elseif spell.english == "Ranged" then
    equip(sets.Preshot)
  elseif spell.english == 'Spectral Jig' then
    cast_delay(0.5)
    send_command('@cancel 71;')
  elseif spell.english == 'Curing Waltz II' or spell.english == 'Curing Waltz III' then
    equip(sets.JAs.Waltz)
  end
end

function midcast(spell)
  if spell.action_type == 'Magic' then
    equip(sets.MA.SpellInterrupt)
  elseif spell.english == 'Ranged' then
    equip(sets.Ranged)
  end
end

function aftercast(spell)
  equip_set_for_current_mode()

  if player.status == 'Idle' then
    equip(sets.run)
  end
end

function status_change(new, old)
  if new == 'Engaged' then
    equip_set_for_current_mode()
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
    equip(sets.Idle)
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
  local len = tablelength(Abyssea.weapons)

  -- if Abyssea.current > tablelength(Abyssea.weapons) then
  if Abyssea.current > #Abyssea.weapons then
    add_to_chat(122, '*** DD Weapons Equiped ***')
    equip({ main = "Tauret", sub = "Gleti's Knife" })
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
