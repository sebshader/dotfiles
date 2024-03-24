require("telescope").setup {
    pickers = {
        buffers = {
            mappings = {
                i = {
                    ["<c-d>"] = "delete_buffer"
                },
                n = {
                    ["d"] = "delete_buffer"
                }
            }
        }
    }
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files)
vim.keymap.set('n', '<leader>gf', builtin.git_files)
vim.keymap.set('n', '<leader>b', function() builtin.buffers{sort_lastused = true, mru = true} end)
vim.keymap.set('n', '<leader>ps', builtin.grep_string)
vim.keymap.set('n', '<leader>vh', builtin.help_tags)
