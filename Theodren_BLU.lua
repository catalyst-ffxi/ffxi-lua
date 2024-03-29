include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'HybridLight', 'HybridHeavy',
  -- 'Accuracy'
  }
end

function define_aliases()
  -- Modes
  send_command("bind ^f1 gs c cycle PrimaryMode")
end

function get_sets()

  define_modes()
  define_aliases()
  define_blue_magic()

  gear = {
    rosmerta = {
      mab={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
      tp={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
      ws={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
      fast={ name="Rosmerta's Cape", augments={'MND+20','"Fast Cast"+10',}},
    },
    stikini = {
      left = { name="Stikini Ring +1", bag="wardrobe1" },
      right = { name="Stikini Ring +1", bag="wardrobe2" }
    }
  }

  sets.Idle = {
    ammo="Staunch Tathlum +1",         -- 3 DT
    head="Nyame Helm",                 -- 7 DT
    body="Hashishin Mintan +3",        -- 12 DT, Refresh
    hands="Nyame Gauntlets",           -- 7 DT
    legs="Carmine Cuisses +1",         -- Zoomies
    feet="Nyame Sollerets",            -- 7 DT
    neck="Loricate Torque +1",         -- 6 DT
    -- waist="Flume Belt +1",             -- 4 PDT
    waist="Fucho-no-obi",
    left_ear="Sanare Earring",         -- Meva
    right_ear="Odnowa Earring +1",     -- 3 DT
    left_ring=gear.stikini.left,       -- 1 Refresh
    right_ring=gear.stikini.right,     -- 1 Refresh
    back=gear.rosmerta.tp              -- 10 PDT
  }                                    -- 47 PDT

  -- DW Traits:
  -- Delta Thrust + Barbed Crescent = 1
  -- Molting Plumage = 1
  -- Job Points = 2
  -- Total DW: DW IV
  --
  -- DW gear needed to cap with DW IV:
  -- Haste DW
  -- 0    44
  -- 10   40
  -- 15   37   (Single Haste or March)
  -- 30   26   (Haste II)
  -- Cap  6   (Double March or Haste + March)
  --
  -- Various gear bonuses:
  -- Adhemar Jacket +1: 6 DW
  -- Suppanomimi:       5 DW
  -- Reiki Yotai:       7 DW
  -- Total:             18 DW

  sets.modes = {}
  sets.modes.Normal = {
    ammo="Coiste Bodhar",
    head=augments.adhemar.head.pathA,
    body="Gleti's Cuirass",
    hands="Adhemar Wristbands +1",
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,
    neck="Mirage Stole +2",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back=gear.rosmerta.tp
  }
  sets.modes.HybridLight = {
    ammo="Coiste Bodhar",
    head="Malignance Chapeau",      -- 6 DT
    body="Gleti's Cuirass",         -- 9 PDT
    hands="Adhemar Wristbands +1",
    legs="Malignance Tights",       -- 7 DT
    feet=augments.herc.feet.triple, -- 2 PDT
    neck="Mirage Stole +2",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    left_ring="Defending Ring",     -- 10 DT
    right_ring="Epona's Ring",
    back=gear.rosmerta.tp           -- 10 PDT
  }                                 -- 44 PDT
  sets.modes.HybridHeavy = {
    ammo="Coiste Bodhar",
    head="Malignance Chapeau",      -- 6 DT
    body="Gleti's Cuirass",         -- 9 PDT
    hands="Malignance Gloves",      -- 5 DT
    legs="Malignance Tights",       -- 7 DT
    feet="Malignance Boots",        -- 4 DT
    neck="Mirage Stole +2",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Cessance Earring",
    left_ring="Defending Ring",     -- 10 DT
    right_ring="Epona's Ring",
    back=gear.rosmerta.tp           -- 10 PDT
  }                                 -- 51 PDT
  sets.modes.Accuracy = {
    ammo="Coiste Bodhar",
    head="Malignance Chapeau",
    body="Gleti's Cuirass",
    hands="Adhemar Wristbands +1",
    legs="Malignance Tights",
    feet=augments.herc.feet.triple,
    neck="Mirage Stole +2",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Epona's Ring",
    back=gear.rosmerta.tp
  }

  -- Reiki Yotai

  -- JAs
  sets.JAs = {}
  sets.JAs.Provoke = { -- Enmity+ Set
    ammo="Sapience Orb",
    body="Emet Harness +1",
    waist="Kasiri Belt",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Supershear Ring",
    right_ring="Eihwaz Ring",
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.FastCast = {
    ammo="Impatiens",             -- 2 Quick
    head=augments.herc.head.fc,   -- 12
    neck="Orunmila's Torque",     -- 5
    lear="Loquacious earring",    -- 2
    rear="Etiolation Earring",    -- 1
    body="Taeon Tabard",          -- 9
    hands="Leyline Gloves",       -- 7
    left_ring="Kishar Ring",      -- 4
    right_ring="Weatherspoon Ring +1",  -- 2
    back=gear.rosmerta.fast,      -- 10
    waist="Witful Belt",          -- 3, 3 Quick
    legs="Aya. Cosciales +2",     -- 6
    feet="Carmine Greaves +1"     -- 8
                                  -- 65 FastCast, 6 QuickCast
  }
  sets.Magic.BlueFastCast = set_combine(
    sets.Magic.FastCast, { body="Hashishin Mintan +3" }
  )
  sets.Magic.SpellInterrupt = {
    ammo="Staunch Tathlum +1",       -- 11 SIRD 3 DT
    head=augments.taeon.head.SID,    -- 7 SIRD
    body="Nyame Mail",               -- 9 DT
    hands="Nyame Gauntlets",         -- 7 DT
    legs="Carmine Cuisses +1",       -- 20 SIRD
    feet=augments.taeon.feet.phalanx,-- 10 SIRD
    neck="Loricate Torque +1",       -- 6 DT
    waist="Rumination Sash",         -- 10 SIRD
    lear="Odnowa Earring +1",        -- 3 DT
    rear="Magnetic Earring",         -- 8 SIRD
    left_ring="Defending Ring",      -- 10 DT
    right_ring="Gelatinous Ring +1", -- 7 PDT
    back=gear.rosmerta.tp,           -- 10 PDT
  }                                  -- 66 SIRD, 55 PDT

  -- Blue Magic
  sets.BlueMagic = {}
  sets.BlueMagic.Macc = {
    ammo="Pemphredo Tathlum",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashishin Bazubands +3",
    legs="Hashishin Tayt +3",
    feet="Hashishin Basmak +3",
    neck="Mirage Stole +2",
    waist="Luminary Sash",
    -- waist="Acuity Belt +1" todo augment this
    left_ear="Crep. Earring",
    right_ear="Hashi. Earring +1",
    left_ring=gear.stikini.left,
    right_ring=gear.stikini.right,
    back="Aurist's Cape +1"
  }
  sets.BlueMagic.Mab = {
    ammo="Pemphredo Tathlum",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashishin Bazubands +3",
    legs="Hashishin Tayt +3",
    feet="Hashishin Basmak +3",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring +1",
    right_ring=gear.stikini.right,
    back=gear.rosmerta.mab -- INT/MAB/Macc/Mdmg
  }
  sets.BlueMagic.Physical = {
    ammo="Coiste Bodhar",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashishin Bazubands +3",
    legs="Hashishin Tayt +3",
    feet="Hashishin Basmak +3",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Dignitary's Earring",
    left_ring="Ilabrat Ring",
    right_ring="Shukuyu Ring",
    back=gear.rosmerta.ws
  }
  sets.BlueMagic.Healing = {
    -- ammo="Quartz Tathlum +1",        -- MND
    head="Hashishin kavuk +3",      -- MND/VIT
    body="Vrikodara Jupon",          -- 13%
    hands="Telchine Gloves",         -- 18%
    legs="Hashishin Tayt +3",        -- MND/VIT
    feet="Medium's Sabots",          -- 10%
    neck="Phalaina Locket",          -- 4%
    waist="Luminary Sash",           -- MND
    left_ear="Regal Earring",        -- MND
    right_ear="Mendi. Earring",      -- 5%
    left_ring=gear.stikini.left,     -- 11 skill 8 MND
    right_ring=gear.stikini.right,   -- 11 skill 8 MND
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
    -- ammo="Falcon Eye",            -- 10 HP, Stored
    head="Carmine Mask +1",          -- 118 HP
    body="Vrikodara Jupon",          -- 13%
    hands="Telchine Gloves",         -- 18%
    legs="Carmine Cuisses +1",       -- 130 HP
    feet="Medium's Sabots",          -- 10%
    neck="Phalaina Locket",          -- 4%  4% self
    waist="Gishdubar Sash",          --     10% self
    left_ear="Odnowa Earring +1",    -- 100 HP
    right_ear="Mendi. Earring",      -- 5%
    left_ring="Kunaji ring",         --     5% self
    right_ring="Ilabrat Ring",       -- 60 HP
    back=gear.rosmerta.fast
    -- back="Aenoth. Mantle +1"         -- 120 HP  -- Moonbeam Cape 250 HP
                             -- Total: 50% Cure Potency
                             --        19% Self
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
    head="Malignance Chapeau",
    neck="Loricate Torque +1",       -- DT
    -- left_ear="Genmei Earring",
    right_ear="Magnetic Earring",    -- 8
    body="Malignance Tabard",
    hands="Malignance Gloves",
    left_ring="Defending Ring",      -- DT
    right_ring="Gelatinous Ring +1", -- PDT
    back=gear.rosmerta.magic,
    waist="Rumination Sash",         -- 10
    legs="Carmine Cuisses +1",       -- 20
    feet=augments.taeon.feet.phalanx -- 9
                                     -- 8 Merit
                                     -- 81 Total
  }
  sets.BlueMagic.Jettatura = sets.JAs.Provoke
  sets.BlueMagic.Diffusion = {
    feet="Luhlaza Charuqs"
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS['Savage Blade'] = {
    ammo="Coiste Bodhar",
    head="Hashishin Kavuk +3",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Mirage Stole +2",
    waist="Sailfi Belt +1",
    left_ear="Ishvara Earring",
    right_ear="Moonshade Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back=gear.rosmerta.ws
  }
  sets.WS['Expiacion'] = {
    ammo="Coiste Bodhar",
    head="Hashishin Kavuk +3",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Mirage Stole +2",
    waist="Sailfi Belt +1",
    left_ear="Ishvara Earring",
    right_ear="Moonshade Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back=gear.rosmerta.ws
  }
  sets.WS['Requiescat'] = {}
  sets.WS['Chant du Cygne'] = {
    ammo="Yetshila +1",
    head=augments.adhemar.head.pathA,
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Nyame Gauntlets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Mache Earring +1",
    left_ring="Ilabrat Ring",
    right_ring="Epona's Ring",
    back=gear.rosmerta.tp
  }
  sets.WS['Shining Blade'] = {}
  sets.WS['Circle Blade'] = {}
  sets.WS['Burning Blade'] = {}
  sets.WS['Sanguine Blade'] = {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    lear="Regal Earring",
    rear="Friomisi earring",
    lring="Archon Ring",
    rring="Epaminondas's Ring",
    waist="Orpheus's Sash",
    back=gear.rosmerta.magic
  }
  sets.WS['Seraph Blade'] = {
    ammo="Pemphredo Tathlum",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    lear="Regal Earring",
    rear="Friomisi earring",
    lring="Weatherspoon Ring +1",
    rring="Epaminondas's Ring",
    waist="Orpheus's Sash",
    back=gear.rosmerta.magic
  }

  sets.WS['Black Halo'] = sets.WS['Savage Blade']
  sets.WS['Judgment'] = sets.WS['Savage Blade']
end

function precast(spell)
  precast_cancelations(spell)

  if spell.type == 'WeaponSkill' then
    equip(set_for_ws(spell.english))

  elseif sets.JAs[spell.english] then
    equip(sets.JAs[spell.english])

  elseif spell.skill == 'Blue Magic' then
    equip(sets.Magic.BlueFastCast)

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

  elseif spell.skill == 'Enfeebling Magic' then
    equip(sets.BlueMagic.Macc)

  elseif spell.action_type == 'Magic' then
    if buffactive['Diffusion'] and spell.target.type == 'SELF' then
      equip(set_combine(sets.Magic.SpellInterrupt, sets.BlueMagic.Diffusion))
    else
      equip(sets.Magic.SpellInterrupt)
    end
  end
end

function aftercast(spell)
  equip(set_for_current_mode())
end

function status_change(new, old)
  equip(set_for_current_mode())
end

function set_for_current_mode()
  if player.status=='Engaged' then
    return sets.modes[PrimaryMode.current]
  else
    return sets.Idle
  end
end

function set_for_ws(named)
  -- if sets.WS[named] then
    return sets.WS[named]
  -- else
  --   return sets.WS['Savage Blade']
  -- end
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

  if command == 'idle' then
    equip(sets.Idle)
  elseif command == "mode" then
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
    'Thunderbolt','Whirl of Rage', 'Silent Storm', 'Tourbillion', 'Cesspool',
    '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
    'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
    'Cimicine Discharge','Cold Wave','Digest','Corrosive Ooze','Demoralizing Roar',
    'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
    'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance','Lowing',
    'Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind','Sandspin',
    'Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas','Sub-zero Smash',
    'Triumphant Roar','Venom Shell','Voracious Trunk','Yawn', 'Subduction'
  }

  BlueMagic_Mab = S{
    'Acrid Stream','Dark Orb','Droning Whirlwind','Embalming Earth','Evryone. Grudge',
    'Firespit','Foul Waters','Gates of Hades','Leafstorm','Magic Hammer',
    'Regurgitation','Rending Deluge','Tem. Upheaval','Thermal Pulse','Water Bomb','Retinal Glare',
    'Searing Tempest','Spectral Floe','Entomb','Anvil Lightning','Scouring Spate',
    'Blinding Fulgor','Tenebral Crush','Diffusion Ray',
    'Bad Breath','Flying Hip PrePress','Final Sting','Frost Breath','Heat Breath',
    'Magnetite Cloud','Poison Breath','Radiant Breath','Self Destruct','Thunder Breath',
    'Wind Breath'
  }

  BlueMagic_Physical = S{
    'Asuran Claws','Bludgeon','Feather Storm','Mandibular Bite',
    'Queasyshroom','Ram Charge', 'Spinal Cleave','Spiral Spin','Terror Touch',
    'Battle Dance','Bloodrake','Death Scissors','Dimensional Death','Empty Thrash',
    'Heavy Strike','Quadrastrike','Uppercut','Vertical Cleave',
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
