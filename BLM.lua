include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Caster'}
  NukingMode = M{['description'] = 'Nuking Mode', 'Normal', 'MagicBurst'}
  DamageDown = M(false, 'Damage Down')
  Element = M{['description'] = 'Primary Element', 'Thunder', 'Blizzard', 'Fire', 'Aero', 'Water', 'Stone'}
  Capacity = M(false, 'Capacity Mantle')
end

function define_aliases()
  -- Elements
  send_command('alias tier1 input /ma "'..Element.current..'" <t>')
  send_command('alias tier2 input /ma "'..Element.current..' II" <t>')
  send_command('alias tier3 input /ma "'..Element.current..' III" <t>')
  send_command('alias tier4 input /ma "'..Element.current..' IV" <t>')
  send_command('alias tier5 input /ma "'..Element.current..' V" <t>')
  send_command('alias tier6 input /ma "'..Element.current..' VI" <t>')
  send_command('alias enspell input /ma "En'..Element.current:lower()..'" <me>')
  storms = {
    Thunder = 'Thunderstorm',
    Blizzard = 'Hailstorm',
    Fire = 'Firestorm',
    Aero = 'Windstorm',
    Water = 'Rainstorm',
    Stone = 'Sandstorm'
  }
  send_command('alias storm input /ma "'..storms[Element.current]..'" <me>')

  -- Function Key Shortcuts
  -- Nukes
  send_command('bind ^f1 tier2')
  send_command('bind ^f2 tier3')
  send_command('bind ^f3 tier4')
  send_command('bind ^f4 tier5')
  send_command('bind ^f5 tier6')

  -- Self Buffs
  send_command('bind !f5 stoneskin')
  send_command('bind !f6 phalanx')
  send_command('bind !f7 blink')
  send_command('bind !f8 aquaveil')

  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  -- send_command("alias g15v2_m1g2 gs c cycle EnfeebleMode")
  send_command("alias g15v2_m1g3 gs c cycle NukingMode")
  send_command("alias g15v2_m1g4 gs c cycle Element")
  send_command("alias g15v2_m1g5 lightarts")
  send_command("alias g15v2_m1g6 darkarts")

  send_command("alias auto_aspir gs c auto_aspir")
end

