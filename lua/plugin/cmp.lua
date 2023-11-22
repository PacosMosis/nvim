vim.api.nvim_set_hl(0, "MyPmenu",    { bg = "#000000", fg = "#cccccc"})
vim.api.nvim_set_hl(0, "MyPmenuSel", { bg = "#cccccc", fg = "#000000" , bold = true, italic = true})

local cmp = require("cmp")

local icons = {
      Text = "󰉿",
      Method = "󰆧",
      Function = "󰊕",
      Constructor = "",
      Field = "󰜢",
      Variable = "󰀫",
      Class = "󰠱",
      Interface = "",
      Module = "",
      Property = "󰜢",
      Unit = "󰑭",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "󰈇",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "󰙅",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "",
}

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  window = {
    completion = cmp.config.window.bordered({
      padding = 0,
      border = "single",
      winhighlight = "Normal:MyPmenu,FloatBorder:TelescopeBorder,CursorLine:PmenuSel,Search:None"
    }),
  },
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      ['<CR>'] = cmp.mapping.confirm({ select = true })
    }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function (_, vim_item)
       vim_item.kind = (icons[vim_item.kind] or "Foo") .. " " .. vim_item.kind
      return vim_item
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
})

