local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  -- use "christianchiarulli/lualine.nvim"
  -- use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
  require("toggleterm").setup()
end}
  -- use {
  --   'goolord/alpha-nvim',
  --   config = function ()
  --       require'alpha'.setup(require'alpha.themes.dashboard'.config)
  --   end
  -- }
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
	use "mhinz/vim-startify" -- startify
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
   }
  -- use { "christianchiarulli/nvim-gps", branch = "text_hl" }
  use {'rrethy/vim-hexokinase', 
  run = 'cd ~/.local/share/nvim/site/pack/packer/start/vim-hexokinase && make hexokinase'}
  -- use { "christianchiarulli/JABS.nvim" }
  -- use {'ygm2/rooter.nvim'}

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  -- use "gleich/monovibrant"
  use "swaroopanand10/monocustom"
  use "swaroopanand10/monovibrantdark"
  use "swaroopanand10/glowbeamdark"
  -- use "rafamadriz/neon"
  -- use "bignimbus/pop-punk.vim"
  use "cooperuser/glowbeam.nvim"
  -- use "betoissues/contrastneed-theme"
  -- use "nonetallt/vim-neon-dark"
  -- use 'folke/tokyonight.nvim'
  
  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "mattn/emmet-vim"  -- emmet (just install it this way and it's fine)
  use "mlaursen/vim-react-snippets" -- react snippets


  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use "SirVer/ultisnips"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
-- local use = require('packer').use
-- require('packer').startup(function()
--   use 'wbthomason/packer.nvim' -- Package manager
--   use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
-- end)
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim" -- ripgrep is important for livegrep so install it seperately by pacman
  use { "nvim-telescope/telescope-file-browser.nvim" }
  -- use "sharkdp/fd"
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "windwp/nvim-ts-autotag"
  -- use "RRethy/vim-illuminate"

  -- Dap
 -- DAP
  use "mfussenegger/nvim-dap"
  -- use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  -- use "Pocco81/DAPInstall.nvim"
  use "Pocco81/dap-buddy.nvim"
  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }
  use "nvim-telescope/telescope-dap.nvim"
  -- Git
  use "lewis6991/gitsigns.nvim"
  -- use "kdheepak/lazygit.nvim"-- was not working
  
  --Some extra stuff
  use "tpope/vim-surround"
  -- use "metakirby5/codi.vim"
  use "unblevable/quick-scope"
  -- use "justinmk/vim-sneak"
  -- use "ggandor/lightspeed.nvim"
  -- use "easymotion/vim-easymotion"


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
