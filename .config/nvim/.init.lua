-- options
local options = {
    tabstop = 4,
    softtabstop = 4,
    expandtab = true,
    smartindent = true,
    exrc = true,
    relativenumber = true,
    hlsearch = false,
    hidden = true,
    errorbells = false,
    nu = true,
    wrap = false,
    ignorecase = true,
    smartcase = true,
    backup = false,
    undodir = '~/.vim/undodir',
    undofile = true,
    incsearch = true,
    termguicolors = true,
    showmode = false,
    mouse = 'a',
    clipboard = 'unnamedplus',
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.g.airline_theme = 'nord_minimal'
vim.g.mapleader = ' '

-- keymaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

local imaps = {
    {'<C-f>', '<Plug>(coc-snippets-expand)', {}},
    {'<C-l>', '<Esc>viw~ea', {}},
    {'<C-o>', '<Esc>A;<CR>', {}},
    {'<C-j>', '<C-n>', opts},
    {'<C-k>', '<C-p>', opts},
}

for i = 1, #imaps do
    keymap('i', imaps[i][1], imaps[i][2], imaps[1][3])
end

local nmaps = {
    {'<leader>;', 'A;<Esc>', {}},
    {'<leader>lt', ':!pdflatex main.tex<Cr><Cr>', {}},
    {'<leader>rr', ':source ~/.config/nvim/init.vim<CR>', {}},
    {'<leader>t', ':tabnew <CR>', {}},
    {'<leader>gd', '<Plug>(coc-definition)', {}},
    {'<leader>gy', '<Plug>(coc-type-definition)', {}},
    {'<leader>gi', '<Plug>(coc-implementation)', {}},
    {'<leader>gr', '<Plug>(coc-references) ', {}},
    {'<leader>rn', '<Plug>(coc-rename)', {}},
    {'<leader>T', '<Plug>(coc-terminal-toggle):call term_sendkeys("clear")<Cr>', {}},
    {'<CR>', 'o<Esc>', {}},
    {'<leader>gt', ':call CocAction(\'jumpDefinition\')<CR>', {}},
    {'<leader>gd', ':call CocAction(\'jumpDefinition\', \'split\')<CR>', {}},
    {'<leader>gv', ':call CocAction(\'jumpDefinition\', \'vsplit\')<CR>', {}},
    {'<leader>e', ':CocCommand explorer<CR>', {}},
    {'<leader>ff', ':Files<CR>', {}},
    {'<leader>fr', ':Rg<CR>', {}},
    {'/', ':BLines<CR>', {}},
    {'<leader>fa', ':Ag<CR>', {}},
    {'<leader>fi', ':History:<CR>', {}},
    {'<leader>fl', ':Lines<CR>', {}},
    {'<leader>m', ':MaximizerToggle!<CR>', {}},
    {'<leader>h', ':wincmd h<CR>', {}},
    {'<leader>j', ':wincmd j<CR>', {}},
    {'<leader>k', ':wincmd k<CR>', {}},
    {'<leader>l', ':wincmd l<CR>', {}},
    {'<leader>do', ':call CocAction(\'doHover\')<CR>', opts},
    {'<silent> <space><space>', ':<C-u>CocFzfList<CR>', opts},
}

for i = 1, #nmaps do
    keymap('n', nmaps[i][1], nmaps[i][2], nmaps[i][3])
end

-- plugins
local packer = require('packer')

packer.startup(function()
    -- lsp
    use 'neovim/nvim-lspconfig'

    -- lsp completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'

    -- snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- packer
    use 'wbthomason/packer.nvim'
    use 'szw/vim-maximizer'

    --color
    use 'EdenEast/nightfox.nvim'
    use 'nvim-treesitter/nvim-treesitter'

    --use 'lervag/vimtex'
    --use 'tasn/vim-tsx'
    --use 'junegunn/seoul256.vim'
    --use 'gruvbox-community/gruvbox'
    --use 'shaunsingh/nord.nvim'
    --use 'sainnhe/sonokai'
    --use 'preservim/nerdcommenter'
    --use 'neoclide/coc.nvim'
    --use 'honza/vim-snippets'
    --use 'vim-airline/vim-airline'
    --use 'vim-airline/vim-airline-themes'
    --use 'junegunn/fzf.vim'
    --use 'airblade/vim-rooter'
    --use 'cespare/vim-toml'
end)

-- appearance
vim.g.colorscheme = 'nightfox'

vim.cmd[[highlight Normal guibg=none]]
vim.cmd[[highlight clear SignColumn]]
vim.cmd[[highlight clear SignColumn]]
vim.cmd[[highlight clear TabLineFill]]
vim.cmd[[highlight clear VertSplit]]
vim.cmd[[highlight clear Tabline]]

-- treesitter_config
require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true
    }
})

-- lsp_config

-- cmp config
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = luasnip.expand(),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {
        "i",
        "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, {
    "i",
    "s",
}),
  },
  formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
          vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
          })[entry.source.name]
          return vim_item
      end,
  },
  sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
  },
  confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
  },
  window = {
      documentation = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      },
  },
  experimental = {
      ghost_text = false,
      native_menu = false,
  },
}