function get_sets()

  define_modes()
  define_aliases()

  gear = {
    taranus = {
      nuke = "Taranus's Cape"
    }
  }

  -- Mode Sets
  --
  sets.modes = {}
  sets.modes.Caster = {
    -- main = "Lathi",
    main = augments.grio.nuke,
    sub = "Enki Strap",
    ammo = "Ombre Tathlum +1",
    head = augments.merlinic.hood.nuke,
    neck = "Sanctity Necklace",
    lear = "Strophadic Earring",
    rear = "Barkarole Earring",
    body = augments.merlinic.jubbah,
    hands = "Amalric Gages",
    lring = "Shiva Ring",
    rring = "Strendu Ring",
    back = gear.taranus.nuke,
    waist = "Refoccilation Stone",
    legs = augments.merlinic.shalwar.burst,
    feet = augments.merlinic.crackows.nuke
  }
  sets.aftercast = {}
  sets.aftercast.Caster = set_combine(sets.modes.Caster, {
    head = "Befouled Crown",
    neck = "Loricate Torque +1",
    left_ear = "Etiolation Earring",
    right_ear="Hearty Earring",
    body = "Jhakri Robe +1",
    lring = "Gelatinous Ring +1",
    rring = "Defending Ring",
    back = "Solemnity Cape",
    waist = "Fucho-no-Obi",
    legs = "Assiduity pants"
  })

  -- Base Sets
  --
  sets.base = {}

  sets.base.fast_cast = {
    -- ammo = "Impatiens",
    head = augments.merlinic.hood.nuke,   -- 13
    lear = "Loquacious earring",   -- 2
    rear = "Magnetic earring",
    body = augments.merlinic.jubbah,  -- 6
    hands = "Helios Gloves",       -- 5
    lring = "Kishar Ring",   -- 4
    rring = "Prolix Ring",         -- 2
    -- -- back = "Swith Cape",           -- 3
    -- waist = "Witful Belt",         -- 3
    legs = "Lengo Pants", -- 5
    feet = augments.merlinic.crackows.nuke -- 5
  }
  sets.base.quick_cast = {
    ammo = "Impatiens",
    lring = "Weatherspoon Ring",
    waist = "Witful Belt"
  }
  sets.base.auto_refresh = {
    body = "Jhakri Robe +1"
  }
  sets.base.move_speed = {
    legs = "Track Pants +1"
  }
  sets.base.idle = set_combine(sets.modes.Caster, {
  })
  sets.base.resting = set_combine(sets.modes.Caster, {
    head = "Befouled Crown",
    body = "Jhakri Robe +1",
    waist = "Fucho-no-Obi",
    legs = "Assiduity pants"
  })

  -- Weapon Skills
  --
  sets.ws = {
    neck = "Fotia Gorget"
  }
  sets.ws.Myrkr = {
    ammo = "Ombre Tathlum +1",
    -- head = "Kaabnax Hat",
    head = "Pixie Hairpin +1",
    neck = "Sanctity Necklace",
    lear = "Influx Earring",
    rear = "Moonshade Earring",
    body = augments.merlinic.jubbah,
    hands = "Otomi Gloves",
    lring = "Etana Ring",
    rring = "Bifrost Ring",
    back = "Bane Cape",
    waist = "Fucho-no-Obi",
    legs = augments.merlinic.shalwar.macc,
    feet = augments.merlinic.crackows.nuke
  }

  -- MIDCAST
  --

  -- Dark Magic
  --
  sets.midcast = {}
  sets.midcast.dark = {
    main = augments.grio.nuke,
    -- main = "Lathi",
    sub = "Enki Strap",
    ammo = "Ombre Tathlum +1",
    head = "Amalric Coif",
    -- head = "Pixie Hairpin +1",
    neck = "Erra Pendant",
    lear = "Digni. Earring",
    rear = "Regal Earring",
    body = augments.merlinic.jubbah,
    hands = "Amalric Gages",
    lring = "Weatherspoon Ring",
    rring = "Shiva Ring",
    back = gear.taranus.nuke,
    waist = "Refoccilation Stone",
    legs = "Spaekona's Tonban +2",
    feet = augments.merlinic.crackows.nuke
  }
  sets.midcast.drain_aspir = set_combine(sets.midcast.dark, {
    neck = "Erra Pendant",
    hands = augments.merlinic.dastanas,
    waist = "Fucho-no-Obi",
    feet = augments.merlinic.crackows.nuke
  })
  sets.midcast.stun = set_combine(sets.midcast.dark, {

  })

  -- Elemental magic
  --
  sets.midcast.elemental = {}
  sets.midcast.elemental.Normal = {
    -- main = "Lathi",
    main = augments.grio.nuke,
    sub = "Enki Strap",
    ammo = "Ombre Tathlum +1",
    head = augments.merlinic.hood.nuke,
    neck = "Sanctity Necklace",
    lear = "Strophadic Earring",
    -- rear = "Friomisi earring",
    rear = "Barkarole Earring",
    body = augments.merlinic.jubbah,
    hands = "Amalric Gages",
    lring = "Shiva Ring",
    rring = "Strendu Ring",
    back = gear.taranus.nuke,
    waist = "Refoccilation Stone",
    legs = augments.merlinic.shalwar.macc,
    feet = augments.merlinic.crackows.nuke
  }
  sets.midcast.elemental.MagicBurst = set_combine(sets.midcast.elemental.Normal, {
    neck = "Mizu. Kubikazari",           -- MB +10
    lear = "Friomisi Earring",           -- 0
    lring = "Mujin Band",                -- MB II +5
    rring = "Locus Ring",                -- MB +5
    head = augments.merlinic.hood.burst, -- MB +11
    body = augments.merlinic.jubbah,         -- MB +3
    hands = "Amalric Gages",             -- MB II +5
    legs = augments.merlinic.shalwar.burst,  -- MB +10
    back = gear.taranus.nuke             -- MB +5
  })                                     -- TOTALS
                                         -- MB +44 (Caps at 40%)
                                         -- MB II +10
  -- Death
  --
  -- sets.precast.Death = {
  --
  -- }

  -- Enfeebling Magic
  --
  sets.midcast.enfeebling = {
    -- main = augments.grio.enfeeble,
    ammo = "Quartz Tathlum +1",
    head = augments.merlinic.hood.nuke,
    neck = "Weike torque",
    lear = "Digni. Earring",
    rear = "Regal Earring",
    body = "Vanya Robe",
    hands = "Lurid Mitts",
    lring = "Weatherspoon Ring",
    rring = "Globidonta Ring",
    back = gear.taranus.nuke,
    waist = "Rumination Sash",
    legs = augments.merlinic.shalwar.macc,
    feet = "Medium's Sabots"
  }

  -- Enhancing Magic
  --
  sets.midcast.enhancing_skill = {
  }
  sets.midcast.enhancing_duration = {
    legs = "Telchine Braconi"
  }
  sets.midcast.enhancing_regen = {
    body = "Telchine Chasuble"
  }
  sets.midcast.enhancing_refresh = {
    head = "Amalric Coif"
  }
  sets.midcast.enhancing_refresh_self = {
    waist = "Gishdubar sash",
    feet = "Inspirited Boots"
  }
  sets.midcast.enhancing_stoneskin = {
    head = "Umuthi Hat",
    neck = "Nodens Gorget",
    waist = "Siegel Sash"
  }
  sets.midcast.enhancing_phalanx_self = {
    head = augments.merlinic.hood.phalanx
  }

  -- Precast Magic
  --
  -- sets.midcast.stun = {
  -- }

  -- Healing Sets
  --
  sets.midcast.healing = {
    -- main = "Serenity",            -- 25%
    -- sub = "Mephitis Grip",
    neck = "Colossus's Torque",
    rear = "Mendicant's Earring", -- 5%
    body = "Vanya Robe",          -- 7%
    hands = "Telchine Gloves",    -- 18%
    lring = "Ephedra Ring",
    rring = "Ephedra Ring",
    legs = "Vanya Slops",
    feet = "Vanya Clogs"          -- 5%
  }
  sets.midcast.healing_self = {
    neck = "Phalaina Locket",  -- 4% self
    lring = 'Kunaji Ring',     -- 5% self
    rring = 'Asklepian Ring',  -- 3% self
  }                            -- (30% cap)
  sets.midcast.convert = set_combine(sets.midcast.healing, sets.midcast.healing_self, {
  })
  -- Cursna chance to clear doom affected by Healing Magic and Cursna Effect+ gear
  sets.midcast.cursna = {
    neck = "Colossus's Torque",
    rear = "Mendicant's Earring",
    lring = "Ephedra Ring",
    rring = "Ephedra Ring",
    feet = "Vanya Clogs"
  }
