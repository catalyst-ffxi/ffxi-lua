include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')
include('utils.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'HybridLight', 'HybridHeavy'}
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
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

  sets.modes = {}
  sets.modes.Normal = {
    main="Chango",
    sub="Utu Grip",
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",     --         4 haste
    body="Agoge Lorica +3",        --         4 haste
    hands="Sulev. Gauntlets +2",   -- 5 DT    3 haste
    legs="Pummeler's Cuisses +3",  -- 5 PDT   6 haste
    feet="Pummeler's Calligae +3", --         4 haste
    neck="War. Beads +2",
    waist="Ioskeha Belt +1",       --         8 haste
    left_ear="Brutal Earring",
    right_ear="Cessance Earring",
    left_ring="Moonlight Ring",    -- 5 DT
    right_ring="Moonlight Ring",   -- 5 DT
    back=gear.ambuscape.tp         -- DEX/Acc/Att/Dbl/PDT
  }                                -- 30 PDT, 100% DA, 52 STP, 29 Haste
  sets.modes.HybridLight = set_combine(sets.modes.Normal, {
    head="Hjarrandi Helm",         -- 10 DT
    left_ear="Dedition Earring"
  })                               -- 40 PDT, 101% DA, 61 STP, 25 haste
  sets.modes.HybridHeavy = set_combine(sets.modes.Normal, {
    ammo="Seething Bomblet +1",
    head="Hjarrandi Helm",         -- 10 DT
    body="Hjarrandi Breast.",      -- 12 DT
  })                               -- 52 PDT, 99% DA, 64 STP, 26 Haste

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
    left_ring="Weatherspoon Ring +1",         -- 2
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
    body="Pumm. Lorica +3",
    hands=augments.odyssean.hands.wsd, -- vit/acc/att/wsd
    legs=augments.odyssean.legs.wsd,   -- vit/acc/att/wsd
    feet="Sulev. Leggings +2",
    neck="War. Beads +2",
    waist="Ioskeha Belt +1",
    left_ear="Thrud Earring",
    right_ear="Moonshade Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Gelatinous Ring +1",
    back=gear.ambuscape.wsVit
  }
  sets.WS.Upheaval_MS = {
    ammo="Yetshila +1",
    head="Agoge Mask +3",
    body="Pumm. Lorica +3",
    hands=augments.odyssean.hands.wsd,   -- TODO: Crit augments
    legs=augments.valorous.hose.crit,    -- vit/acc/att/critdmg
    feet=augments.valorous.greaves.crit, -- vit/acc/att/critdmg
    neck="War. Beads +2",
    waist="Ioskeha Belt +1",
    left_ear="Brutal Earring",
    right_ear="Moonshade Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Gelatinous Ring +1",
    back=gear.ambuscape.wsVit
  }
  sets.WS["King's Justice"] = { -- 3-Hit : 50% STR
    ammo="Knobkierrie",
    head="Agoge Mask +3",
    body="Pumm. Lorica +3",
    hands=augments.valorous.mitts.ws,
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
    hands=augments.valorous.mitts.ws,
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
    head="Agoge Mask +3",
    body="Pumm. Lorica +3",
    hands=augments.valorous.mitts.ws,
    legs=augments.odyssean.legs.wsd,
    feet="Sulev. Leggings +2",
    neck="War. Beads +2",
    waist="Ioskeha Belt +1",
    left_ear="Thrud Earring",
    right_ear="Moonshade Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back=gear.ambuscape.wsStr
  }
  sets.WS['Full Break'] = {   -- Single Hit : 50% STR / 50% VIT
    ammo="Pemphredo Tathlum", -- Focus on M.Acc+ for additional effect
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Flam. Manopolas +2",
    legs="Flamma Dirs +2",
    feet="Flam. Gambieras +2",
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
  equip(set_for_current_mode())

  if spell.type == 'WeaponSkill' then
    send_command('wait 0.2; input /echo TP Return: <tp>')
  end
end

function status_change(new, old)
  equip(set_for_current_mode())
end

function set_for_ws(named)
  if named == 'Upheaval' and buffactive['Mighty Strikes'] then
    return sets.WS.Upheaval_MS
  elseif sets.WS[named] then
    return sets.WS[named]
  else
    return sets.WS.Upheaval
  end
end

function set_for_current_mode()
  if player.status == 'Engaged' then
    return sets.modes[PrimaryMode.current]
  else
    return set_combine(
      sets.modes[PrimaryMode.current],
      sets.Idle
    )
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
    equip(sets.modes[PrimaryMode.current])
  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
    end
    equip(sets.modes[PrimaryMode.current])
  end
end
