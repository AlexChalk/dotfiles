local M = {}

M.get_words = function()
  local show_word_count = { [""] = true, markdown = true }
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")
  local word_count = vim.fn.wordcount()

  if word_count.visual_words then
    return "WC: " .. tostring(word_count.visual_words)
  elseif show_word_count[filetype] then
    return "WC: " .. tostring(word_count.words)
  else
    return ""
  end
end

M.get_statusline = function()
  local right_align = "%="

  local function word_count()
    return M.get_words()
  end

  return table.concat({
    right_align,
    word_count(),
  })
end

return M
