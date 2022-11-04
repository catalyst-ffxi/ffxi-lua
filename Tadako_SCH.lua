include('Modes.lua')
include('augments_tadako.lua')

function define_modes()
  SCRunning = false
end

function define_aliases()
  -- Self Buffs
  send_command('bind !f5 stoneskin')
  send_command('bind !f6 phalanx')
  send_command('bind !f7 blink')
  send_command('bind !f8 aquaveil')
end

function get_sets()
  -- send_command('lua load setlist')
  -- send_command('lua load dressup')
  define_modes()
  define_aliases()

  gear = {
  }

  -- Modes
  sets.Idle = {
    ammo="Kalboron Stone",
    main="Bolelabunga",
    sub="Genbu's Shield",
    head="Acad. Mortar. +1",
    hands="Nyame Gauntlets",
    body="Jhakri Robe +2",
    legs="Assiduity Pants",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Flashward Earring",
    right_ear="Etiolation Earring",
    left_ring="Gelatinous Ring +1",
    right_ring="Purity Ring",
    back="Solemnity Cape"
  }
  sets.Engaged = {

  }

  -- Magic
  sets.Magic = {}
  sets.Magic.Precast = {
    ammo="Sapience Orb",                      -- 2 FC
    head="Merlinic Hood",                     -- 8 FC
    body="Shango Robe",                       -- 8 FC
    hands=augments.telchine.gloves.enhancing, -- 4 FC
    legs="Kaykaus Tights",                    -- 6 FC
    feet="Merlinic Crackows",                 -- 5 FC
    neck="Orunmila's torque",                 -- 5 FC
    waist="Witful Belt",                      -- 3 FC
    left_ear="Loquacious earring",            -- 2 FC
    right_ear="Etiolation Earring",           -- 1 FC
    left_ring="Weatherspoon Ring",            -- 5 FC
    right_ring="Kishar Ring",                 -- 4 FC
    back="Lugh's Cape",                       -- 10 FC
  }                                           -- 63 FC
  sets.Magic.Healing = {
    main="Gada",                     -- 18
    head="Kaykaus Mitra",            -- 10
    neck="Incanter's Torque",
    left_ear="Novia Earring",
    right_ear="Regal Earring",
    body="Vanya Robe",               -- 7
    hands="Kaykaus Cuffs",           -- 10
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    back="Lugh's Cape", -- todo: augment
    waist="Pythia Sash",
    legs="Kaykaus Tights",           -- 10
    feet="Vanya Clogs"               -- 5
  }                                  -- 60 (over capped)
  sets.Magic.HealingPrecast = {
    right_ear="Mendicant's Earring",
  }
  sets.Magic.HealingSelf = {
    waist="Chuq'aba belt"
  }
  sets.Magic.Cursna = {
    head="Kaykaus Mitra",                    -- Cursna/Skill
    neck="Malison Medallion",                -- Cursna
    left_ear="Loquacious earring",           -- FC
    right_ear="Etiolation Earring",          -- FC
    body="Inyanga Jubbah +2",                -- FC
    hands=augments.telchine.gloves.enhancing,-- FC
    left_ring="Haoma's Ring",                -- Cursna/Skill
    right_ring="Haoma's Ring",               -- Cursna/Skill
    back="Oretan. Cape +1",                  -- Cursna
    waist="Witful Belt",                     -- FC
    legs="Kaykaus Tights",                   -- FC
    feet="Vanya Clogs"                       -- Cursna/Skill
  }
  sets.Magic.Enhancing = {
    main="Gada",
    head=augments.telchine.head.enhancing,
    hands=augments.telchine.gloves.enhancing,
    body=augments.telchine.body.enhancing,
    legs=augments.telchine.legs.enhancing,
    feet=augments.telchine.feet.enhancing,
    waist="Embla Sash",
    back="Lugh's Cape"
  }
  sets.Magic.Enfeebling = {}

  -- Abilities
  sets.JobAbility = {}
  sets.JobAbility['Tabula Rasa'] = { legs="Pedagogy pants" }
  sets.WeaponSkill = {}
end

