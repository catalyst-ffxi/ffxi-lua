include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'Hybrid'}
  Capacity = M(false, 'Capacity Mantle')
end

function define_binds()
  -- windower.send_command('lua reload autora')

  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  send_command("alias g15v2_m1g2 gs c cycle Capacity")
--   send_command("alias g15v2_m1g3 gs c cycle Luzaf")
--   send_command("alias g15v2_m1g4 gs c weapon")
end

function get_sets()

  define_modes()
  define_binds()
  define_blue_magic()

  gear = {
    -- TODO
    rosmerta = {
      mab = "Cornflower Cape",
      tp = "Rosmerta's Cape",
      ws = "Rosmerta's Cape"
    }
  }

  sets.modes = {}
  sets.modes.Normal = {}
  sets.modes.Normal.Engaged = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands=augments.herc.hands.triple,
    legs="Carmine Cuisses +1",
    feet=augments.herc.feet.triple,
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Ilabrat Ring",
    right_ring="Epona's Ring",
    back=gear.rosmerta.tp
  }
  sets.modes.Normal.Idle = set_combine(sets.modes.Normal.Engaged, {
    head=augments.herc.head.pdt,
    neck="Loricate Torque +1",
    legs="Carmine Cuisses +1",
    rring="Defending Ring",
  })

  sets.DamageDown = {
    ammo="Staunch Tathlum +1",
    head="Aya. Zucchetto +2",
    neck="Loricate Torque +1",
    body="Ayanmo Corazza +2",
    hands=augments.herc.hands.triple,
    left_ear="Etiolation Earring",
    lring="Ayanmo Ring",
    rring="Defending Ring",
    waist="Flume Belt +1",
    back="Solemnity Cape"
  }

  sets.modes.Hybrid = {}
  sets.modes.Hybrid.Engaged = set_combine(
    sets.modes.Normal.Engaged, 
    sets.DamageDown
  )
  sets.modes.Hybrid.Idle = set_combine(
    sets.modes.Normal.Idle, 
    sets.DamageDown
  )

  -- Magic
  sets.Magic = {}
  sets.Magic.FastCast = {
    ammo="Impatiens",             -- SID 2%, 2 Quick
    head=augments.herc.head.fc,   -- 12
    neck="Loricate Torque +1",
    lear="Loquacious earring",    -- 2
    rear="Magnetic earring",      -- SID 8%
    body="Amalric Doublet",       -- 3
    hands="Leyline Gloves",       -- 7
    lring="Kishar Ring",          -- 4
    rring="Defending Ring",
    back="Perimede Cape",         -- 4 Quick
    waist="Witful Belt",          -- 3, 3 Quick
    legs="Carmine Cuisses +1",    -- SID 20%
    feet="Carmine Greaves +1"     -- 8
                           -- Total: 39 FC, 9 Q, 30% SID
  }

  -- Blue Magic
  ---- Categories
  sets.BlueMagic = {}
  sets.BlueMagic.PhysicalBlueMagic = {
    ammo="Falcon Eye",
    head= "Jhakri Coronal +2",
    body= "Jhakri Robe +2",
    hands= "Jhakri Cuffs +2",
    legs="Jhakri slops +2",
    feet= "Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    waist="Grunfeld Rope",
    left_ear="Telos Earring",
    right_ear="Dignitary's Earring",
    left_ring="Ilabrat Ring",
    right_ring="Rajas Ring",
    back=gear.rosmerta.ws
  }
  sets.BlueMagic.PhysicalBlueMagic_STR = set_combine(sets.BlueMagic.PhysicalBlueMagic, {
    neck = "Caro Necklace",
    waist = "Prosilio Belt +1",
    left_ring = "Rajas Ring",
    right_ring = "Ifrit Ring"
  })
  sets.BlueMagic.PhysicalBlueMagic_DEX = set_combine(sets.BlueMagic.PhysicalBlueMagic, {
    neck = "Caro Necklace",
    right_ring = "Ramuh Ring"
  })
  sets.BlueMagic.PhysicalBlueMagic_VIT = set_combine(sets.BlueMagic.PhysicalBlueMagic, {})
  sets.BlueMagic.PhysicalBlueMagic_AGI = set_combine(sets.BlueMagic.PhysicalBlueMagic, {
    waist = "Svelt. Gouriz +1"
  })
  sets.BlueMagic.MagicalBlueMagic = {
    ammo="Ombre Tathlum +1",
    head="Jhakri Coronal +2",
    body="Amalric Doublet",
    hands="Amalric Gages",
    legs="Amalric Slops",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Strendu Ring",
    right_ring="Acumen Ring",
    back=gear.rosmerta.mab
  }
  sets.BlueMagic.BlueMagic_Accuracy = set_combine(sets.BlueMagic.MagicalBlueMagic, {})
  sets.BlueMagic.BlueMagic_Breath = set_combine(sets.BlueMagic.MagicalBlueMagic, {})
  sets.BlueMagic.BlueMagic_Buff = {}
  sets.BlueMagic.BlueMagic_Diffusion = {
    feet = "Luhlaza Charuqs"
  }
  sets.BlueMagic.BlueMagic_Healing = {
    ammo="Quartz Tathlum +1",        -- MND
    head="Aya. Zucchetto +2",        -- MND/VIT
    body="Ayanmo Corazza +2",        -- MND/VIT
    hands="Telchine Gloves",         -- 18%
    legs="Carmine Cuisses +1",       -- 18 skill
    feet="Medium's Sabots",          -- 7%
    neck="Phalaina Locket",          -- 4%
    waist="Penitent's Rope",         -- MND
    left_ear="Regal Earring",        -- MND
    right_ear="Mendi. Earring",      -- 5%
    left_ring="Ephedra Ring",        -- 7 skill
    right_ring="Ephedra Ring",       -- 7 skill
    back="Solemnity Cape",           -- 10%
                             -- Total: +44% Cure Potency
  }
  sets.BlueMagic.BlueMagic_Healing_Self = {
    neck = "Phalaina Locket",  -- 4% self
    -- hands = 'Buremte Gloves',  -- 13% self
    lring = 'Kunaji Ring',     -- 5% self
    rring = 'Asklepian Ring',  -- 3% self
    waist = "Gishdubar Sash"   -- 10% self
                        -- Total: 22% Self Cure Potency
  }
  sets.BlueMagic.BlueMagic_Stun = set_combine(sets.BlueMagic.BlueMagic_Accuracy, {})
  sets.BlueMagic.BlueMagic_Unbridled = {}

  ---- Spell specific sets
  sets.BlueMagic['Battery Charge'] = {
    head = "Amalric Coif",
    waist = "Gishdubar Sash"
  }
  sets.BlueMagic['Tenebral Crush'] = {
    head = "Pixie Hairpin +1",
    right_ring = "Archon Ring"
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.Melee = {
    head=augments.herc.head.wsd,
    neck="Fotia Gorget",
    left_ear="Ishvara Earring",
    right_ear="Moonshade Earring",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    left_ring="Karieyh Ring +1",
    right_ring="Shukuyu Ring",
    back=gear.rosmerta.ws,
    waist="Fotia Belt",
    legs=augments.herc.legs.ws,
    feet="Jhakri Pigaches +1",
  }

  -- WS Specific
  sets.WS['Requiescat'] = sets.WS.Melee
  sets.WS['Savage Blade'] = set_combine(sets.WS.Melee, {
    waist="Prosilio Belt +1"
  })
  sets.WS['Chant du Cygne'] = set_combine(sets.WS.Melee, {
    ammo="Yetshila",
    feet="Thereoid Greaves",
    right_ring="Ramuh Ring",
  })

  -- Job Abilities
  --
  sets.JAs = {}
  sets.JAs.Waltz = { lring = 'Asklepian Ring' }

  sets.learn={
    main="Wax Sword",
    ammo="Staunch Tathlum +1",
    hands="Magus Bazubands",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Ayanmo Ring",
    right_ring="Defending Ring",
    back="Solemnity Cape",
}
end

function precast(spell)
  precast_cancelations(spell)

  if sets.JAs[spell.english] then
    equip(sets.JAs[spell.english])

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.FastCast)

  elseif spell.type == 'WeaponSkill' then
    equip(set_for_ws(spell.english))

    -- Equip moonshade if TP is not capped
    if player.tp < 2900 then
      equip({ right_ear = "Moonshade Earring" })
    end
  end
