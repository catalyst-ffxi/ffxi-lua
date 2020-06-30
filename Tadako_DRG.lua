include('Mote-Mappings.lua')
include('Modes.lua')
include('augments_tadako.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'HybridLight', 'HybridHeavy'}
  send_command("alias g15v2_m2g1 gs c cycle PrimaryMode")
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

  sets.modes = {}
  sets.modes.Normal = {
    main="Trishula",
    sub="Bloodrain Strap",
    ammo="Aurgelmir Orb",
    head="Flam. Zucchetto +2",
    body=augments.valorous.mail.stp,
    hands="Acro Gauntlets",
    legs=augments.valorous.legs.stp,
    feet="Flam. Gambieras +2",
    neck="Anu Torque",
    waist="Sailfi Belt +1",
    left_ear="Dedition Earring",
    right_ear="Sherida Earring",
    left_ring="Petrov Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.tp
  }
  sets.modes.Normal_SAM_ROLL = set_combine(sets.modes.Normal, {
    body=augments.valorous.mail.da,
    hands="Sulev. Gauntlets +2",
    neck="Dgn. Collar +1",
    left_ear="Brutal Earring"
  })
  sets.modes.HybridLight = {
    main="Trishula",
    sub="Bloodrain Strap",
    ammo="Aurgelmir Orb",
    head="Hjarrandi Helm",           -- 10 DT
    body=augments.valorous.mail.da,  -- 2 PDT
    hands="Sulev. Gauntlets +2",     -- 5 DT
    legs=augments.valorous.legs.stp, -- 2 PDT
    feet="Flam. Gambieras +2",
    neck="Dgn. Collar +1",           -- Wyvern 20 DT
    waist="Sailfi Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Moonbeam Ring",       -- 4 DT
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.tp           -- 10 PDT
  }                                  -- 33 PDT
  sets.modes.HybridHeavy = {
    main="Trishula",
    sub="Bloodrain Strap",
    ammo="Aurgelmir Orb",
    head="Hjarrandi Helm",           -- 10 DT
    body="Hjarrandi Breast.",        -- 12 DT
    hands="Sulev. Gauntlets +2",     -- 5 DT
    legs=augments.valorous.legs.stp, -- 2 PDT
    feet="Flam. Gambieras +2",
    neck="Dgn. Collar +1",           -- Wyvern 20 DT
    waist="Sailfi Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Moonbeam Ring",       -- 4 DT
    right_ring="Gelatinous Ring +1", -- 7 PDT
    back=gear.ambuscape.tp           -- 10 PDT
  }                                  -- 50 PDT

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
  sets.JAs.Jump = set_combine(sets.modes.Normal, {
    body="Vishap Mail +2",      -- All Jumps TP Bonus   TODO
    hands="Vis. Fng. Gaunt. +2" -- All Jumps TP Bonus
    -- feet="Ostro Greaves"     TODO
  })
  sets.JAs['High Jump'] = set_combine(sets.JAs.Jump, {
    legs="Vishap Brais +3"      -- High Jump Enmity Reduction+
  })
  sets.JAs['Spirit Jump'] = sets.JAs.Jump
  sets.JAs['Soul Jump'] = sets.JAs.Jump
  sets.JAs['Super Jump'] = {}
  sets.JAs['Steady Wing'] = {
    body="Emicho Haubert",       -- TODO
    hands="Despair Fin. Gaunt.", -- TODO
    feet="Ptero. Greaves +3",    -- TODO
    -- neck="Chanoix's Gorget",     -- TODO
    neck="Dgn. Collar +1",
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
    neck="Dgn. Collar +1",
    -- left_ear="Anastasi Earring", -- TODO
    -- right_ear="Lancer's Earring",-- TODO
    -- left_ring="Dreki Ring",      -- TODO
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
  -- Stardiver → Camlann's Torment = Fragmentation → Drakesbane = Light → Camlann's Torment = Radiance
  --

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.Stardiver = { -- 85% STR, 4-hit, dmg varies w/ TP
    ammo="Knobkierrie",
    head="Ptero. Armet +3",
    body=augments.valorous.mail.da,
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Lustratio Leggings +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Petrov Ring",       -- TODO: Regal or Ifrit+1
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.stardiver
  }
  sets.WS['Penta Thrust'] = set_combine(sets.WS.Stardiver, {
    neck="Dgn. Collar +1",
    waist="Sailfi Belt +1",
    left_ear="Brutal Earring"
  })
  sets.WS["Camlann's Torment"] = { -- 60 STR / 60 VIT, 1 hit (triple dmg), ignore defense varies w/ TP
    ammo="Knobkierrie",
    head=augments.valorous.mask.wsd,
    body="Sulevia's Plate. +2",
    hands="Ptero. Fin. G. +3",
    legs="Vishap Brais +3",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear="Thrud Earring",
    left_ring="Apate Ring",     -- TODO: Regal or Ifrit+1
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.wsd
  }
  sets.WS['Wheeling Thrust'] = sets.WS["Camlann's Torment"] -- 80% STR, 1 hit, ignore defense varies w/ TP
  sets.WS['Sonic Thrust'] = set_combine(sets.WS["Camlann's Torment"], { -- 40 STR / 40 DEX, 1 hit CONAL, damage varies w/ TP
    left_ear="Moonshade Earring"
  })
  sets.WS['Drakesbane'] = { -- 50% STR, 4 hit, crit varies w/ TP
    ammo="Knobkierrie",
    head="Ptero. Armet +3",
    body="Hjarrandi Breast.",
    hands="Flam. Manopolas +2",
    legs="Sulev. Cuisses +2",       -- TODO: Empy legs
    feet=augments.valorous.greaves.crit,
    neck="Dgn. Collar +1",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Thrud Earring",
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
  if buffactive['Samurai Roll'] and sets.modes[PrimaryMode.current..'_SAM_ROLL'] then
    return sets.modes[PrimaryMode.current..'_SAM_ROLL']
  else
    return sets.modes[PrimaryMode.current]
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
    add_to_chat(122, string.format('>>>---(%s)--->>> %s', jump_name, target.name))
    send_command(string.format('@input /ja "%s" <t>', jump_name))
  end
end
