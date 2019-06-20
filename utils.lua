function buff_change(buff, gain, bufftable)
  if buff:lower() == "doom" then
    if gain then
      lock_set(sets.Doom)
      send_command("input /echo DOOM ON - Equipping doom gear")
      -- send_command("input /party Help, I'm DOOMED!")
      send_command('input /item "Holy Water" <me>')
    else
      unlock_set(sets.Doom)
      -- send_command("input /echo DOOM OFF - Removed doom gear")
      send_command("input /party Doom OFF!")
    end
  end
end

function lock_set(set)
  equip(set)
  for k, _ in pairs(set) do
    disable(k)
  end
end

function unlock_set(set)
  for k, _ in pairs(set) do
    enable(k)
  end
end