end

function precast_cancelations(spell)
  if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
    send_command('@wait 0.4; cancel 66; cancel 444; cancel 445')
  elseif spell.english == 'Spectral Jig' then
    cast_delay(0.25)
    send_command('@cancel 71;')
  end
end

function midcast(spell)
  -- Blue Magic
  if spell.skill == 'Blue Magic' then
    for key, spells in pairs(BlueMagic) do
      if spells:contains(spell.english) then
        equip(sets.BlueMagic[key])
        if spell.target.type == 'SELF' then
          equip(sets.BlueMagic[key .. '_Self'])
        end
        break
      end
    end
    equip(sets.BlueMagic[spell.english])
  end
end

function aftercast(spell)
  if player.in_combat then
    if player.status == 'Engaged' then
      equip(sets.modes[PrimaryMode.current].Engaged)
    else
      equip(sets.modes[PrimaryMode.current].Idle)
    end
  end
end

function status_change(new, old)
  if new == 'Engaged' then
    equip(sets.modes[PrimaryMode.current].Engaged)
  else
    -- equip(sets.modes[PrimaryMode.current].Idle)
  end
  if Capacity.value then
    equip(sets.CapacityMantle)
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
    equip(sets.modes[PrimaryMode.current].Idle)
  elseif command == "mode" then
    equip(sets.modes[PrimaryMode.current].Engaged)
  elseif command == 'weapon' then
    Weapons:cycle()
    add_to_chat(122, 'SET [Weapon] to ' .. Weapons.current)
    equip({ ranged = gear.weapons[Weapons.current] })
  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
    end
    equip(sets.modes[PrimaryMode.current].Engaged)
  end
