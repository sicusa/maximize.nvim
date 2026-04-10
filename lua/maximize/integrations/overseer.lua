return function()
  local ok, w = pcall(require, 'overseer.window')
  if not ok then
    return false, nil
  end

  local cb = function()
    if not w.is_open() then
      w.open { enter = false }
    end
  end

  if w.is_open() then
    w.close()
    return true, cb
  end
  return false, nil
end
