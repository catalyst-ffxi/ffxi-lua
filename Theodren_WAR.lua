include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'HybridLight', 'HybridHeavy'}
end

function define_binds()
  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  -- send_command('bind !f9 input /item "Echo Drops" <me>')
  -- send_command('bind !f10 input /item "Remedy" <me>')
  -- send_command('bind !f11 input /item "Holy Water" <me>')
end

function get_sets()
  define_modes()
  define_binds()

  gear = {
    ambuscape = {
      tp = { name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
      wsVit = { name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},
      wsStr = { } -- TODO
    }
  }

  sets.modes = {}
  sets.modes.Normal = {
    main="Chango",
    sub="Utu Grip",
    ammo="Aurgelmir Orb",
    head="Flam. Zucchetto +2",
    body="Agoge Lorica +3",
    hands="Sulev. Gauntlets +2",   -- 5 DT
    legs="Pummeler's Cuisses +3",  -- 5 PDT
    feet="Pummeler's Calligae +3",
    neck="War. Beads +2",
    waist="Ioskeha Belt +1",
    left_ear="Brutal Earring",
    right_ear="Cessance Earring",
    left_ring="Moonlight Ring",    -- 5 DT
    right_ring="Moonlight Ring",   -- 5 DT
    back=gear.ambuscape.tp         -- DEX/Acc/Att/Dbl/PDT
  }                                -- 30 PDT, 100% DA, 52 STP
  sets.modes.HybridLight = set_combine(sets.modes.Normal, {
    body="Hjarrandi Breast.",  -- 12 DT
  })                           -- 42 PDT, 35 MDT
  sets.modes.HybridHeavy = set_combine(sets.modes.Normal, {
    ammo="Staunch Tathlum +1", -- 3 DT
    body="Hjarrandi Breast.",  -- 12 DT
    left_ring="Defending Ring" -- 10 DT
  })                           -- 50 PDT, 35 MDT
  sets.Idle = {
    -- feet="Hermes' Sandals"
  }

  -- JAs
  sets.JAs = {}
  sets.JAs.Aggressor = { head="Pummeler's Mask +1", body="Agoge Lorica +3" }
  sets.JAs.Berserk = { body="Pumm. Lorica +3", feet="Agoge Calligae", back="Cichol's Mantle" }
  sets.JAs['Mighty Strikes'] = { hands="Agoge Mufflers" }
  sets.JAs.Warcry = { head="Agoge Mask +3" }

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
    left_ring="Rahab Ring",         -- 2
  }
  sets.Magic.SpellInterrupt = {
    ammo="Staunch Tathlum +1",      -- 11 SID, 3 DT
    body="Hjarrandi Breast.",       -- 12 DT
    hands="Sulev. Gauntlets +2",    -- 5 DT
    legs="Pummeler's Cuisses +3",   -- 4 PDT
    neck="Moonlight Necklace",      -- 15 SID
    waist="Audumbla Sash",          -- 10 SID, 4 PDT
    left_ear="Genmei Earring",      -- 2 PDT
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
    hands=augments.odyssean.hands.wsd,
    legs=augments.odyssean.legs.wsd,
    feet="Sulev. Leggings +2",
    neck="War. Beads +2",
    waist="Ioskeha Belt +1",
    left_ear="Thrud Earring",
    right_ear="Moonshade Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring +1",
    back=gear.ambuscape.wsVit
  }
  sets.WS.Upheaval_MS = {
    ammo="Yetshila +1",
    head="Agoge Mask +3",
    body="Pumm. Lorica +3",
    hands=augments.odyssean.hands.wsd,
    legs=augments.odyssean.legs.wsd,
    feet=augments.valorous.greaves.crit,
    neck="War. Beads +2",
    waist="Ioskeha Belt +1",
    left_ear="Brutal Earring",
    right_ear="Moonshade Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring +1",
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
    waist="Ioskeha Belt +1",
    left_ear="Thrud Earring",
    right_ear="Moonshade Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring +1",
    back=gear.ambuscape.wsVit
  }
  sets.WS["Ukko's Fury"] = { -- 2-Hit : 80% STR : Crit Rate
    ammo="Yetshila +1",
    head="Agoge Mask +3",
    body="Hjarrandi Breast.",
    hands=augments.valorous.mitts.ws,
    legs="Pummeler's Cuisses +3",
    feet="Pummeler's Calligae +3",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Moonshade Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring +1",
    back=gear.ambuscape.tp
  }
  sets.WS['Raging Rush'] = { -- 3-Hit : 50% STR : Crit Rate
    ammo="Yetshila +1",
    head="Flam. Zucchetto +2",
    body="Hjarrandi Breast.",
    hands="Flam. Manopolas +2",
    legs="Pummeler's Cuisses +3",
    feet="Pummeler's Calligae +3",
    neck="War. Beads +2",
    waist="Ioskeha Belt +1",
    left_ear="Brutal Earring",
    right_ear="Moonshade Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back=gear.ambuscape.tp
  }
  sets.WS['Steel Cyclone'] = { -- Single Hit : 60% STR / 60% VIT
    ammo="Knobkierrie",
    head="Agoge Mask +3",
    body="Pumm. Lorica +3",
    hands=augments.valorous.mitts.ws,
    legs=augments.odyssean.legs.wsd,
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Thrud Earring",
    right_ear="Moonshade Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring +1",
    back=gear.ambuscape.wsVit
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
    left_ring="Regal Ring",
    right_ring="Karieyh Ring +1",
    back=gear.ambuscape.wsVit
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
    back=gear.ambuscape.wsVit
  }
  sets.WS['Armor Break'] = sets.WS['Full Break']
  sets.WS['Weapon Break'] = sets.WS['Full Break']
  sets.WS['Shield Break'] = sets.WS['Full Break']
end

function precast(spell)
  if spell.type == 'WeaponSkill' then
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
    equip(set_for_current_mode())
  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
    end
    equip(sets.modes[PrimaryMode.current])
  end
end
