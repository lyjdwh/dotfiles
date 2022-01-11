--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"
vim.opt.relativenumber = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<F2>"] = ":Dashboard<cr>"

vim.cmd("nmap j <Plug>(accelerated_jk_gj)")
vim.cmd("nmap k <Plug>(accelerated_jk_gk)")
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings.t = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "File Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

lvim.builtin.which_key.mappings.w  = {
  name = "+Windows",
  p = {"<C-w>p",                     "Previous Window"},
  g = {"<cmd>ChooseWin<cr>",         "Go To Window"},
  c = {"<C-w>c",                     "Close Window"},
  d = {"<C-w>c",                     "Close Window"},
  h = {"<C-w>h",                     "Window Left"},
  j = {"<C-w>j",                     "Window Below"},
  l = {"<C-w>l",                     "Window Right"},
  k = {"<C-w>k",                     "Window Up"},
  r = {"<cmd>WinResizerStartResize<cr>", "Window Resizer"},
  m = {"<C-w>o",                     "Maximize window"},
  ["="] = {"<C-w>=",                 "Balance Window"},
  s = {"<C-w>s",                     "Split Window Horizontally"},
  v = {"<C-w>v",                     "Split Window Vertically"},
  ["-"] = {"<C-w>s",                 "Split Window Horizontally"},
  ["/"] = {"<C-w>v",                 "Split Window Vertically"},
}

lvim.builtin.which_key.mappings.b['b'] = {"<cmd>Telescope buffers<cr>", "Buffers"}
lvim.builtin.which_key.mappings['<Tab>'] = { "<cmd>b#<cr>", "Previous" }
lvim.builtin.which_key.mappings.b["d"] = {"<cmd>BufferClose!<CR>", "Close Buffer" }

lvim.builtin.which_key.mappings.f = {
  name = "+Files",
  f = {"<cmd>Telescope find_files<cr>", "Find File" },
  j = {"<cmd>FloatermNew ranger<cr>", "Ranger"},
  r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  s = {"<cmd>w<cr>", "Save file"},
  S = {"<cmd>SudaWrite<cr>", "Sudo Save file"},
  t = {"<cmd>NvimTreeFindFileToggle<cr>", "Toggle tree"},
  e = {"<cmd>SudaRead<cr>", "Sudo Edit"},
}

lvim.builtin.which_key.mappings.P = lvim.builtin.which_key.mappings.p
lvim.builtin.which_key.mappings.p = {
  name = "+Projects",
  p = {"<cmd>Telescope projects<CR>", "Projects" },
  f = { require("lvim.core.telescope.custom-finders").find_project_files, "Find File" },
}

lvim.builtin.which_key.mappings.a = {
  name = "+Apps",
  t = {"<cmd>TranslateW<CR>", "Translate"},
  r = {"<cmd>AsyncRun<CR>", "Asyncrun"},
}
lvim.builtin.which_key.vmappings.a = {
  name = "+Apps",
  t = {"<cmd>TranslateWV<CR>", "Translate"},
}

-- use magit replace lazygit
lvim.builtin.which_key.mappings["gg"] = {"<cmd>Neogit<cr>", "Git Status"}

lvim.builtin.which_key.mappings[';'] = {"<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment"}
lvim.builtin.which_key.mappings["sc"] = { "<cmd>Telescope commands<cr>", "Commands" }
lvim.builtin.which_key.mappings["sC"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" }
lvim.builtin.which_key.mappings["ss"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Colorscheme" }
lvim.builtin.which_key.mappings["lR"] = { "<cmd>Telescope lsp_references<cr>", "References" }
lvim.builtin.which_key.mappings["v"] = {"<cmd>lua require('tsht').nodes()<cr>", "Select Text"}

-- User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.lualine.active = true
lvim.builtin.dap.active = true
lvim.builtin.bufferline.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup.root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules")
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black", filetypes = { "python" } },
  { exe = "isort", filetypes = { "python" } },
  -- {
  --   exe = "prettier",
  --   ---@usage arguments to pass to the formatter
  --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --   args = { "--print-with", "100" },
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "typescript", "typescriptreact" },
  -- },
}

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { exe = "flake8", filetypes = { "python" } },
--   {
--     exe = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--severity", "warning" },
--   },
--   {
--     exe = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  {"folke/tokyonight.nvim"},
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
    require("hop").setup()
    vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
    vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup()
    end
  },
  {
    "Pocco81/AutoSave.nvim",
    config = function()
      require("autosave").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
      vim.g.indent_blankline_buftype_exclude = {"terminal"}
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
    end
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  { "tpope/vim-repeat" },
  {"machakann/vim-sandwich"},
  {"gelguy/wilder.nvim"},
  {"mfussenegger/nvim-ts-hint-textobject",
    after = "nvim-treesitter"
  },
  {"nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      require"nvim-treesitter.configs".setup {
          ensure_installed = "maintained",
          highlight = {enable = true, disable = {"vim"}},
          textobjects = {
              select = {
                  enable = true,
                  keymaps = {
                      ["af"] = "@function.outer",
                      ["if"] = "@function.inner",
                      ["aF"] = "@call.outer",
                      ["iF"] = "@call.inner",
                      ["ac"] = "@class.outer",
                      ["ic"] = "@class.inner",
                      ["aC"] = "@comment.outer",
                      ["iC"] = "@comment.inner",
                      ["ax"] = "@statement.outer",
                      ["ix"] = "@statement.outer",
                      ["al"] = "@loop.outer",
                      ["il"] = "@loop.inner",
                      ["ai"] = "@conditional.outer",
                      ["ii"] = "@conditional.inner",
                  }
              },
              move = {
                  enable = true,
                  set_jumps = true, -- whether to set jumps in the jumplist
                  goto_next_start = {
                      ["]["] = "@function.outer",
                      ["]m"] = "@class.outer"
                  },
                  goto_next_end = {
                      ["]]"] = "@function.outer",
                      ["]M"] = "@class.outer"
                  },
                  goto_previous_start = {
                      ["[["] = "@function.outer",
                      ["[m"] = "@class.outer"
                  },
                  goto_previous_end = {
                      ["[]"] = "@function.outer",
                      ["[M"] = "@class.outer"
                  }
              }
          },
        }
    end,
    after = "nvim-treesitter"
  },
  {'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim' ,
    config = function()
      require('neogit').setup()
    end,
  },
  {"voldikss/vim-floaterm",
    cmd = "FloatermNew"
  },
  {"voldikss/vim-translator",
    config = function()
      vim.g.translator_proxy_url = 'socks5://127.0.0.1:1080'
    end,
  },
  {"skywind3000/asyncrun.vim",
    cmd = "AsyncRun"
  },
  {"rlue/vim-barbaric"},
  {"lambdalisue/suda.vim",
    config = function()
      vim.g.suda_smart_edit = 1
    end,
  },
  {"rhysd/accelerated-jk"},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
}
