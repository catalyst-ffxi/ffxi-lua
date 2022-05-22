include('Mote-Mappings.lua')

-- Auto equip doom sets
function buff_change(buff, gain, bufftable)
  local doom_set = {
    neck="Nicander's Necklace",
    left_ring="Purity Ring",
    right_ring="Blenmot's Ring",
    waist="Gishdubar Sash"
  }
  if buff:lower() == "doom" then
    if gain then
      lock_set(doom_set)
      send_command("input /echo DOOM ON - Equipping doom gear")
      -- send_command("input /party Help, I'm DOOMED!")
      -- send_command('input /item "Holy Water" <me>')
    else
      unlock_set(doom_set)
      send_command("input /echo DOOM OFF - Removed doom gear")
      -- send_command("input /party Doom OFF!")
    end
  end
end

-- Disable all slots in a given set
function lock_set(set)
  equip(set)
  for k, _ in pairs(set) do
    disable(k)
  end
end

-- Enable all slots in a given set
function unlock_set(set)
  for k, _ in pairs(set) do
    enable(k)
  end
end

-- Calculate total elemental intensity taking weather and day into account
function get_total_element_intensity(element)
  local intensity = 0

  if element == world.weather_element then
    intensity = intensity + world.weather_intensity
  elseif elements.strong_to[element] == world.weather_element then
    intensity = intensity - world.weather_intensity
  end

  if element == world.day_element then
    intensity = intensity + 1
  elseif elements.strong_to[element] == world.day_element then
    intensity = intensity - 1
  end

  return intensity
end

-- Equip Orpheus Sash or Hachirin-no-Obi depending on elemental factors
--
function equip_elemental_waist(spell)
  local intensity = get_total_element_intensity(spell.element)
  local distance_to_center = spell.target.distance
  local is_helix_spell = (string.find(spell.name, 'helix') ~= nil)

  -- add_to_chat('Calculate Orpheus/Hachirin:')
  -- add_to_chat('* Element: ' .. spell.element)
  -- add_to_chat('* Intensity: ' .. intensity)
  -- add_to_chat('* Distance: ' .. spell.target.distance)
  -- add_to_chat('* Model Size: ' .. spell.target.model_size)
  -- add_to_chat('* Effective: ' .. distance_to_center)
  -- add_to_chat('* Helix?: ' .. (is_helix_spell and 'Yes' or 'No'))

  if is_helix_spell == false and (intensity >= 2 or (intensity == 1 and distance_to_center > 8)) then
    equip({ waist="Hachirin-no-Obi" })
    -- add_to_chat('RESULT: Hachirin-no-Obi')
  elseif distance_to_center <= 15 then
    equip({ waist="Orpheus's Sash" })
    -- add_to_chat('RESULT: Orpheus Shash')
  else
    -- add_to_chat('RESULT: Keep current waist')
  end
end

function dual_wield_job()
  return (player.sub_job == 'NIN' or player.sub_job == 'DNC') and player.sub_job_level > 0
end
