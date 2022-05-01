include('Modes.lua')

function define_modes()
  Capacity = M(false, 'Capacity Mantle')

  Abyssea = {
    current = 0,
    weapons = {
      -- { name="Pluto's Staff", ws="Earth Crusher=Earth, Sunburst=Light" },
      -- { name="Wax Sword", ws="Red Lotus Blade=Fire, Seraph Blade=Light" },
      -- { name="Ash Club", ws="Seraph Strike=Light" },
      { name="Uchigatana", ws="Tachi Jinpu=Wind, Koki=Light" },
      -- { name="Bronze Dagger", ws="Cyclone=Wind, Energy Drain=Dark" },
      { name="Kunai", ws="Blade: Ei=Dark" },
      -- { name="Lost Sickle", ws="Shadow of Death=Dark" },
      -- { name="Lament", ws="Freezebite=Ice" },
      -- { name="Tzee Xicu's Blade", ws="Raiden Thrust=Thunder"}
    }
  }
end

function define_aliases()
  -- Self Buffs
  send_command('bind !f5 stoneskin')
  send_command('bind !f6 phalanx')
  send_command('bind !f7 blink')
  send_command('bind !f8 aquaveil')
  send_command("bind ^f5")
  send_command("bind ^f6 gs c abbyweapon")
end

function get_sets()
  define_modes()
  define_aliases()

  gear = {}

  -- Modes
  sets.Idle = {
    ammo="Jukukik Feather",
    head="Skormoth Mask",
    body="Adhemar Jacket",
    hands=augments.herc.hands.tp,
    legs="Samnuha Tights",
    feet=augments.herc.feet.tp,
    neck="Sanctity Necklace",
    waist="Sailfi Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Hetairoi Ring",
    right_ring="Petrov Ring",
    back="Solemnity Cape",
  }
  sets.Engaged = {
    ammo="Jukukik Feather",
    head="Skormoth Mask",
    body="Adhemar Jacket",
    hands=augments.herc.hands.tp,
    legs="Samnuha Tights",
    feet=augments.herc.feet.tp,
    neck="Sanctity Necklace",
    waist="Sailfi Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Hetairoi Ring",
    right_ring="Petrov Ring",
    back="Solemnity Cape",
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.Precast = {
    left_ring = "Weatherspoon Ring +1",
    right_ring = "Kishar Ring",
    waist = "Witful Belt"
  }
  sets.Magic.Healing = {
  }
  sets.Magic.HealingSelf = {

  }
  sets.Magic.Enhancing = {

  }
  sets.Magic.Enfeebling = {

  }

  -- Abilities
  sets.JobAbility = {}

  -- Melee
  sets.WeaponSkill = {
    ammo="Jukukik Feather",
    head="Mummu Bonnet",
    body="Adhemar Jacket",
    hands="Mummu Wrists",
    legs="Mummu Kecks",
    feet="Mummu Gamash. +1",
    neck="Sanctity Necklace",
    waist="Windbuffet Belt",
    left_ear="Etiolation Earring",
    right_ear="Brutal Earring",
    left_ring="Mummu Ring",
    right_ring="Fortified Ring",
    back="Solemnity Cape",
  }
end

function precast(spell)
  if spell.type == 'JobAbility' then
    equip(sets.JobAbility[spell.english])

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.Precast)

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

    elseif string.find(eng, 'Regen') then
      equip(sets.Magic.EnhancingRegen)

    elseif eng == 'Refresh' then
      equip(sets.Magic.EnhancingRefresh)
      if spell.target.type == 'SELF' then
        equip(sets.Magic.EnhancingRefreshSelf)
      end
    end

  -- Enfeebles
  elseif spell.skill == 'Enfeebling Magic' then
    equip(sets.Magic.Enfeebling)
  end
end

function aftercast(spell)
  if player.status=='Engaged' then
    equip(sets.Engaged)
  else
    -- equip(sets.Idle)
  end
  -- if Capacity.value then
--   if true then
--     equip({back = "Aptitude Mantle +1"})
--   end
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
  elseif command == 'abbyweapon' then
    cycle_weapon()
  end
end

function cycle_weapon()
  Abyssea.current = Abyssea.current + 1
  local len = tablelength(Abyssea.weapons)

  -- if Abyssea.current > tablelength(Abyssea.weapons) then
  if Abyssea.current > #Abyssea.weapons then
    add_to_chat(122, '*** DD Weapons Equiped ***')
    equip({ main = "Skinflayer", sub = "Taming Sari" })
    Abyssea.current = 0
  else
    local set = Abyssea.weapons[Abyssea.current]
    add_to_chat(122, 'Switching to ' .. set.name ..'. Use weapon skills: ' .. set.ws)
    equip({ main = set.name, sub = '-' })
  end
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