function precast(spell)
  if spell.type == 'JobAbility' then
    equip(sets.JobAbility[spell.english])

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.Precast)
    if string.find(spell.english, 'Cure') or string.find(spell.english, 'Curaga') then
      equip(sets.Magic.HealingPrecast)
    end

  elseif spell.type == 'WeaponSkill' then
    equip(sets.WeaponSkill)
    equip(sets.WeaponSkill[spell.english])
  end

  precast_cancelations(spell)
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
  eng = spell.english

  -- Cures
  if spell.skill == 'Healing Magic' then
    if eng == "Cursna" then
      equip(sets.Magic.Cursna)

    elseif string.find(eng, 'Cure') or string.find(eng, 'Curaga') then
      equip(sets.Magic.Healing)
      if spell.target.type == 'SELF' then
        equip(sets.Magic.HealingSelf)
      end
    end

  -- Buffs
  elseif spell.skill == 'Enhancing Magic' then
    equip(sets.Magic.Enhancing)

    if eng == 'Stoneskin' then
      equip(sets.Magic.EnhancingStoneskin)

    elseif eng == 'Phalanx' then
      equip(sets.Magic.EnhancingPhalanx)

    -- elseif string.find(eng, 'Regen') then
    --   equip(sets.Magic.EnhancingRegen)

    elseif eng == 'Refresh' then
      equip(sets.Magic.EnhancingRefresh)
      if spell.target.type == 'SELF' then
        equip(sets.Magic.EnhancingRefreshSelf)
      end
    end

    if buffactive['Perpetuance'] then
      equip({ hands = "Arbatel Bracers +2" })
    end

  -- Enfeebles
  elseif spell.skill == 'Enfeebling Magic' then
    equip(sets.Magic.Enfeebling)
  end
end

function aftercast(spell)
  equip(sets.Idle)
end

function status_change(new, old)
  if new == 'Resting' then
    equip(sets.Resting)
  elseif new == 'Engaged' then
    equip(sets.Engaged)
  else
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
    if player.status=='Engaged' then
      equip(sets.Engaged)
    else
      equip(sets.Idle)
    end
  elseif command == 'cycle' then
    -- local mode = _G[commandArgs[2]]
    -- if mode ~= nil and mode._class == 'mode' then
    --   mode:cycle()
    --   add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
    -- end
    equip(sets.Idle)
  elseif command == 'idle' then
    equip(sets.Idle)
  elseif command == 'run' then
    equip(sets.MoveSpeed)
  elseif command == 'dummy' then
    play_dummy()
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
  -- elseif command == 'Tfusion' then send_command('input /p Opening - Liquefaction [Fire] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Stone" <t>;wait 5.3;input /p Closing - Liquefaction [Fire] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Fire" <t>;wait 4.8;input /p Closing - Fusion [Fire/Light] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Thunder" <t>;')
  elseif command == 'Tfusion' then perform_tfusion()
  -- elseif command == 'Tfusion' then perform_skillchain('Fusion', {'Stone', 'Fire', 'Thunder'})
  end
end

function perform_tfusion()
  if SCRunning then
    send_command('input /echo SC Running - Wait and try again!')
    return
  end

  if not buffactive['Dark Arts'] then
    send_command('input /ja "Dark Arts" <me>')
    send_command('input /echo Dark Arts wasnt up - Try again!')
    return
  end

  SCRunning = true
  send_command('input /p Opening - Liquefaction [Fire] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Stone" <t>;wait 5.3;input /p Closing - Liquefaction [Fire] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Fire" <t>;wait 4.8;input /p Closing - Fusion [Fire/Light] ;wait 0.3;input /ja "Immanence" <me>;wait 1.2;input /ma "Thunder" <t>;')

  coroutine.schedule(function()
    send_command('input /t Theodren Done -- Ready for next!')
    SCRunning = false
  end, 22)
end

-- function three_step_fusion()
--   if SCRunning then
--     send_command('input /echo SC Running - Wait and try again!')
--     return
--   end
--   SCRunning = true

--   local ja_delay = 1.2
--   local ma_delay = 5.0

--   send_command('input /ja "Immanence" <me>')

--   coroutine.schedule(function()
--     send_command('input /ma "Stone" <t>')
--   end, ja_delay)

--   coroutine.schedule(function()
--     send_command('input /ja "Immanence" <me>')
--   end, ja_delay + ma_delay)

--   coroutine.schedule(function()
--     send_command('input /ma "Fire" <t>')
--   end, ja_delay * 2 + ma_delay)

--   coroutine.schedule(function()
--     send_command('input /ja "Immanence" <me>')
--   end, ja_delay * 2 + ma_delay * 2)

--   coroutine.schedule(function()
--     send_command('input /ma "Thunder" <t>')
--     SCRunning = false
--   end, ja_delay * 3 + ma_delay * 2)
-- end

function perform_skillchain(name, spells)
  local ja_delay = 1.2
  local ma_delay = 5.0

  if SCRunning then
    send_command('input /echo SC Running - Wait and try again!')
    return
  end

  if not buffactive['Dark Arts'] then
    send_command('input /ja "Dark Arts" <me>')
    coroutine.sleep(ja_delay)
  end

  SCRunning = true

  for index, spell in ipairs(spells) do
    send_command('input /echo Skillchain ['..name..'] Spell #'..index..' <t>')
    send_command('input /ja "Immanence" <me>')
    coroutine.sleep(ja_delay)

    send_command('input /ma "'..spell..'" <t>')
    coroutine.sleep(ma_delay)
  end

  SCRunning = false
  send_command('input /echo Skillchain Complete!')
end
