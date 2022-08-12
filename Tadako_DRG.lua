include('Mote-Mappings.lua')
include('Modes.lua')
include('augments_tadako.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'FullDD', 'HybridLight', 'HybridHeavy'}
  WeaponMode = M{['description'] = 'Weapon Mode',
    'Trishula',
    'Naegling'
  }
  send_command("bind ^f1 gs c cycle PrimaryMode")
  send_command("bind ^f2 gs c cycle WeaponMode")
end

function get_sets()
  define_modes()

  gear = {
    ambuscape = {
      tp = { name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
      stardiver = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
      wsd = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
      crit = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10',}},
    }
  }

  sets.weapons = {
    Trishula = { main="Trishula", sub="Utu Grip" },
    Naegling = { main="Naegling" }
  }

  sets.modes = {}
  sets.modes.FullDD = {
    -- main="Trishula",
    -- sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Gleti's Cuirass",
    hands="Sulev. Gauntlets +2",
    legs=augments.valorous.legs.stp,
    feet="Flam. Gambieras +2",
    neck="Dgn. Collar +2",
    waist="Sailfi Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Petrov Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.tp
  }
  sets.modes.HybridLight = {
    -- main="Trishula",
    -- sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Hjarrandi Helm",           -- 10 DT
    body="Gleti's Cuirass",          -- 9 PDT
    hands="Sulev. Gauntlets +2",     -- 5 DT
    -- legs="Nyame Flanchard",          -- 8 DT
    legs=augments.valorous.legs.stp,
    feet="Flam. Gambieras +2",
    neck="Dgn. Collar +2",           -- Wyvern 20 DT
    waist="Sailfi Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Petrov Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.tp           -- 10 PDT
  }                                  -- 42 PDT
  sets.modes.HybridHeavy = {
    -- main="Trishula",
    -- sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Hjarrandi Helm",           -- 10 DT
    body="Gleti's Cuirass",          -- 9 PDT
    hands="Sulev. Gauntlets +2",     -- 5 DT
    legs="Nyame Flanchard",          -- 8 DT
    feet="Nyame Sollerets",          -- 7 DT
    neck="Dgn. Collar +2",           -- Wyvern 20 DT
    waist="Sailfi Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Petrov Ring",
    right_ring="Niqmaddu Ring",  
    back=gear.ambuscape.tp           -- 10 PDT
  }                                  -- 49 PDT

  -- Misc
  sets.Idle = {
    legs="Carmine Cuisses +1"
  }

  -- JAs
  --
  sets.JAs = {}
  sets.JAs['Ancient Circle'] = {
    legs="Vishap Brais +3"
  }
  sets.JAs['Spirit Link'] = {
    head='Vishap Armet +2',
    hands="Pel. Vambraces +1", -- TODO
    feet='Ptero. Greaves',
    left_ear="Pratik Earring"  -- TODO
  }
  sets.JAs['Spirit Bond'] = {}
  sets.JAs['Deep Breathing'] = {}
  sets.JAs['Angon'] = {
    ammo="Angon",
    hands="Ptero. Fin. G. +3"
  }
  sets.JAs.Jump = {
    ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Vishap Mail +2",      -- TP Bonus
    hands="Vis. Fng. Gaunt. +2",-- TP Bonus
    legs=augments.valorous.legs.stp,
    feet="Ostro Greaves",       -- TP Bonus
    neck="Dgn. Collar +2",
    waist="Sailfi Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Petrov Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.tp
  }
  sets.JAs['High Jump'] = set_combine(sets.JAs.Jump, {
    legs="Vishap Brais +2"      -- High Jump Enmity Reduction+
  })
  sets.JAs['Spirit Jump'] = sets.JAs.Jump
  sets.JAs['Soul Jump'] = sets.JAs.Jump
  sets.JAs['Super Jump'] = {}
  sets.JAs['Steady Wing'] = {
    body="Emicho Haubert",       -- TODO
    hands="Despair Fin. Gaunt.", -- TODO
    feet="Ptero. Greaves +3",    -- TODO
    -- neck="Chanoix's Gorget",     -- TODO
    neck="Dgn. Collar +2",
    left_ear="Anastasi Earring", -- TODO
    right_ear="Lancer's Earring",-- TODO
    legs="Vishap Brais +3",
    back="Updraft Mantle"        -- TODO
  }

  -- Pet Moves
  sets.Pet = {}
  sets.Pet['Smiting Breath'] = {
    head="Ptero. Armet +3",
    neck="Adad Amulet",
    left_ear="Enmerkar Earring",
    left_ring="C. Palug Ring"   -- TODO
  }
  sets.Pet['Healing Breath IV'] = {
    head="Ptero. Armet +3",
    -- body="Acro Surcoat"          -- TODO (breath augment)
    -- hands="Despair Fin. Gaunt.", -- TODO
    legs="Vishap Brais +3",
    feet="Ptero. Greaves",          -- TODO: +1/2/3 these
    neck="Dgn. Collar +2",
    -- left_ear="Anastasi Earring", -- TODO
    -- right_ear="Lancer's Earring",-- TODO
    left_ring="Dreki Ring",
    -- back="Updraft Mantle"        -- TODO
  }

  -- Magic
  --
  sets.Magic = {}
  sets.Magic.FastCast = {
    hands="Leyline Gloves",
    neck="Orunmila's torque",
    left_ring="Weatherspoon Ring",
    left_ear="Loquacious earring",
    right_ear="Etiolation Earring"
  }
  sets.Magic.SpellInterrupt = {
    -- TODO
  }

  -- Skillchains
  --
  -- Penta Thrust → Stardiver = Transfixion → Sonic Thrust = Distortion → Stardiver = Dark → Stardiver = Umbra
  -- Stardiver → Camlann's Torment = Fragmentation → (Drakesbane|Wheeling) = Light → Camlann's Torment = Radiance
  --

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.Stardiver = { -- 85% STR, 4-hit, dmg varies w/ TP
    ammo="Coiste Bodhar",
    head="Ptero. Armet +3",
    body="Gleti's Cuirass",
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Lustratio Leggings +1",
    neck="Dgn. Collar +2",
    -- neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Shukuyu Ring",       -- TODO: Regal Ring
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.stardiver
  }
  sets.WS['Penta Thrust'] = set_combine(sets.WS.Stardiver, {
    neck="Dgn. Collar +2",
    waist="Sailfi Belt +1",
    left_ear="Brutal Earring"
  })
  sets.WS["Camlann's Torment"] = { -- 60 STR / 60 VIT, 1 hit (triple dmg), ignore defense varies w/ TP
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Ptero. Fin. G. +3",
    legs="Vishap Brais +3",
    feet="Sulev. Leggings +2",
    neck="Dgn. Collar +2",
    waist="Sailfi Belt +1",
    left_ear="Thrud Earring",
    right_ear="Moonshade Earring",
    left_ring="Shukuyu Ring",     -- TODO: Regal Ring
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.wsd
  }
  sets.WS['Savage Blade'] = sets.WS["Camlann's Torment"]
  sets.WS['Wheeling Thrust'] = sets.WS["Camlann's Torment"] -- 80% STR, 1 hit, ignore defense varies w/ TP
  sets.WS['Sonic Thrust'] = set_combine(sets.WS["Camlann's Torment"], { -- 40 STR / 40 DEX, 1 hit CONAL, damage varies w/ TP
    left_ear="Moonshade Earring"
  })
  sets.WS['Drakesbane'] = { -- 50% STR, 4 hit, crit varies w/ TP
    ammo="Coiste Bodhar",
    head="Blistering Sallet +1",
    body="Hjarrandi Breast.",
    hands="Flam. Manopolas +2",
    legs="Sulev. Cuisses +2",       -- TODO: Empy legs
    feet=augments.valorous.greaves.crit,
    neck="Dgn. Collar +2",
    waist="Sailfi Belt +1",
    left_ear="Thrud Earring",
    right_ear="Sherida Earring",
    left_ring="Begrudging Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.crit
  }
end

function precast(spell)
  if spell.type == 'WeaponSkill' then
    equip(sets.WS[spell.english] or sets.WS["Camlann's Torment"])

  elseif sets.JAs[spell.english] then
    equip(sets.JAs[spell.english])

  elseif spell.english == 'Third Eye' and not (buffactive['Seigan']) then
    cast_delay(1.3)
    send_command('@input /ja "Seigan" <me>')

  elseif spell.english == 'Spectral Jig' then
    cast_delay(0.25)
    send_command('@cancel 71;')

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.FastCast)

    if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
      send_command('@wait 0.4; cancel 66; cancel 444; cancel 445')
    end
  end
end

function midcast(spell)
  if spell.action_type == 'Magic' then
    equip(sets.Magic.SpellInterrupt)
  end
end

function aftercast(spell)
  equip(set_for_current_mode())
end

function pet_midcast(spell)
  equip(sets.Pet[spell.name])
end

function pet_aftercast(spell)
  equip(set_for_current_mode())
end

function status_change(new, old)
  equip(set_for_current_mode())
end

function set_for_current_mode()
  if player.status == 'Engaged' then
    return set_for_engaged()
  else
    return set_combine(set_for_engaged(), sets.Idle)
  end
end

function set_for_engaged()
  -- return sets.modes[PrimaryMode.current]
  return set_combine(
    sets.modes[PrimaryMode.current],
    sets.weapons[WeaponMode.current]
  )
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
  elseif command == 'run' then
    equip(sets.Idle)
  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
    end
    equip(set_for_engaged())
  elseif command == 'jump' then
    auto_jump()
  end
end

function auto_jump()
  local jump_name = ''
  local recasts = windower.ffxi.get_ability_recasts()

  local jumps = {
    soul = recasts[167],
    spirit = recasts[166],
    high = recasts[159],
    jump = recasts[158]
  }

  add_to_chat(122, string.format(
    'JUMPS: [Soul: %i] [Spirit: %i] [High: %i] [Jump: %i]',
    jumps.soul, jumps.spirit, jumps.high, jumps.jump
  ))

  if jumps.soul == 0 then
    jump_name = 'Soul Jump'
  elseif jumps.spirit == 0 then
    jump_name = 'Spirit Jump'
  elseif jumps.high == 0 then
    jump_name = 'High Jump'
  elseif jumps.jump == 0 then
    jump_name = 'Jump'
  end

  if jump_name == '' then
    add_to_chat(122, 'Sorry - No jumps available!')
  else
    local target = windower.ffxi.get_mob_by_target('t')
    if target ~= nil then
      add_to_chat(122, string.format('>>>---(%s)--->>> %s', jump_name, target.name))
      send_command(string.format('@input /ja "%s" <t>', jump_name))
    end
  end
end
