include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'HybridLight', 'HybridHeavy'}
  AutoRefresh = M(false, 'Auto Refresh')
end

function define_binds()
  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  send_command("alias g15v2_m1g2 gs c cycle AutoRefresh")
end

function get_sets()

  define_modes()
  define_binds()
  define_blue_magic()

  gear = {
    rosmerta = {
      mab={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
      tp={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
      ws={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
      fast={ name="Rosmerta's Cape", augments={'MND+20','"Fast Cast"+10',}},
    }
  }

  -- DW Traits:
  -- Delta Thrust + Barbed Crescent
  -- Molting Plumage
  -- Total DW: DW II
  --
  -- DW gear needed to cap with DW II:
  -- Haste DW
  -- 0    59
  -- 10   55
  -- 15   52   (Single Haste or March)
  -- 30   41   (Haste II)
  -- Cap  21   (Double March or Haste + March)
  --
  -- Various gear bonuses:
  -- Adhemar Jacket +1: 6 DW
  -- Suppanomimi:       5 DW
  -- Reiki Yotai:       7 DW
  -- Total:             18 DW

  sets.modes = {}
  sets.modes.Normal = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands=augments.herc.hands.triple,
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,
    neck="Mirage Stole +1",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back=gear.rosmerta.tp
  }
  sets.modes.HybridLight = {
    ammo="Staunch Tathlum +1",         -- 3 DT
    head="Adhemar Bonnet +1",
    body="Ayanmo Corazza +2",          -- 6 PDT
    hands=augments.herc.hands.triple,  -- 2 PDT
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,    -- 2 PDT
    neck="Loricate Torque +1",         -- 6 PDT
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Defending Ring",        -- 10 DT
    right_ring="Epona's Ring",
    back=gear.rosmerta.tp              -- 10 PDT
  }                                    -- 39 PDT
  sets.modes.HybridHeavy = {
    ammo="Staunch Tathlum +1",         -- 3 DT
    head="Adhemar Bonnet +1",
    body="Ayanmo Corazza +2",          -- 6 PDT
    hands=augments.herc.hands.triple,  -- 2 PDT
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,    -- 2 PDT
    neck="Loricate Torque +1",         -- 6 DT
    waist="Flume Belt +1",             -- 4 PDT
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Defending Ring",        -- 10 DT
    right_ring="Gelatinous Ring +1",   -- 7 PDT
    back=gear.rosmerta.tp              -- 10 PDT
  }                                    -- 50 PDT
  sets.Idle = {
    body="Assimilator's Jubbah +3",
    legs="Carmine Cuisses +1",
    -- neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    -- left_ring="Defending Ring",
    -- right_ring="Gelatinous Ring +1",
  }

  sets.AutoRefresh = {
    body="Assimilator's Jubbah +3",
    waist="Fucho-no-Obi",
    -- left_ring="Stikini Ring +1",
    -- right_ring="Stikini Ring +1"
  }

  -- JAs
  sets.JAs = {}

  -- Magic
  sets.Magic = {}
  sets.Magic.FastCast = {
    ammo="Impatiens",             -- 2 Quick
    -- head=augments.herc.head.fc,   -- 12
    head="Carmine Mask",          -- 9
    neck="Orunmila's Torque",     -- 5
    lear="Loquacious earring",    -- 2
    rear="Etiolation Earring",    -- 1
    body="Taeon Tabard",          -- 8
    hands="Leyline Gloves",       -- 7
    left_ring="Kishar Ring",          -- 4
    right_ring="Prolix Ring",          -- 2
    back=gear.rosmerta.fast,      -- 10
    waist="Witful Belt",          -- 3, 3 Quick
    legs="Aya. Cosciales +2",     -- 6
    feet="Carmine Greaves +1"     -- 8
                                  -- 62 FastCast, 6 QuickCast
  }
  sets.Magic.SpellInterrupt = {
    ammo="Staunch Tathlum +1",       -- 11
    head="Aya. Zucchetto +2",        -- PDT
    neck="Loricate Torque +1",       -- DT
    lear="Odnowa Earring +1",        -- MDT/HP
    rear="Magnetic Earring",         -- 8
    body="Ayanmo Corazza +2",        -- PDT
    hands="Rawhide Gloves",          -- 15
    left_ring="Defending Ring",      -- DT
    right_ring="Gelatinous Ring +1", -- PDT
    back=gear.rosmerta.tp,           -- PDT
    waist="Rumination Sash",         -- 10
    legs="Carmine Cuisses +1",       -- 20
    feet=augments.taeon.feet.phalanx -- 9
                                     -- 8 Merit
                                     -- 81 Total
  }

  -- Blue Magic
  sets.BlueMagic = {}
  sets.BlueMagic.Macc = {
    ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back=gear.rosmerta.mab
  }
  sets.BlueMagic.Mab = {
    ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +2",
    body="Amalric Doublet",
    hands="Amalric Gages",
    legs="Amalric Slops",
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Strendu Ring",
    right_ring="Arvina Ringlet +1",
    back=gear.rosmerta.mab
  }
  sets.BlueMagic.Physical = {
    ammo="Falcon Eye",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Caro Necklace",
    waist="Prosilio Belt +1",
    left_ear="Telos Earring",
    right_ear="Dignitary's Earring",
    left_ring="Ilabrat Ring",
    right_ring="Shukuyu Ring",
    back=gear.rosmerta.ws
  }
  sets.BlueMagic.Healing = {
    ammo="Quartz Tathlum +1",        -- MND
    head="Aya. Zucchetto +2",        -- MND/VIT
    body="Vrikodara Jupon",          -- 13%
    hands="Telchine Gloves",         -- 18%
    legs="Psycloth Lappas",          -- 36 MND
    feet="Medium's Sabots",          -- 10%
    neck="Phalaina Locket",          -- 4%
    waist="Luminary Sash",           -- MND
    left_ear="Regal Earring",        -- MND
    right_ear="Mendi. Earring",      -- 5%
    left_ring="Stikini Ring",        -- 5 skill 5 MND
    right_ring="Stikini Ring",       -- 5 skill 5 MND
    back=gear.rosmerta.fast,         -- MND
                             -- Total: +50% Cure Potency
  }
  sets.BlueMagic.HealingSelf = set_combine(sets.BlueMagic.Healing, {
    neck="Phalaina Locket",      -- 4% self
    left_ring='Kunaji Ring',     -- 5% self
    waist="Gishdubar Sash"       -- 10% self
                                 -- Total: 19%
  })
  sets.BlueMagic['White Wind'] = {
    ammo="Falcon Eye",               -- 10 HP
    head="Carmine Mask",             -- 98 HP
    body="Vrikodara Jupon",          -- 13%
    hands="Telchine Gloves",         -- 18%
    legs="Carmine Cuisses +1",       -- 130 HP
    feet="Medium's Sabots",          -- 10%
    neck="Phalaina Locket",          -- 4%  4% self
    waist="Gishdubar Sash",          --     10% self
    left_ear="Odnowa Earring +1",    -- 100 HP
    right_ear="Mendi. Earring",      -- 5%
    -- left_ring="Etana Ring",          -- 60 HP (stored)
    left_ring="Kunaji ring",
    right_ring="Ilabrat Ring",       -- 60 HP
    back="Aenoth. Mantle +1"         -- 120 HP  -- Moonbeam Cape 250 HP
                             -- Total: +50% Cure Potency
  }
  sets.BlueMagic['Battery Charge'] = {
    head="Amalric Coif +1",
    waist="Gishdubar Sash"
  }
  sets.BlueMagic['Tenebral Crush'] = set_combine(sets.BlueMagic.Mab, {
    head="Pixie Hairpin +1",
    right_ring="Archon Ring"
  })
  sets.BlueMagic['Dream Flower'] = {
    ammo="Staunch Tathlum +1",       -- 11
    head="Jhakri Coronal +2",
    neck="Loricate Torque +1",       -- DT
    left_ear="Regal Earring",
    right_ear="Magnetic Earring",    -- 8
    body="Jhakri Robe +2",
    hands="Rawhide Gloves",          -- 15
    left_ring="Defending Ring",      -- DT
    right_ring="Gelatinous Ring +1", -- PDT
    back=gear.rosmerta.mab,
    waist="Rumination Sash",         -- 10
    legs="Carmine Cuisses +1",       -- 20
    feet=augments.taeon.feet.phalanx -- 9
                                     -- 8 Merit
                                     -- 81 Total
  }
  sets.BlueMagic.Diffusion = {
    feet="Luhlaza Charuqs"
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.Melee = {
    ammo="Floestone",
    head=augments.herc.head.wsd,
    neck="Mirage Stole +1",
    left_ear="Ishvara Earring",
    right_ear="Moonshade Earring",
    body="Assimilator's Jubbah +3",
    hands="Jhakri Cuffs +2",
    left_ring="Karieyh Ring +1",
    right_ring="Shukuyu Ring",
    back=gear.rosmerta.ws,
    waist="Fotia Belt",
    legs=augments.herc.legs.ws,
    feet="Jhakri Pigaches +2",
  }
  sets.WS['Requiescat'] = set_combine(sets.WS.Melee, { })
  -- sets.WS['Flat Blade'] = {}
  sets.WS['Chant du Cygne'] = set_combine(sets.WS.Melee, {
    ammo="Yetshila",
    feet="Thereoid Greaves",
    right_ring="Ramuh Ring",
  })
  sets.WS['Shining Blade'] = {}
  sets.WS['Circle Blade'] = {}
  sets.WS['Burning Blade'] = {}
  sets.WS['Sanguine Blade'] = {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    neck="Sanctity Necklace",
    lear="Regal Earring",
    rear="Friomisi earring",
    body="Amalric Doublet",
    hands="Jhakri Cuffs +2",
    lring="Archon Ring",
    rring="Karieyh Ring +1",
    back=gear.rosmerta.mab,
    waist="Eschan Stone",
    legs="Jhakri slops +2",
    feet="Jhakri Pigaches +2",
  }

  -- Spell Learning
  -- sets.learn={
  --   main="Wax Sword",
  --   ammo="Staunch Tathlum +1",
  --   hands="Magus Bazubands",
  --   neck="Loricate Torque +1",
  --   waist="Flume Belt +1",
  --   left_ear="Brutal Earring",
  --   right_ear="Telos Earring",
  --   left_ring="Ayanmo Ring",
  --   right_ring="Defending Ring",
  --   back="Solemnity Cape",
  -- }
end

function precast(spell)
  precast_cancelations(spell)

  if spell.type == 'WeaponSkill' then
    equip(set_for_ws(spell.english))
    -- equip(sets.WS.Melee)
    -- equip(sets.WS[spell.english] or sets.WS.Melee)

  elseif sets.JAs[spell.english] then
    equip(sets.JAs[spell.english])

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.FastCast)
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
  if sets.BlueMagic[spell.english] then
    equip(sets.BlueMagic[spell.english])

  elseif BlueMagic_Macc:contains(spell.english) then
    equip(sets.BlueMagic.Macc)

  elseif BlueMagic_Mab:contains(spell.english) then
    equip(sets.BlueMagic.Mab)

  elseif BlueMagic_Physical:contains(spell.english) then
    equip(sets.BlueMagic.Physical)

  elseif BlueMagic_Healing:contains(spell.english) then
    if spell.target.type == 'SELF' then
      equip(sets.BlueMagic.HealingSelf)
    else
      equip(sets.BlueMagic.Healing)
    end

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.SpellInterrupt)
  end

  if buffactive['Diffusion'] and spell.target.type == 'SELF' then
    equip(sets.BlueMagic.Diffusion)
  end
end

function aftercast(spell)
  equip(set_for_current_mode())
  -- local set = sets.modes[PrimaryMode.current]
  -- if player.in_combat == false then
  --   set = set_combine(set, sets.Idle)
  -- end
  -- if player.mpp <= 66 and AutoRefresh.value then
  --   set = set_combine(set, sets.AutoRefresh)
  -- end
  -- equip(set)
  -- if player.in_combat then
  --   equip(sets.modes[PrimaryMode.current])
  -- else
    -- equip(set_combine(
    --   sets.modes[PrimaryMode.current],
    --   sets.Idle
    -- ))
  -- end
  -- if player.mpp <= 66 and AutoRefresh.value then
  --   equip(sets.AutoRefresh)
  -- end
end

function status_change(new, old)
  equip(set_for_current_mode())
  -- if new == 'Engaged' then
  --   equip(sets.modes[PrimaryMode.current])
  -- else
  --   equip(set_combine(
  --     sets.modes[PrimaryMode.current],
  --     sets.Idle
  --   ))
  -- end
  -- if player.mpp <= 66 and AutoRefresh.value then
  --   equip(sets.AutoRefresh)
  -- end
end

function set_for_ws(named)
  if sets.WS[named] then
    return sets.WS[named]
  else
    return sets.WS.Melee
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

function define_blue_magic()
  BlueMagic_Macc = S{
    'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
    'Thunderbolt','Whirl of Rage',
    '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
    'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
    'Cimicine Discharge','Cold Wave','Digest','Corrosive Ooze','Demoralizing Roar',
    'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
    'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance','Lowing',
    'Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind','Sandspin',
    'Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas','Sub-zero Smash',
    'Triumphant Roar','Venom Shell','Voracious Trunk','Yawn'
  }

  BlueMagic_Mab = S{
    'Acrid Stream','Dark Orb','Droning Whirlwind','Embalming Earth','Evryone. Grudge',
    'Firespit','Foul Waters','Gates of Hades','Leafstorm','Magic Hammer',
    'Regurgitation','Rending Deluge','Tem. Upheaval','Thermal Pulse','Water Bomb','Subduction','Retinal Glare',
    'Searing Tempest','Spectral Floe','Silent Storm','Entomb','Anvil Lightning','Scouring Spate',
    'Blinding Fulgor','Tenebral Crush','Diffusion Ray',
    'Bad Breath','Flying Hip PrePress','Final Sting','Frost Breath','Heat Breath',
    'Magnetite Cloud','Poison Breath','Radiant Breath','Self Destruct','Thunder Breath',
    'Wind Breath'
  }

  BlueMagic_Physical = S{
    'Asuran Claws','Bludgeon','Feather Storm','Mandibular Bite',
    'Queasyshroom','Ram Charge', 'Spinal Cleave','Spiral Spin','Terror Touch',
    'Battle Dance','Bloodrake','Death Scissors','Dimensional Death','Empty Thrash',
    'Heavy Strike','Quadrastrike','Uppercut','Tourbillion','Vertical Cleave',
    'Whirl of Rage', 'Power Attack', 'Smite of Rage', 'Screwdriver',
    'Amorphic Spikes','Barbed Crescent','Claw Cyclone','Disseverment','Foot Kick',
    'Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad','Seedspray',
    'Vanity Dive','Sinker Drill', 'Sickle Slash',
    'Cannonball','Delta Thrust','Glutinous Dart','Grand Slam','Quad. Continuum',
    'Sprout Smack', 'Body Slam',
    'Benthic Typhoon','Helldive','Hydro Shot','Jet Stream','Pinecone Bomb',
    'Wild Oats'
  }

  BlueMagic_Healing = S{
    'Healing Breeze','Plenilune Embrace','Pollen','White Wind',
    'Wild Carrot','Restoral','Magic Fruit'}
end
