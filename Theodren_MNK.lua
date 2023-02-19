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
Relic Feet: Mantra HP+
Empy Body: Impetus TP, Impetus Victory Smite
--]]

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'FullDD', 'HybridLight', 'HybridHeavy'}
  WeaponMode = M{['description'] = 'Weapon Mode', 'Auto', 'Godhands', 'Verethragna'}
  send_command("bind ^f1 gs c cycle PrimaryMode")
  send_command("bind ^f2 gs c cycle WeaponMode")
end

function get_sets()
  define_modes()

  gear = {
    ambuscape = {
      daDex = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
      daStr = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
      crit = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10',}},
    }
  }

  sets.modes = {}
  sets.modes.FullDD = {
    ammo="Coiste Bodhar",
    head=augments.adhemar.head.pathA,
    body="Mpaca's Doublet",
    hands="Adhemar Wristbands +1",
    legs="Bhikku Hose +3",
    feet="Anch. Gaiters +3",
    neck="Monk's Nodowa +2",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.daDex
  }
  sets.modes.HybridLight = {
    ammo="Coiste Bodhar",
    head=augments.adhemar.head.pathA,
    body="Mpaca's Doublet",     -- 10 PDT
    hands="Mpaca's Gloves",     -- 8 PDT
    legs="Bhikku Hose +3",      -- 13 DT
    feet="Anch. Gaiters +3",
    neck="Monk's Nodowa +2",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.daDex      -- 10 PDT
  }                             -- 41 PDT
  sets.modes.HybridHeavy = {
    ammo="Coiste Bodhar",
    head="Ken. Jinpachi +1",
    body="Mpaca's Doublet",     -- 10 PDT
    hands="Mpaca's Gloves",     -- 8 PDT
    legs="Bhikku Hose +3",      -- 13 DT
    feet="Ken. Sune-Ate +1",
    neck="Monk's Nodowa +2",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Defending Ring",-- 10 DT
    back=gear.ambuscape.daDex      -- 10 PDT
  }                             -- 51 PDT
  sets.modes.SubtleBlowDT = {
    ammo="Coiste Bodhar",
    head="Ken. Jinpachi +1",
    body="Mpaca's Doublet",     -- 10 PDT
    hands="Mpaca's Gloves",     -- 8 PDT
    legs="Bhikku Hose +3",      -- 13 DT
    feet="Ken. Sune-Ate +1",
    neck="Monk's Nodowa +2",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
    left_ring="Defending Ring",  -- 10 DT
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.daDex    -- 10 PDT
  }
  sets.modes.Counter = {
    ammo="Coiste Bodhar",
    head="Ken. Jinpachi +1",
    body="Mpaca's Doublet",     -- 10 counter
    hands="Mpaca's Gloves",
    legs="Bhikku Hose +3",      -- AF legs  6
    feet="Nyame Sollerets",     -- rao kote +1  5 counter
    neck="Monk's Nodowa +2",    -- Bathy choker +1  10
    waist="Moonbow Belt +1",
    left_ear="Cryptic Earring", -- 3 counter
    right_ear="Bhikku Earring +1", -- 8 counter
    left_ring="Gere Ring",
    right_ring="Defending Ring",
    back=gear.ambuscape.counter -- 10 counter
  }

  -- Misc
  sets.Idle = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Hermes' Sandals",
    neck="Loricate Torque +1",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Eabani Earring",
    left_ring="Gere Ring",
    right_ring="Odnowa Earring +1",
    back=gear.ambuscape.daDex
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
    back=gear.ambuscape.daDex
  }

  -- Weapon Skills
  --
  -- Tornado Kick > Shijin Spiral (Fragmentation) -> Shijin Spiral (Light) -> Victory Smite (Radiance)
  -- Tornado Kick > Shijin Spiral (Fragmentation) -> Shijin Spiral (Light) -> Shijin Spiral (Radiance)
  -- Asuran Fists > Victory Smite (Fragmentation) -> Shijin Spiral (Light) -> Victory Smite (Radiance)
  -- asura tk smite smite
  --
  sets.WS = {}
  sets.WS['Victory Smite'] = { -- 80% STR, 4-hit, Crit rate varies, Empyrean WS
    ammo="Coiste Bodhar",
    head=augments.adhemar.head.pathB,
    body="Ken. Samue +1",
    hands="Ryuo Tekko +1",
    legs="Mpaca's Hose",
    feet=augments.herc.feet.crit,
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
    body="Mpaca's Doublet",
    hands=augments.herc.hands.reso,
    legs="Mpaca's Hose",
    feet=augments.herc.feet.triple,
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.daStr
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
    back=gear.ambuscape.daDex
  }
  sets.WS['Howling Fist'] = { -- 50% VIT / 20% STR, 2-hit, Damage varies
    ammo="Coiste Bodhar",
    head="Mpaca's Cap",
    body="Mpaca's Doublet",
    hands=augments.herc.hands.reso,
    legs="Mpaca's Hose",
    feet=augments.herc.feet.triple,
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.daStr
  }
  sets.WS['Tornado Kick'] = { -- 40% STR & VIT, 3-hit, Damage varies
    ammo="Coiste Bodhar",
    head="Mpaca's Cap",
    body="Mpaca's Doublet",
    hands=augments.herc.hands.reso,
    legs="Mpaca's Hose",
    feet="Anch. Gaiters +3",
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.daStr
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
    return set_combine(sets.WS[named], { body = "Bhikku Cyclas +2" })
  elseif sets.WS[named] then
    return sets.WS[named]
  else
    return sets.WS['Raging Fists']
  end
end

function set_for_engaged()
  local set = sets.modes[PrimaryMode.value]

  set.main = current_weapon()

  if PrimaryMode.value == 'FullDD' and buffactive['Impetus'] then
    set = set_combine(set, { body = "Bhikku Cyclas +2" })
  end

  -- if WeaponMode.value == 'Auto' then
  --   if buffactive['Impetus'] or (player.equipment.main == 'Verethragna' and buffactive['Aftermath: Lv.3']) then
  --     set.main = 'Verethragna'
  --   else
  --     set.main = 'Godhands'
  --   end    
  -- else
  --   set.main = WeaponMode.value
  -- end

  return set
end

function current_weapon()
  local weapon = WeaponMode.value

  if WeaponMode.value == 'Auto' then
    if buffactive['Impetus'] or (player.equipment.main == 'Verethragna' and buffactive['Aftermath: Lv.3']) then
      weapon = 'Verethragna'
    else
      weapon = 'Godhands'
    end
  end

  return weapon
end

function set_for_current_mode()
  if player.status == 'Engaged' then
    return set_for_engaged()
  else
    return set_combine(sets.Idle, { main=current_weapon() })
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
  elseif command == 'idle' then
    equip(sets.Idle)
  end
end
