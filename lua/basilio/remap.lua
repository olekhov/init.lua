vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<S-Insert>", "<C-R>+")



-- помести в lua-конфиг, например в after/plugin/lsp.lua
local function goto_definition_in_tab()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, 'textDocument/definition', params, function(_, result, ctx)
    if not result or vim.tbl_isempty(result) then
      vim.notify("Definition not found", vim.log.levels.WARN)
      return
    end
    local def = result[1]
    local uri = def.uri or def.targetUri
    local range = def.range or def.targetSelectionRange
    local fname = vim.uri_to_fname(uri)

    -- ищем открытую вкладку с этим файлом
    for _, tabnr in ipairs(vim.api.nvim_list_tabpages()) do
      local win = vim.api.nvim_tabpage_get_win(tabnr)
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.api.nvim_buf_get_name(buf) == fname then
        vim.api.nvim_set_current_tabpage(tabnr)
        vim.api.nvim_set_current_win(win)
        vim.api.nvim_win_set_cursor(win, { range.start.line + 1, range.start.character })
        return
      end
    end

    -- если вкладка не найдена — открыть новую
    vim.cmd('tabedit ' .. vim.fn.fnameescape(fname))
    vim.api.nvim_win_set_cursor(0, { range.start.line + 1, range.start.character })
  end)
end

-- переопределяем Ctrl-]
vim.keymap.set('n', '<C-]>', goto_definition_in_tab, { silent = true })