end

function precast(spell)
  precast_cancelations(spell)

  if spell.type == 'JobAbility' then
    precast_ja(spell)

  elseif spell.action_type == 'Magic' then
    precast_magic(spell)

  elseif spell.type == 'WeaponSkill' then
    if sets.ws[spell.english] then
      equip(sets.ws[spell.english])
    else
      equip(sets.ws)
    end
  end

  maintain_reraise_equip()
end

function precast_cancelations(spell)
  if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
    send_command('@wait 0.4; cancel 66; cancel 444; cancel 445')

  elseif string.find(spell.english, 'storm') and buffactive['Light Arts'] and not buffactive['Accession'] then
    cast_delay(1.3)
    send_command('@input /ja "Accession" <me>')

  elseif spell.english == 'Spectral Jig' then
    cast_delay(0.25)
    send_command('@cancel 71;')
  end
end

function precast_ja(spell)
  if spell.english == 'Convert' then
    equip(sets.midcast.convert)
  end
end

function precast_magic(spell)
  equip(sets.base.fast_cast)
  -- add_to_chat(122, spell.skill)
  -- add_to_chat(122, NukingMode.current)
  if not (spell.skill == 'Elemental Magic' and NukingMode.current == 'MagicBurst') then
    -- add_to_chat(122, 'Using quick cast set')
    equip(sets.base.quick_cast)
  end
end

function midcast(spell)
  if spell.action_type == 'Magic' then
    midcast_magic(spell)
  end
  maintain_reraise_equip()
end

