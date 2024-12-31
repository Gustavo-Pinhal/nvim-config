--[[ Explorador de arquivos ]]

return {
    'nvim-tree/nvim-tree.lua',
    config = function()
        require('nvim-tree').setup({
            view = {
                float = {
                    enable = true,
                    open_win_config = function()
                        local screen_w = vim.opt.columns:get()
                        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                        local w_h = 70
                        local s_h = 42
                        local center_x = (screen_w - w_h) / 2
                        local center_y = ((vim.opt.lines:get() - s_h) / 5) - vim.opt.cmdheight:get()
                        return {
                            border = 'rounded',
                            relative = 'editor',
                            row = center_y,
                            col = center_x,
                            width = w_h,
                            height = s_h,
                        }
                    end,
                },
                width = function()
                    return math.floor(vim.opt.columns:get() * 5)
                end,
            },
        })

        vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'nvimtree toggle window' })
    end,
}
