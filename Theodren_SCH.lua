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
    Thunder = 'Thunderstorm II',
    Blizzard = 'Hailstorm II',
    Fire = 'Firestorm II',
    Aero = 'Windstorm II',
    Water = 'Rainstorm II',
    Stone = 'Sandstorm II'
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
  }

  -- Mode Sets
  --
  sets.Idle = {
    main="Maxentius",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head="Befouled Crown",
    neck="Loricate Torque +1",
    left_ear="Genmei Earring",
    right_ear="Etiolation Earring",
    body="Jhakri Robe +2",
    hands="Amalric Gages +1",
    left_ring="Gelatinous Ring +1",
    right_ring="Defending Ring",
    back="Solemnity Cape",
    waist="Fucho-no-Obi",
    legs="Assid. Pants +1",
    feet="Chironic Slippers"
  }

  -- Base Sets
  --
  sets.base = {}

  sets.base.fast_cast = {
    ammo="Sapience Orb",       -- 2
    head="Amalric Coif +1",    -- 11
    neck="Orunmila's Torque",  -- 5
    lear="Loquacious earring", -- 2
    rear="Etiolation earring", -- 1
    body="Vrikodara Jupon",    -- 5
    hands="Helios Gloves",     -- 5
    lring="Kishar Ring",       -- 4
    rring="Rahab Ring",        -- 2
    back="Perimede Cape",
    waist="Embla Sash",        -- 5
    legs="Telchine Braconi",   -- 4
    feet=augments.merlinic.crackows.nuke -- 5
  }


  sets.base.fast_cast = {
    ammo="Sapience Orb",                -- 2
    head="Amalric Coif +1",   -- 11
    neck="Orunmila's Torque",           -- 5
    lear="Loquacious earring",   -- 2
    rear="Magnetic earring",
    body="Amalric Doublet +1",  -- 6
    hands="Helios Gloves",       -- 5
    lring="Kishar Ring",   -- 4
    rring="Rahab Ring",         -- 2
    back="Perimede Cape",
    waist="Embla Sash",
    legs="Lengo Pants", -- 5
    feet=augments.merlinic.crackows.nuke -- 5
  }

  sets.base.quick_cast = {
    ammo = "Impatiens",
    waist = "Witful Belt"             -- 3
                               -- TOTAL: 46
  }
  -- sets.base.move_speed = {
  -- }
  -- sets.base.idle = set_combine(sets.modes.Caster, {
  -- })
  -- sets.base.resting = set_combine(sets.modes.Caster, {
  --   head = "Befouled Crown",
  --   body = "Jhakri Robe +1",
  --   waist = "Fucho-no-Obi",
  --   legs = "Assid. Pants +1"
  -- })

  -- Weapon Skills
  --
  sets.ws = {
    neck = "Fotia Gorget"
  }
  sets.ws.Myrkr = {
    ammo = "Quartz Tathlum +1",
    -- head = "Kaabnax Hat",
    head = "Pixie Hairpin +1",
    neck = "Sanctity Necklace",
    lear = "Etiolation Earring",
    rear = "Moonshade Earring",
    body = "Amalric Doublet +1",
    -- hands = "Otomi Gloves", -- stored
    hands="Helios Gloves",
    -- lring = "Etana Ring", -- stored
    -- rring = "Bifrost Ring",
    left_ring="Supershear Ring",
    right_ring="Rahab Ring",
    back = "Merciful Cape",
    waist = "Luminary Sash",
    legs = "Chironic Hose",
    feet = "Medium's sabots"
  }

  -- MIDCAST
  --

  -- Dark Magic
  --
  sets.midcast = {}
  sets.midcast.dark = {
    -- main = "Akademos",
    -- main=augments.grio.nuke,
    -- sub = "Enki Strap",
    ammo = "Pemphredo Tathlum",
    head = "Amalric Coif +1",
    -- head = "Pixie Hairpin +1",
    neck = "Erra Pendant",
    lear = "Digni. Earring",
    rear = "Regal Earring",
    body = "Amalric Doublet +1",
    hands = "Amalric Gages +1",
    lring = "Stikini Ring +1",
    rring = "Stikini Ring +1",
    back = "Lugh's Cape",
    waist = "Refoccilation Stone",
    legs="Amalric Slops +1",
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
    ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +2",
    neck="Sanctity Necklace",
    lear="Regal Earring",
    rear="Malignance Earring",
    body="Amalric Doublet +1",
    hands="Amalric Gages +1",
    lring="Shiva Ring +1",
    rring="Strendu Ring",
    back="Lugh's Cape",
    waist="Refoccilation Stone",
    legs="Amalric Slops +1",
    feet=augments.merlinic.crackows.nuke
  }
  sets.midcast.elemental.MagicBurst = set_combine(sets.midcast.elemental.Normal, {
    neck = "Mizu. Kubikazari",           -- MB +10
    hands = "Amalric Gages +1",          -- MB II +6
    lring = "Mujin Band",                -- MB II +5
    rring = "Locus Ring",                -- MB +5
    feet = "Jhakri Pigaches +2"          -- MB +7
  })                                     -- TOTALS
                                         -- MB +27 (Caps at 40%)
                                         -- MB II +11

  -- Enfeebling Magic
  --
  sets.midcast.enfeebling = {
    ammo = "Quartz Tathlum +1",
    head = "Amalric Coif +1",
    neck = "Incanter's torque",
    lear = "Digni. Earring",
    rear = "Regal Earring",
    body = "Vanya Robe",
    hands = "Jhakri Cuffs +2",
    lring = "Stikini Ring +1",
    rring = "Stikini Ring +1",
    back = "Lugh's Cape",
    waist = "Luminary Sash",
    legs="Amalric Slops +1",
    feet = "Medium's Sabots"
  }

  -- Enhancing Magic
  --
  sets.midcast.enhancing_skill = {
  }
  sets.midcast.enhancing_duration = {
    -- main="Oranyan",
    main="Maxentius",
    sub="Ammurapi Shield",
    head="Telchine Cap",
    body="Telchine Chasuble",
    hands="Telchine Gloves",
    legs="Telchine Braconi",
    feet="Telchine Pigaches",
    waist="Embla Sash",
    back="Lugh's Cape",
  }
  sets.midcast.enhancing_regen = {
    back="Lugh's Cape",
  }
  sets.midcast.enhancing_refresh = {
    head = "Amalric Coif +1"
  }
  sets.midcast.enhancing_refresh_self = {
    waist = "Gishdubar sash",
    -- feet = "Inspirited Boots"
  }
  sets.midcast.enhancing_stoneskin = {
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
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Quartz Tathlum +1",
    head="Vanya Hood",
    body="Vanya Robe",
    hands="Telchine Gloves",
    legs="Vanya Slops",
    feet="Vanya Clogs",
    neck="Incanter's Torque",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Mendi. Earring",
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    back="Solemnity Cape"       -- 7%
  }
  sets.midcast.healing_self = {
    neck="Phalaina Locket",      -- 4% self
    left_ring='Kunaji Ring',     -- 5% self
    waist="Gishdubar Sash"       -- 10% self
  }
  sets.midcast.convert = set_combine(sets.midcast.healing, sets.midcast.healing_self, {
  })
  -- Cursna chance to clear doom affected by Healing Magic and Cursna Effect+ gear
  sets.midcast.cursna = {
    ammo="Sapience Orb",
    head="Vanya Hood",
    body="Vanya Robe",
    hands="Kaykaus Cuffs +1",
    legs="Vanya Slops",
    feet="Vanya Clogs",
    neck="Malison Medallion",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    back="Oretan. Cape +1",
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
  if not (spell.skill == 'Elemental Magic' and NukingMode.current == 'MagicBurst') then
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
      elseif spell_affected_by_skill(eng) then
        equip(sets.midcast.enhancing_skill)
        if eng == 'Phalanx' then
          equip(sets.midcast.enhancing_phalanx_self)
        end
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
      if buffactive['Perpetuance'] then
        equip({ hands = "Arbatel Bracers +1" })
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
  end

  if should_use_capacity_mantle() then
    equip({back = "Mecistopins Mantle"})
  end
end

function chat(msg)
  add_to_chat(122, msg)
end

function aftercast(spell)
  -- if player.in_combat then
  --   equip(sets.aftercast[PrimaryMode.current])
  -- end

  equip(sets.Idle)

  if spell.english == "Sublimation" then
    if buffactive['Sublimation: Activated'] or buffactive['Sublimation: Complete'] then
      send_command('@wait 30; input /echo | ****** Sublimation Ready! ****** |')
    end
  end
end

function status_change(new, old)
  if new == 'Resting' then
    equip(sets.Idle)
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
    equip(sets.Idle)
  elseif command == 'idle' then
    equip(sets.Idle)
  elseif command == 'run' then
    equip(sets.Idle)
  elseif command == 'auto_aspir' then
    auto_aspir()

  elseif command == 'Liquefaction' then send_command('input /p Opening - Liquefaction [Fire] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Stone" <t>;wait 5.3;input /p Closing - Liquefaction [Fire] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Fire" <t>;')
  elseif command == 'Impaction' then send_command('input /p Opening - Impaction [Thunder] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Water" <t>;wait 5.3;input /p Closing - Impaction [Thunder] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Thunder II" <t>;')
  elseif command == 'Detonation' then send_command('input /p Opening - Detonation [Wind] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Stone" <t>;wait 5.3;input /p Closing - Detonation [Wind] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Aero" <t>;')
  elseif command == 'Scission' then send_command('input /p Opening - Scission [Earth] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Fire" <t>;wait 5.3;input /p Closing - Scission [Earth] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Stone" <t>;')
  elseif command == 'Reverberation' then send_command('input /p Opening - Reverberation [Water] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Stone" <t>;wait 5.3;input /p Closing - Reverberation [Water] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Water" <t>;')
  elseif command == 'Induration' then send_command('input /p Opening - Induration [Ice] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Water" <t>;wait 5.3;input /p Closing - Induration [Ice] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Blizzard" <t>;')
  elseif command == 'Transfixion' then send_command('input /p Opening - Transfixion [Light] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Noctohelix" <t>;wait 5.3;input /p Closing - Transfixion [Light] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Luminohelix" <t>;')
  elseif command == 'Compression' then send_command('input /p Opening - Compression [Dark] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Blizzard" <t>;wait 5.3;input /p Closing - Compression [Dark] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Noctohelix" <t>;')
  elseif command == 'Fusion' then send_command('input /p Opening - Fusion [Fire/Light] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Fire" <t>;wait 4.8;input /p Closing - Fusion [Fire/Light] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Thunder" <t>;')
  elseif command == 'Fragmentation' then send_command('input /p Opening - Fragmentation [Wind/Thunder] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Blizzard" <t>;wait 5.3;input /p Closing - Fragmentation [Wind/Thunder] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Water" <t>;')
  elseif command == 'Gravitation' then send_command('input /p Opening - Gravitation [Earth/Dark] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Aero" <t>;wait 5.3;input /p Closing - Gravitation [Earth/Dark] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Noctohelix" <t>;')
  elseif command == 'Distortion' then send_command('input /p Opening - Distortion [Water/Ice] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Luminohelix" <t>;wait 5.3;input /p Closing - Distortion [Water/Ice] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Stone" <t>;')
  elseif command == 'Tfusion' then send_command('input /p Opening - Liquefaction [Fire] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Stone" <t>;wait 5.3;input /p Closing - Liquefaction [Fire] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Fire" <t>;wait 4.8;input /p Closing - Fusion [Fire/Light] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Thunder" <t>;')

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

function array_contains(arr, value)
  for k, v in pairs(arr) do
    if value == v then
      return true
    end
  end
  return false
end

-- Return true for enhancing spells that are skill based
--
function spell_affected_by_skill(spell_name)
  local spells = {
    'Stoneskin', 'Phalanx'
  }
  return array_contains(spells, spell_name)
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
  -- equip(sets.modes[PrimaryMode.current])
  equip(sets.Idle)
end

function auto_aspir()
  local spell_recasts = windower.ffxi.get_spell_recasts()
  local aspir_1 = spell_recasts[247]
  local aspir_2 = spell_recasts[248]

  if aspir_2 == 0 then
    send_command('@input /ma "Aspir II" <t>')
  elseif aspir_1 == 0 then
    send_command('@input /ma "Aspir" <t>')
  end
end
