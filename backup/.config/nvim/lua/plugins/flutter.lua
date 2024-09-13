return
  {
      {
          "williamboman/mason.nvim",
          opts = {
            ensure_installed = {
              "stylua",
              "shellcheck",
              "shfmt",
              "flake8",
            },
          },
      },

      {
          'akinsho/flutter-tools.nvim',
          lazy = false,
          dependencies = {
              'nvim-lua/plenary.nvim',
              'stevearc/dressing.nvim', -- optional for vim.ui.select
          },
          config = true,
      },
      {
      'kristijanhusak/vim-dadbod-ui',
      dependencies = {
        { 'tpope/vim-dadbod', lazy = true },
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
      },
      cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
      },
      init = function()
        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1
      end,
    },
  
    {
      "folke/drop.nvim",
      event = "VeryLazy",
      config = function()
        require("drop").setup({
          --- name of the global variable which holds the main drop instance
          global_name = "drop",
          --- don't create mappings
          disable_mappings = false,
          --- theme to use for the drops
          theme = "stars", -- can be "stars", "snow", or "spring"
          --- max number of drops on the screen
          max = 40,
          --- interval for spawning a new drop
          interval = 150,
          --- probability for a drop to show
          probability = 0.6,
          --- fold columns when there are drops on the screen
          fold_columns = false,
          --- automatically start drop when opened
          automatic = true,
        })
      end,
    },
    -- Add SuperMaven plugin
    {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({
          keymaps = {
            accept_suggestion = "<A-l>",
            clear_suggestion = "<A-h>",
            accept_word = "<A-j>",
          },
          ignore_filetypes = { cpp = true },
          color = {
            suggestion_color = "#ffffff",
            cterm = 244,
          },
          log_level = "info", -- set to "off" to disable logging completely
          disable_inline_completion = false, -- disables inline completion for use with cmp
          disable_keymaps = false -- disables built in keymaps for more manual control
        })
      end,
    },
    {'romgrk/barbar.nvim',
      dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
      },
      init = function() vim.g.barbar_auto_setup = false end,
      opts = {
        animation = true,
        insert_at_start = true,
      },
    },
    {
      "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- set this if you want to always pull the latest change
        opts = {
          -- add any opts here
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
          "stevearc/dressing.nvim",
          "nvim-lua/plenary.nvim",
          "MunifTanjim/nui.nvim",
          --- The below dependencies are optional,
          "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
          "zbirenbaum/copilot.lua", -- for providers='copilot'
          {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
              -- recommended settings
              default = {
                embed_image_as_base64 = false,
                prompt_for_file_name = false,
                drag_and_drop = {
                  insert_mode = true,
                },
                -- required for Windows users
                use_absolute_path = true,
              },
            },
          },
          {
            -- Make sure to set this up properly if you have lazy=true
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
              file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
          },
        },
      }
}
