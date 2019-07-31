include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'HybridLight', 'HybridHeavy'}
end

function define_binds()
  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  send_command('bind !f9 input /item "Echo Drops" <me>')
  send_command('bind !f10 input /item "Remedy" <me>')
  send_command('bind !f11 input /item "Holy Water" <me>')
end

function get_sets()
  define_modes()
  define_binds()

  gear = {
    ambuscape = {
      tp = { name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
      upheaval = { name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},
      ukko = { }, -- TODO
    }
  }

  sets.modes = {}
  -- TODO TP Items:
  -- neck="War. Beads +1",
  -- body="Agoge Lorica +3"
  sets.modes.Normal = {
    main="Chango",
    sub="Utu Grip",
    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body="Valorous Mail",
    hands="Sulev. Gauntlets +2",
    legs="Pummeler's Cuisses +2",
    feet="Pummeler's Calligae +2",
    neck="Lissome Necklace",
    waist="Ioskeha Belt +1",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.tp
  }
  sets.modes.HybridLight = {
    main="Chango",
    sub="Utu Grip",
    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body="Valorous Mail",            -- 2 PDT
    hands="Sulev. Gauntlets +2",     -- 5 DT
    legs="Pummeler's Cuisses +2",    -- 4 PDT
    feet="Pummeler's Calligae +2",
    neck="Loricate Torque +1",       -- 6 DT
    waist="Ioskeha Belt +1",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Moonbeam Ring",      -- 4 DT
    right_ring="Defending Ring",    -- 10 DT
    back=gear.ambuscape.tp          -- 10 PDT
  }                                 -- 41 PDT
  sets.modes.HybridHeavy = {
    main="Chango",
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",      -- 3 DT
    head="Flam. Zucchetto +2",
    body="Valorous Mail",           -- 2 PDT
    hands="Sulev. Gauntlets +2",    -- 5 DT
    legs="Pummeler's Cuisses +2",   -- 4 PDT
    feet="Pummeler's Calligae +2",
    neck="Loricate Torque +1",      -- 6 DT
    waist="Flume Belt +1",          -- 4 PDT
    left_ear="Genmei Earring",      -- 2 PDT
    right_ear="Odnowa Earring +1",  -- 2 MDT
    left_ring="Moonbeam Ring",      -- 4 PDT
    right_ring="Defending Ring",    -- 10 DT
    back=gear.ambuscape.tp          -- 10 PDT
  }                                 -- 50 PDT, 26 MDT
  sets.Idle = {
    feet="Hermes' Sandals"
  }

  -- JAs
  sets.JAs = {}
  sets.JAs['Aggressor'] = { head="Pummeler's Mask", body="Agoge Lorica" }
  sets.JAs['Berserk'] = { body="Pumm. Lorica +2", feet="Agoge Calligae", back="Chichol's Mantle" }
  sets.JAs['Mighty Strikes'] = { hands="Agoge Mufflers" }
  sets.JAs['Warcry'] = { head="Agoge Mask +1" }
  sets.JAs['Provoke'] = {
    ammo="Sapience Orb",           -- 2
    head="Halitus Helm",           -- 8
    neck="Moonlight Necklace",     -- 15
    left_ear="Trux Earring",       -- 5
    right_ear="Cryptic Earring",   -- 4
    body="Emet Harness +1",        -- 10
    left_ring="Supershear Ring",   -- 5
    right_ring="Eihwaz Ring",      -- 5
    waist="Kasiri Belt",           -- 3
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.FastCast = {
    ammo="Impatiens",               -- 2 Quick
    neck="Orunmila's Torque",       -- 5
    left_ear="Loquacious earring",  -- 2
    right_ear="Etiolation Earring", -- 1
    hands="Leyline Gloves",         -- 7
    right_ring="Prolix Ring"        -- 2
  }
  sets.Magic.SpellInterrupt = {
    ammo="Staunch Tathlum +1",       -- 11
    neck="Loricate Torque +1",       -- DT
    waist="Flume Belt +1",           -- PDT
    left_ear="Magnetic Earring",     -- 8
    left_ring="Defending Ring",      -- DT
    right_ring="Gelatinous Ring +1", -- PDT
    back=gear.ambuscape.tp
  }

  -- Weapon Skills
  --
  sets.WS = {}
  -- TODO WS Items:
  -- head="Agoge Mask +2",
  -- body="Pumm. Lorica +2",
  sets.WS.Upheaval = {
    ammo="Knobkierrie",
    head=augments.odyssean.head.wsd,
    body="Pumm. Lorica +2",
    hands=augments.odyssean.hands.wsd,
    legs=augments.odyssean.legs.wsd,
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Ioskeha Belt +1",
    left_ear="Ishvara Earring",
    right_ear="Moonshade Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.upheaval
  }
  sets.WS["Ukko's Fury"] = {
    ammo="Yetshila",
    head="Valorous Mask",          -- TODO  (crit dmg, str, acc/att)
    body="Pumm. Lorica +2",        -- TODO
    hands="Flam. Manopolas +2",    -- TODO
    legs="Valorous Hose",          -- TODO
    feet="Pummeler's Calligae +1", -- TODO
    neck="Fotia Gorget",           -- TODO: Replace with JSE neck
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Moonshade Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.tp        -- Make ukko cape
  }
  -- sets.WS['Steel Cyclone'] = {
  -- }
  -- sets.WS['Full Break'] = {
  -- }
  -- sets.WS["King's Justice"] = {
  -- }
  -- sets.WS['Fell Cleave'] = {
  -- }
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
  if sets.WS[named] then
    return sets.WS[named]
  else
    return sets.WS.Upheaval
  end
end

function set_for_current_mode()
  if player.status=='Engaged' then
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

  if command == 'run' then
    -- equip(sets.Idle)
    equip(set_for_current_mode())
  elseif command == "mode" then
    -- equip(set_for_current_mode())
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