end

function set_for_ws(named)
  if sets.WS[named] then
    return sets.WS[named]
  else
    return sets.WS.Melee
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

function define_blue_magic()
  BlueMagic = {
    PhysicalBlueMagic = S{
      'Asuran Claws','Bludgeon','Feather Storm','Mandibular Bite',
      'Queasyshroom','Ram Charge', 'Spinal Cleave','Spiral Spin','Terror Touch'},

    PhysicalBlueMagic_STR = S{
      'Battle Dance','Bloodrake','Death Scissors','Dimensional Death','Empty Thrash',
      'Heavy Strike','Quadrastrike','Uppercut','Tourbillion','Vertical Cleave',
      'Whirl of Rage', 'Power Attack', 'Smite of Rage', 'Screwdriver'},

    PhysicalBlueMagic_DEX = S{
      'Amorphic Spikes','Barbed Crescent','Claw Cyclone','Disseverment','Foot Kick',
      'Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad','Seedspray',
      'Vanity Dive','Sinker Drill', 'Sickle Slash'},

    PhysicalBlueMagic_VIT = S{
      'Cannonball','Delta Thrust','Glutinous Dart','Grand Slam','Quad. Continuum',
      'Sprout Smack', 'Body Slam'},

    PhysicalBlueMagic_AGI = S{
      'Benthic Typhoon','Helldive','Hydro Shot','Jet Stream','Pinecone Bomb',
      'Wild Oats'},

    MagicalBlueMagic = S{
      'Acrid Stream','Dark Orb','Droning Whirlwind','Embalming Earth','Evryone. Grudge',
      'Firespit','Foul Waters','Gates of Hades','Leafstorm','Magic Hammer',
      'Regurgitation','Rending Deluge','Tem. Upheaval','Thermal Pulse','Water Bomb','Subduction','Retinal Glare',
      'Searing Tempest','Spectral Floe','Silent Storm','Entomb','Anvil Lightning','Scouring Spate',
      'Blinding Fulgor','Tenebral Crush','Diffusion Ray',},

    BlueMagic_Accuracy = S{
      '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
      'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
      'Cimicine Discharge','Cold Wave','Digest','Corrosive Ooze','Demoralizing Roar',
      'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
      'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance','Lowing',
      'Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind','Sandspin',
      'Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas','Sub-zero Smash',
      'Triumphant Roar','Venom Shell','Voracious Trunk','Yawn'},

    BlueMagic_Breath = S{
      'Bad Breath','Flying Hip PrePress','Final Sting','Frost Breath','Heat Breath',
      'Magnetite Cloud','Poison Breath','Radiant Breath','Self Destruct','Thunder Breath',
      'Wind Breath'},

    BlueMagic_Buff = S{
      'Carcharian Verve','Diamondhide','Metallic Body','Magic Barrier',
      'Orcish Counterstance','Plasma Charge',
      'Pyric Bulwark','Reactor Cool'},

    BlueMagic_Diffusion = S{
      'Amplification','Cocoon','Exuviation','Feather Barrier','Harden Shell','Memento Mori',
      'Metallic Body','Plasma Charge','Reactor Cool','Refueling','Saline Coat','Warm-Up',
      'Zephyr Mantle','Battery Charge','Erratic Flutter','Barrier Tusk','Mighty Guard','Occultation','Carcharian Verve'},

    BlueMagic_Healing = S{
      'Healing Breeze','Plenilune Embrace','Pollen','White Wind',
      'Wild Carrot','Restoral','Magic Fruit'},

    BlueMagic_Stun = S{
      'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
      'Thunderbolt','Whirl of Rage'},

    BlueMagic_Unbridled = S{
      'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
      'Droning Whirlwind','Gates of Hades','Harden Shell','Pyric Bulwark','Thunderbolt',
      'Tourbillion','Mighty Guard'}
  }
end
