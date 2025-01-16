--if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {
      preset = "modern",
    },
  },

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " ███    ██ ██    ██ ██ ███    ███",
        " ████   ██ ██    ██ ██ ████  ████",
        " ██ ██  ██ ██    ██ ██ ██ ████ ██",
        " ██  ██ ██  ██  ██  ██ ██  ██  ██",
        " ██   ████   ████   ██ ██      ██",
      }

      opts.section.buttons.val = {
        opts.button("n", "  New file", "<cmd>ene<CR>"),
        opts.button("SPC fo", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
        opts.button("SPC  e", "  Toggle file explorer", "<cmd>Neotree reveal<CR>"),
        opts.button("SPC ff", "󰱼  Find file", "<cmd>Telescope find_files<CR>"),
        opts.button("SPC fw", "  Find word", "<cmd>Telescope live_grep<CR>"),
        opts.button("SPC f'", "  BookMarks", "<cmd>Telescope marks<CR>"),
        opts.button("SPC Sl", "󰁯  Restore session", "<cmd>SessionRestore<CR>"),
        opts.button("p", "󰂖  Update plugins", "<cmd>Lazy update<CR>"),
        opts.button("s", "  Settings", "<cmd>e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
        opts.button("q", "  Quit", "<cmd>qa<CR>"),
      }

      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = true },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
