require('lualine').setup({
    options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
    },
    tabline = {
        lualine_a = { 'tabs' },
        lualine_c = { 'buffers' },
        lualine_y = { require('config.utils').get_attached_lsp_servers }
    }
})