function midcast_magic(spell)
  -- Cures and Buffs
  if spell.skill == 'Healing Magic' or spell.skill == 'Enhancing Magic' then
    eng = spell.english

    -- Cursna Potency
    if eng == "Cursna" then
      equip(sets.midcast.cursna)

    -- Cure Potency
    elseif string.find(eng, 'Cur') then
      equip(sets.midcast.healing)
      if spell.target.type == 'SELF' then
        equip(sets.midcast.healing_self)
        if player.mpp >= 98 then
          equip(sets.midcast.convert)
        end
      end

    -- Enhancing Spells
    elseif spell.skill == 'Enhancing Magic' then
      if eng == 'Stoneskin' then
        equip(sets.midcast.enhancing_stoneskin)

      elseif eng == 'Phalanx' then
        equip(sets.midcast.enhancing_skill)
        equip(sets.midcast.enhancing_phalanx_self)
      else
        equip(sets.midcast.enhancing_duration)
        if string.find(eng, 'Regen') then
          equip(sets.midcast.enhancing_regen)
        elseif eng == 'Refresh' then
          equip(sets.midcast.enhancing_refresh)
          if spell.target.type == 'SELF' then
            equip(sets.midcast.enhancing_refresh_self)
          end
        end
      end
    end

  -- Stuns
  elseif spell.english == 'Stun' then
    equip(sets.midcast.stun)

  -- Drain/Aspir
  elseif string.find(spell.english, 'Drain') or string.find(spell.english, 'Aspir') then
    equip(sets.midcast.drain_aspir)

  elseif spell.skill == 'Dark Magic' then
    equip(sets.midcast.dark)

  -- Enfeebles
  elseif spell.skill == 'Enfeebling Magic' then
    equip(sets.midcast.enfeebling)

  -- Nukes
  elseif spell.skill == 'Elemental Magic' then
    equip(sets.midcast.elemental[NukingMode.current])
    if should_use_spaekonas() then
      equip({ body = "Spaekona's coat +2" })
    end
  end

  if should_use_capacity_mantle() then
    equip({back = "Mecistopins Mantle"})
  end
end

function chat(msg)
  add_to_chat(122, msg)
end

function aftercast(spell)
  if spell.english == 'Convert' then
    send_command('/ma "Cure IV" <me>')
  end
  if player.in_combat then
    equip(sets.aftercast[PrimaryMode.current])
  else
    -- equip(sets.modes[PrimaryMode.current])
  end
  if Capacity.value then
    equip({back = "Mecistopins Mantle"})
  end
end

-- function handle_caster_aftercast()
--   equip(sets.aftercast.Caster)
--   if player.mpp <= 50 then
--     equip({waist = "Fucho-no-Obi"})
--   end
-- end

function status_change(new, old)
  if new == 'Resting' then
    equip(sets.base.resting)
  elseif new == 'Engaged' then
    equip(sets.modes[PrimaryMode.current])
    if DamageDown.current then
      equip(sets.modes.DamageDown)
    end
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
      if mode.description == 'Primary Mode' then
        equip(sets.modes[mode.current])
      elseif mode.description == 'Primary Element' then
        define_aliases()
      end
    end
  elseif command == 'idle' then
    equip(sets.base.idle)
  elseif command == 'run' then
    -- equip_set_for_current_mode()
    equip(sets.base.move_speed)
  -- elseif command == 'exec' then
  --   local fn = _G[commandArgs[2]]
  --   if fn ~= nil then
  --     fn()
  --   end
  elseif command == 'auto_aspir' then
    auto_aspir()
  end
end

function should_use_capacity_mantle()
  -- return true
  if Capacity.value and player.target.hpp ~= nil and player.target.hpp < 50 then
    return true
  else
    return false
  end
end

-- If currently wearing an RR earing, keep it on to avoid reseting the countdown
--
function maintain_reraise_equip()
  if player.equipment.rear == 'Reraise Earring' then
    equip({rear = 'Reraise Earring'})
  end
  if player.equipment.lear == 'Reraise Earring' then
    equip({lear = 'Reraise Earring'})
  end
end

-- Determine which idle set should be worn at this time
--
function equip_set_for_current_mode()
  equip(sets.modes[PrimaryMode.current])
end

function auto_aspir()
  local spell_recasts = windower.ffxi.get_spell_recasts()
  local aspir_1 = spell_recasts[247]
  local aspir_2 = spell_recasts[248]
  local aspir_3 = spell_recasts[881]

  if aspir_3 == 0 then
    send_command('@input /ma "Aspir III" <t>')
  elseif aspir_2 == 0 then
    send_command('@input /ma "Aspir II" <t>')
  elseif aspir_1 == 0 then
    send_command('@input /ma "Aspir" <t>')
  end
end

function should_use_spaekonas()
  if player.mp < 700 then
    return true
  end
  return false
end
