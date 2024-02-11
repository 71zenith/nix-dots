{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs = {
    nixvim = {
      enable = true;
      colorschemes.oxocarbon.enable = true;
      globals.mapleader = " ";
      clipboard.providers.wl-copy.enable = true;
      options = {
        number = true;
        relativenumber = false;
        shiftwidth = 2;
      };
      plugins = {
        nix.enable = true;
        bufferline.enable = true;
        nvim-autopairs = {
          enable = true;
          checkTs = true;
        };
        toggleterm = {
          enable = true;
          direction = "float";
        };
        comment-nvim.enable = true;
        lsp-format.enable = true;
        barbecue.enable = true;
        lsp = {
          enable = true;
          servers = {
            nil_ls.enable = true;
          };
        };
        indent-blankline.enable = true;
        leap.enable = true;
        gitsigns.enable = true;
        cursorline.enable = true;
        alpha = {
          enable = true;
          theme = "dashboard";
        };
        neo-tree.enable = true;
        auto-save.enable = true;
        cmp-buffer.enable = true;
        cmp-nvim-lsp.enable = true;
        cmp-nvim-lua.enable = true;
        lspkind.enable = true;
        noice.enable = true;
        lualine.enable = true;
        nvim-colorizer.enable = true;
        luasnip.enable = true;
        which-key.enable = true;
        treesitter.enable = true;
        nvim-cmp = {
          enable = true;
          snippet.expand = "luasnip" ;
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          completion.keywordLength = 3;
          matching.disallowFuzzyMatching = true;
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = {
              action = "cmp.mapping.select_prev_item()";
              modes = [
                "i"
                "s"
              ];
            };
            "<Tab>" = {
              action = "cmp.mapping.select_next_item()";
              modes = [
                "i"
                "s"
              ];
            };
          };
        };
        rainbow-delimiters.enable = true;
        telescope = {
          enable = true;
          extensionConfig.ui-select = { };
          extensions.frecency.enable = true;
          extensions.fzf-native.enable = true;
          extensions.file_browser = {
            enable = true;
            hidden = true;
            depth = 9999999999;
            autoDepth = true;
          };
          keymaps = {
            "<leader>ff" = "find_files";
            "<leader>fs" = "grep_string";
             "<leader>fg" = "live_grep";
          };
        };
      };
      keymaps = [
        {
          key = "<leader>t";
          action = "<CMD>Neotree<NL>";
        }
        {
          key = "<Tab>";
          action = "<CMD>:bnext<NL>";
        }
      ];
    };
 };
}