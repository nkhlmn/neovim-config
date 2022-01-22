require('lualine').setup({
    sections = {
        lualine_c = { 'filename', require('config.utils').get_attached_lsp_servers }
    }
})

