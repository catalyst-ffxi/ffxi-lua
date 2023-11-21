include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')
include('utils.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'FullDD', 'HybridHeavy', 'MagicTank'}
  WeaponMode = M{['description'] = 'Weapon Mode', 'Verethragna', 'Godhands', 'Auto'}
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
    body="Mpaca's Doublet",     -- 10 PDT
    hands="Adhemar Wristbands +1",
    legs="Bhikku Hose +3",      -- 14 DT
    feet="Anch. Gaiters +3",
    neck="Monk's Nodowa +2",
    waist="Moonbow Belt +1",    -- 6 DT
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.daDex   -- 10 PDT
  }                             -- 40 PDT
  sets.modes.HybridHeavy = {
    ammo="Coiste Bodhar",
    head="Mpaca's Cap",         -- 7 PDT
    body="Mpaca's Doublet",     -- 10 PDT
    hands="Mpaca's Gloves",     -- 8 PDT
    legs="Bhikku Hose +3",      -- 14 DT
    feet="Anch. Gaiters +3",
    neck="Monk's Nodowa +2",
    waist="Moonbow Belt +1",    -- 6 DT
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.daDex   -- 10 PDT
  }                             -- 55 PDT
  sets.modes.MagicTank = {
    ammo="Coiste Bodhar",
    head="Nyame Helm",          -- 7 DT
    body="Mpaca's Doublet",     -- 10 PDT
    hands="Mpaca's Gloves",     -- 8 PDT
    legs="Bhikku Hose +3",      -- 14 DT
    feet="Nyame Sollerets",     -- 7 DT
    neck="Monk's Nodowa +2",
    waist="Moonbow Belt +1",    -- 6 DT
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
    left_ring="Shadow Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.daDex   -- 10 PDT
  }                             -- 55 PDT
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
    legs="Bhikku Hose +3",
    feet="Hermes' Sandals",
    neck="Loricate Torque +1",
    waist="Ask Sash",
    left_ear="Sherida Earring",
    right_ear="Eabani Earring",
    left_ring="Gere Ring",
    right_ring="Defending Ring",
    back=gear.ambuscape.daDex
  }

  -- JAs
  sets.JAs = {}
  sets.JAs.Footwork = { feet="Bhikku Gaiters +3" }
  sets.JAs['Hundred Fists'] = { legs="Hes. Hose +2" }
  sets.JAs.Provoke = {
    ammo="Sapience Orb",
    head="Halitus Helm",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Bhikku Hose +3",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Supershear Ring",
    right_ring="Eihwaz Ring",
    waist="Kasiri Belt",
    back=gear.ambuscape.daDex
  }
  sets.JAs['Perfect Counter'] = sets.JAs.Provoke
  sets.JAs['Chi Blast'] = {
    ammo="Sapience Orb",
    head="Hes. Crown +2", -- penance
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Bhikku Hose +3",
    feet="Nyame Sollerets",
    neck="Moonlight Necklace",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Supershear Ring",
    right_ring="Eihwaz Ring",
    waist="Kasiri Belt",
    back=gear.ambuscape.daDex
  }
  sets.JAs.Mantra = {
    ammo="Sapience Orb",
    -- head="Halitus Helm",
    -- body="Emet Harness +1",
    -- hands="Kurys Gloves",
    -- legs="Bhikku Hose +3",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Hes. Gaiters +2", -- mantra
    neck="Loricate Torque +1",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Supershear Ring",
    right_ring="Eihwaz Ring",
    waist="Kasiri Belt",
    back=gear.ambuscape.daDex
  }
  sets.JAs.Chakra = {
    ammo="Sapience Orb",
    head="Nyame Helm",
    body="Anch. Cyclas +1", -- chakra
    hands="Hes. Gloves +2", -- chakra
    legs="Bhikku Hose +3",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    left_ear="Odnowa Earring +1",
    right_ear="Eabani Earring",
    left_ring="Gelatinous Ring +1",
    right_ring="Defending Ring",
    waist="Moonbow Belt +1",
    back=gear.ambuscape.daDex
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
  sets.Magic.Phalanx = {
    body=augments.herc.body.phalanx,
    hands=augments.taeon.hands.phalanx,
    legs=augments.taeon.legs.phalanx,
    feet=augments.taeon.feet.phalanx
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
    body="Mpaca's Doublet",
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
    head="Mpaca's Helm",
    body="Mpaca's Doublet",
    hands="Mpaca's Gloves",
    legs="Mpaca's Hose",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
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
  sets.WS.TK_FOOTWORK = {
    ammo="Coiste Bodhar",
    head="Mpaca's Cap",
    body="Mpaca's Doublet",
    hands="Nyame Gauntlets",  
    legs="Mpaca's Hose",
    feet="Anch. Gaiters +3",
    neck="Mnk. Nodowa +2",
    waist="Moonbow Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.daStr
  }
  sets.WS.TK_NO_FOOTWORK = {
    ammo="Coiste Bodhar",
    head="Mpaca's Cap",
    body="Mpaca's Doublet",
    hands="Nyame Gauntlets",  
    legs="Mpaca's Hose",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back=gear.ambuscape.daStr
  }
  sets.WS['Spinning Attack'] = sets.WS['Howling Fist'] 
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
    return set_combine(sets.WS[named], { body = "Bhikku Cyclas +3" })
  elseif named == 'Tornado Kick' or named == 'Dragon Kick' then
    if buffactive['Footwork'] then
      return sets.WS.TK_FOOTWORK
    else
      return sets.WS.TK_NO_FOOTWORK
    end
  else
    return sets.WS[named]
  end
end

function set_for_engaged()
  local set = sets.modes[PrimaryMode.value]

  set.main = current_weapon()

  if (PrimaryMode.value == 'FullDD' or PrimaryMode.value == 'HybridLight') and buffactive['Impetus'] then
    set = set_combine(set, { body = "Bhikku Cyclas +3" })
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
    local set = set_combine(sets.Idle, { main=current_weapon() })
    -- if buffactive['Boost'] then
    --   set.waist = 'Ask Sash'
    -- end
    return set
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
