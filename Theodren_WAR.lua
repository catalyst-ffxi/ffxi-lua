include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')
include('utils.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode',
    'Normal',
    'HybridLight',
    'HybridHeavy'
  }
  WeaponMode = M{['description'] = 'Weapon Mode',
    'Chango',
    'ShiningOne',
    'Naegling',
    'Loxotic'
  }
  send_command("bind ^f1 gs c cycle PrimaryMode")
  send_command("bind ^f2 gs c cycle WeaponMode")
end

function get_sets()
  define_modes()

  gear = {
    ambuscape = {
      tp = { name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
      wsVit = { name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},
      wsStr = { name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    }
  }

  -- Weapons
  --
  sets.weapons = {
    Chango = { main="Chango", sub="Utu Grip" },
    ShiningOne = { main="Shining One", sub="Utu Grip" },
    Naegling = { main="Naegling", sub="Blurred Shield +1" },
    Loxotic = { main="Loxotic Mace +1", sub="Blurred Shield +1" }
  }

  sets.modes = {}
  sets.modes.Normal = {
    ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Sakpata's Breastplate",
    hands="Sakpata's gauntlets",
    legs="Tatenashi Haidate +1",
    feet="Tatenashi Sune-Ate +1",
    neck="War. Beads +2",
    waist="Sailfi Belt +1",
    left_ear="Schere Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring", 
    right_ring="Petrov Ring",
    back=gear.ambuscape.tp
  }
  sets.modes.HybridLight = {
    ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Sakpata's Breastplate",
    hands="Sakpata's gauntlets",
    legs="Pummeler's Cuisses +3",
    feet="Pummeler's Calligae +3", 
    neck="War. Beads +2",
    waist="Sailfi Belt +1",
    left_ear="Schere Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring", 
    right_ring="Petrov Ring",
    back=gear.ambuscape.tp
  }
  sets.modes.HybridHeavy = {
    ammo="Coiste Bodhar",
    head="Sakpata's Helm",
    body="Sakpata's Breastplate",
    hands="Sakpata's gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings", 
    neck="War. Beads +2",
    waist="Sailfi Belt +1",
    left_ear="Schere Earring",
    right_ear="Dedition Earring",
    left_ring="Niqmaddu Ring", 
    right_ring="Chirich Ring +1",
    back=gear.ambuscape.tp
  }

  -- Misc
  sets.Idle = {
    feet="Hermes' Sandals"
  }
  sets.Doom = {
    neck="Nicander's Necklace",
    left_ring="Purity Ring",
    right_ring="Blenmot's Ring",
    waist="Gishdubar Sash"
  }

  -- JAs
  sets.JAs = {}
  sets.JAs.Aggressor = { head="Pummeler's Mask +1", body="Agoge Lorica +3" }
  sets.JAs.Berserk = { body="Pumm. Lorica +3", feet="Agoge Calligae", back="Cichol's Mantle" }
  -- sets.JAs.Defender = { hands="Agoge Mufflers +1" }
  sets.JAs['Mighty Strikes'] = { hands="Agoge Mufflers +1" }
  sets.JAs.Warcry = { head="Agoge Mask +3" }
  sets.JAs['Blood Rage'] = { body="Boii Lorica +1" }

  -- This is useless - mufflers must be on during TP which just isn't worth doing.
  -- https://www.ffxiah.com/forum/topic/17977/restraint-and-ravager-mufflers-2#1116664
  -- sets.JAs.Restraint = { hands="Boii Mufflers +1" }

  -- Enmity
  sets.JAs.Provoke = {
    ammo="Sapience Orb",           -- 2
    head="Halitus Helm",           -- 8
    left_ear="Trux Earring",       -- 5
    right_ear="Cryptic Earring",   -- 4
    body="Emet Harness +1",        -- 10
    left_ring="Supershear Ring",   -- 5
    right_ring="Eihwaz Ring",      -- 5
    neck="Moonlight Necklace",     -- 15
    waist="Kasiri Belt",           -- 3
  }

  -- Magic
  --
  sets.Magic = {}
  sets.Magic.FastCast = {
    ammo="Sapience Orb",            -- 2
    hands="Leyline Gloves",         -- 7
    neck="Orunmila's Torque",       -- 5
    left_ear="Loquacious earring",  -- 2
    right_ear="Etiolation Earring", -- 1
    left_ring="Weatherspoon Ring +1",-- 2
  }
  sets.Magic.SpellInterrupt = {
    ammo="Staunch Tathlum +1",      -- 11 SID, 3 DT
    body="Hjarrandi Breast.",       -- 12 DT
    hands="Sulev. Gauntlets +2",    -- 5 DT
    legs="Pummeler's Cuisses +3",   -- 4 PDT
    neck="Moonlight Necklace",      -- 15 SID
    waist="Audumbla Sash",          -- 10 SID, 4 PDT
    left_ear="Odnowa Earring +1",   -- 3 DT
    right_ear="Magnetic Earring",   -- 8 SID
    left_ring="Defending Ring",     -- 10 DT
    right_ring="Moonlight Ring",    -- 5 DT
    back=gear.ambuscape.tp          -- 10 PDT
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.Upheaval = { -- 4-Hit : 85% VIT
    ammo="Knobkierrie",
    head="Agoge Mask +3",
    body="Nyame Mail",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Nyame Sollerets",
    neck="War. Beads +2",
    waist="Sailfi Belt +1",
    left_ear="Thrud Earring",
    right_ear="Moonshade Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    -- right_ring="Gelatinous Ring +1",
    back=gear.ambuscape.wsVit -- vit/acc/att/wsd
  }
  sets.WS["King's Justice"] = { -- 3-Hit : 50% STR
    ammo="Knobkierrie",
    head="Agoge Mask +3",
    body="Pumm. Lorica +3",
    hands="Nyame Gauntlets",
    legs="Pummeler's Cuisses +3",
    feet="Sulev. Leggings +2",
    neck="War. Beads +2",
    waist="Sailfi Belt +1",
    left_ear="Thrud Earring",
    right_ear="Moonshade Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back=gear.ambuscape.wsStr
  }
  sets.WS["Ukko's Fury"] = { -- 2-Hit : 80% STR : Crit Rate
    ammo="Yetshila +1",
    head="Agoge Mask +3",
    body="Hjarrandi Breast.",
    hands="Flam. Manopolas +2",
    legs="Pummeler's Cuisses +3",
    feet="Pummeler's Calligae +3",
    neck="War. Beads +2",
    waist="Sailfi Belt +1",
    left_ear="Brutal Earring",
    right_ear="Moonshade Earring",
    left_ring="Begrudging Ring",
    right_ring="Regal Ring",
    back=gear.ambuscape.wsStr
  }
  sets.WS['Raging Rush'] = { -- 3-Hit : 50% STR : Crit Rate
    ammo="Yetshila +1",
    head="Flam. Zucchetto +2",
    body="Hjarrandi Breast.",
    hands="Flam. Manopolas +2",
    legs="Pummeler's Cuisses +3",
    feet="Pummeler's Calligae +3",
    neck="War. Beads +2",
    waist="Sailfi Belt +1",
    left_ear="Brutal Earring",
    right_ear="Moonshade Earring",
    left_ring="Begrudging Ring",
    right_ring="Regal Ring",
    back=gear.ambuscape.wsStr
  }
  sets.WS['Steel Cyclone'] = { -- Single Hit : 60% STR / 60% VIT
    ammo="Knobkierrie",
    head="Agoge Mask +3",
    body="Pumm. Lorica +3",
    hands="Nyame Gauntlets",
    legs=augments.odyssean.legs.wsd,
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Sailfi Belt +1",
    left_ear="Thrud Earring",
    right_ear="Moonshade Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back=gear.ambuscape.wsStr
  }
  sets.WS['Fell Cleave'] = {  -- Single Hit : 60% STR
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="War. Beads +2",
    waist="Sailfi Belt +1",
    left_ear="Thrud Earring",
    right_ear="Moonshade Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back=gear.ambuscape.wsStr
  }
  sets.WS['Full Break'] = {   -- Single Hit : 50% STR / 50% VIT
    ammo="Pemphredo Tathlum", -- Focus on M.Acc+ for additional effect
    head="Flam. Zucchetto +2",
    body="Sakpata's Breastplate",
    hands="Flam. Manopolas +2",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings", 
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Dignitary's Earring",
    right_ear="Moonshade Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back=gear.ambuscape.wsStr
  }
  sets.WS['Armor Break'] = sets.WS['Full Break']
  sets.WS['Weapon Break'] = sets.WS['Full Break']
  sets.WS['Shield Break'] = sets.WS['Full Break']

  -- Non-gaxe weapon skills
  sets.WS['Savage Blade'] = {
    ammo="Knobkierrie",
    head="Agoge Mask +3",
    body="Sakpata's Breastplate",
    hands="Nyame Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Nyame sollerets",
    neck="War. Beads +2",
    waist="Sailfi Belt +1",
    left_ear="Thrud Earring",
    right_ear="Moonshade Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back=gear.ambuscape.wsStr
  }
  sets.WS.Judgment = sets.WS['Savage Blade']
  sets.WS['Impulse Drive'] = sets.WS['Savage Blade']

  -- sets.WS['Impulse Drive'] = {
  --   ammo="Yetshila +1",
  --   head="Agoge Mask +3",
  --   body="Hjarrandi Breast.",
  --   hands="Nyame Gauntlets",
  --   legs="Sakpata's Cuisses",
  --   feet="Sulev. Leggings +2",
  --   neck="War. Beads +2",
  --   waist="Sailfi Belt +1",
  --   left_ear="Thrud Earring",
  --   right_ear="Moonshade Earring",
  --   left_ring="Niqmaddu Ring",
  --   right_ring="Epaminondas's Ring",
  --   back=gear.ambuscape.wsStr
  -- }

  sets.WS['Flash Nova'] = {
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    -- neck="Sanctity Necklace",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear="Thrud Earring",
    right_ear="Friomisi Earring",
    left_ring="Weatherspoon Ring +1",
    right_ring="Epaminondas's Ring",
    back=gear.ambuscape.wsStr
  }
end

function precast(spell)
  if spell.type == 'WeaponSkill' then
    send_command('input /echo Weapon Skill TP: <tp>')
    equip(set_for_ws(spell.english))

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
  equip(set_for_engaged())

  if spell.type == 'WeaponSkill' then
    send_command('wait 0.2; input /echo TP Return: <tp>')
  end

  if player.status == 'Idle' then
    equip(sets.Idle)
  end
end

function status_change(new, old)
  equip(set_for_engaged())
  if player.status == 'Idle' then
    equip(sets.Idle)
  end
end

function set_for_ws(named)
  if buffactive['Mighty Strikes'] then
    return set_combine(sets.WS[named], {
      ammo="Yetshila +1"
    })
  else
    return sets.WS[named]
  end
  -- if named == 'Upheaval' and buffactive['Mighty Strikes'] then
  --   return sets.WS.Upheaval_MS
  -- elseif sets.WS[named] then
  --   return sets.WS[named]
  -- else
  --   return sets.WS.Upheaval
  -- end
end

function set_for_engaged()
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
  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
    end
    equip(set_for_engaged())
  elseif command == 'run' then
    equip(sets.Idle)
  end
end
