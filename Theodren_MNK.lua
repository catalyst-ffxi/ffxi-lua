include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')
include('utils.lua')

--[[
# TODO List

Reforges:
AF Head: Focus duration+
Relic Legs: TP
Relic Head: Tornado Kick, Howling Fist, Enhances Penance
Relic Body: Hundred Fists duration+
Relic Feet: Mantra HP+
Empy Body: Impetus TP, Impetus Victory Smite
--]]

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'FullDD', 'HybridLight', 'HybridHeavy'}
  send_command("bind ^f1 gs c cycle PrimaryMode")
end

function get_sets()
  define_modes()

  gear = {
    ambuscape = {
      tp = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
      crit = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10',}},
      wsd = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
    }
  }

  sets.modes = {}
  sets.modes.FullDD = {
    main="Godhands",
    ammo="Coiste Bodhar",
    head="Adhemar Bonnet +1",
    body="Mpaca's Doublet",
    hands="Adhemar Wristbands +1",
    legs="Bhikku Hose +2",
    feet="Anch. Gaiters +3",
    neck="Anu Torque",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.tp
  }
  sets.modes.HybridLight = {
    main="Godhands",
    ammo="Coiste Bodhar",
    head="Adhemar Bonnet +1",
    body="Mpaca's Doublet",     -- 10 PDT
    hands="Mpaca's Gloves",     -- 8 PDT
    legs="Bhikku Hose +2",      -- 13 DT
    feet="Anch. Gaiters +3",
    neck="Anu Torque",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.tp      -- 10 PDT
  }                             -- 41 PDT
  sets.modes.HybridHeavy = {
    main="Godhands",
    ammo="Coiste Bodhar",
    head="Ken. Jinpachi +1",
    body="Mpaca's Doublet",     -- 10 PDT
    hands="Mpaca's Gloves",     -- 8 PDT
    legs="Bhikku Hose +2",      -- 13 DT
    feet="Ken. Sune-Ate +1",
    neck="Anu Torque",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Defending Ring",-- 10 DT
    back=gear.ambuscape.tp      -- 10 PDT
  }                             -- 51 PDT
  
  -- Misc
  -- sets.Idle = {
  --   ammo="Staunch Tathlum +1",     -- 3 DT
  --   head="Malignance Chapeau",     -- 6 DT
  --   body="Malignance Tabard",      -- 9 DT
  --   hands="Malignance Gloves",     -- 5 DT
  --   legs="Malignance Tights",      -- 7 DT
  --   feet="Hermes' Sandals",        -- Movement speed
  --   neck="Loricate Torque +1",     -- 6 DT
  --   waist="Moonbow Belt +1",          -- 5 DT
  --   left_ear="Eabani Earring",     -- 8 Meva
  --   right_ear="Odnowa Earring +1", -- 2 MDT, 3 DT
  --   left_ring="Defending Ring",    -- 10 DT
  --   right_ring="Purity Ring",      -- 4 MDT, 10 Meva
  --   back=gear.ambuscape.tp         -- 10 PDT
  -- }
  sets.Idle = {
    feet="Hermes' Sandals"
  }

  -- JAs
  sets.JAs = {}
  sets.JAs.Footwork = { feet="Shukuyu Sune-Ate" }
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
    ammo="Sapience Orb",             -- 2
    hands="Leyline Gloves",          -- 7
    neck="Orunmila's Torque",        -- 5
    left_ear="Loquacious earring",   -- 2
    right_ear="Etiolation Earring",  -- 1
    left_ring="Weatherspoon Ring +1",-- 6
  }
  sets.Magic.SpellInterrupt = {
    head=augments.taeon.head.SID,
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet=augments.taeon.feet.phalanx,
    neck="Loricate Torque +1",
    waist="Moonbow Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Magnetic Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back=gear.ambuscape.tp
  }

  -- Weapon Skills
  --
  -- Tornado Kick > Shijin Spiral (Fragmentation) -> Shijin Spiral (Light) -> Victory Smite (Radiance)
  -- Tornado Kick > Shijin Spiral (Fragmentation) -> Shijin Spiral (Light) -> Shijin Spiral (Radiance)
  -- Asuran Fists > Victory Smite (Fragmentation) -> Shijin Spiral (Light) -> Victory Smite (Radiance)
  --
  sets.WS = {}
  sets.WS['Victory Smite'] = { -- 80% STR, 4-hit, Crit rate varies, Empyrean WS
    ammo="Knobkierrie",
    -- head="Adhemar Bonnet +1",
    head="Mpaca's Cap",
    body="Ken. Samue +1",
    hands="Ryuo Tekko",
    legs="Mpaca's Hose",
    feet=augments.herc.feet.triple,
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.crit
  }
  sets.WS['Raging Fists'] = { -- 30% STR & DEX, 5-hit, Damage varies
    ammo="Coiste Bodhar",
    head="Mpaca's Cap",
    body="Ken. Samue +1",
    hands=augments.herc.hands.reso,
    legs="Mpaca's Hose",
    feet=augments.herc.feet.triple,
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Moonshade Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.tp
  }
  sets.WS['Shijin Spiral'] = { -- 100% DEX, 5-hit, Plague effect varies
    ammo="Knobkierrie",
    head="Ken. Jinpachi +1",
    body="Ken. Samue +1",
    hands="Ken. Tekko +1",
    legs="Ken. Hakama +1",
    feet="Ken. Sune-Ate +1",
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Mache Earring +1",
    left_ring="Ilabrat Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.tp
  }
  sets.WS['Howling Fist'] = { -- 50% VIT / 20% STR, 2-hit, Damage varies
    ammo="Coiste Bodhar",
    head="Mpaca's Cap",
    body="Nyame Mail",
    hands=augments.herc.hands.reso,
    legs="Mpaca's Hose",
    feet=augments.herc.feet.triple,
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Moonshade Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.wsd
  }
  sets.WS['Tornado Kick'] = { -- 40% STR & VIT, 3-hit, Damage varies
    ammo="Coiste Bodhar",
    head="Mpaca's Cap",
    body="Nyame Mail",
    hands=augments.herc.hands.reso,
    legs="Mpaca's Hose",
    feet="Anch. Gaiters +3",
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Moonshade Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.wsd
  }
  sets.WS['Dragon Kick'] = sets.WS['Tornado Kick'] -- 50% STR & VIT, Damage varies
  sets.WS['Spinning Attack'] = sets.WS['Howling Fist'] 

  -- sets.WS['Asuran Fists'] = { -- 15% STR & VIT, 8-hit, Accuracy varies
  --   ammo="Coiste Bodhar",
  --   head="Ken. Jinpachi +1",
  --   body="Ken. Samue +1",
  --   hands="Ken. Tekko +1",
  --   legs="Ken. Hakama +1",
  --   feet="Ken. Sune-Ate +1",
  --   neck="Fotia Gorget",
  --   waist="Fotia Belt",
  --   left_ear="Sherida Earring",
  --   right_ear="Moonshade Earring",
  --   left_ring="Regal Ring",
  --   right_ring="Niqmaddu Ring",
  --   back=gear.ambuscape.wsd
  -- }
end

function precast(spell)
  if spell.type == 'WeaponSkill' then
    equip(set_for_ws(spell.english))

  elseif sets.JAs[spell.english] then
    equip(sets.JAs[spell.english])

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
  if named == 'Victory Smite' and buffactive['Impetus'] then
    return set_combine(sets.WS[named], { body = "Bhikku Cyclas +1" })
  elseif sets.WS[named] then
    return sets.WS[named]
  else
    return sets.WS['Raging Fists']
  end
end

function set_for_engaged()
  local set = sets.modes[PrimaryMode.current]
  -- if PrimaryMode.value == 'FullDD' and buffactive['Impetus'] then
  --   set = set_combine(set, { body = "Bhikku Cyclas +1" })
  -- end
  -- if buffactive['Impetus'] then
  --   set = set_combine(set, { body = "Bhikku Cyclas +1" })
  -- end
  return set
end

function set_for_current_mode()
  if player.status == 'Engaged' then
    return set_for_engaged()
  else
    return sets.Idle
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
