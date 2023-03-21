local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.cmd([[
  augroup lazy_user_sync
    autocmd!
    " autocmd BufWritePost plugins.lua source <afile> | Lazy sync
    " autocmd BufWritePost plugins.lua source <afile> | Lazy sync
  augroup end
]])

require("lazy").setup({
	-- My plugins here
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	"numToStr/Comment.nvim", -- Easily comment stuff
	--[[ "kyazdani42/nvim-web-devicons", ]]
	"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	--[[ ("kyazdani42/nvim-tree.lua") ]]
	--[[ ("nvim-tree/nvim-tree.lua") ]]
	--[[ {'nvim-tree/nvim-tree.lua', commit= '9c97e6449b0b0269bd44e1fd4857184dfa57bb4c'}, ]]
	--[[ 'nvim-tree/nvim-tree.lua', ]]
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			--[[ "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended ]]
			"MunifTanjim/nui.nvim",
		},
	},
	"s1n7ax/nvim-window-picker",
	tag = "v1.*",
	config = function()
		require("window-picker").setup()
	end,
	--[[ "akinsho/bufferline.nvim", ]]
	"moll/vim-bbye",
	"nvim-lualine/lualine.nvim",
	--  "christianchiarulli/lualine.nvim"
	--  "akinsho/toggleterm.nvim"
	"ahmedkhalf/project.nvim",
	"lewis6991/impatient.nvim",
	"lukas-reineke/indent-blankline.nvim",
	{
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		config = function()
			require("toggleterm").setup()
		end,
	},
	--  {
	--   'goolord/alpha-nvim',
	--   config = function ()
	--       require'alpha'.setup(require'alpha.themes.dashboard'.config)
	--   end
	-- }
	"antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight
	"folke/which-key.nvim",
	"mhinz/vim-startify", -- startify
	{
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	},
	--[[ ({ "christianchiarulli/nvim-gps", branch = "text_hl" }) ]]
	--  { "christianchiarulli/JABS.nvim" }
	--  {'ygm2/rooter.nvim'}

	{
		"rrethy/vim-hexokinase",
		build = "cd ~/.local/share/nvim/lazy/vim-hexokinase && make hexokinase",
	},
	-- Colorschemes
	"lunarvim/darkplus.nvim",
	--  "gleich/monovibrant"
	--[[  "swaroopanand10/monocustom" ]]
	--[[  "swaroopanand10/monovibrantdark" ]]
	"swaroopanand10/glowbeamdark",
	"rafamadriz/neon",
	--  "bignimbus/pop-punk.vim"
	"cooperuser/glowbeam.nvim",
	--  "betoissues/contrastneed-theme"
	--  "nonetallt/vim-neon-dark"
	"folke/tokyonight.nvim",
	--[[  'romgrk/doom-one.vim' ]]
	--[[  'morhetz/gruvbox' ]]
	--[[  'sainnhe/sonokai' ]]
	--[[ "pacokwon/onedarkhc.vim", ]]
	--[[  'joshdick/onedark.vim' ]]
	--[[  'rakr/vim-one' ]]
	"ukyouz/onedark.vim",
	"ray-x/aurora",
	"Abstract-IDE/Abstract-cs",
	-- 'marko-cerovac/material.nvim',
  "sainnhe/gruvbox-material",
  "sainnhe/sonokai",
  "ray-x/starry.nvim",



	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"quangnguyen30192/cmp-nvim-ultisnips",
	{ "mattn/emmet-vim", lazy = false }, -- emmet (just install it this way and it's fine)
	{ "mlaursen/vim-react-snippets", lazy = false }, -- react snippets
	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to
	"SirVer/ultisnips",
	-- LSP
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	"neovim/nvim-lspconfig", -- enable LSP
	-- local  = require('packer').
	-- require('packer').startup(function()
	--    'wbthomason/packer.nvim' -- Package manager
	--    'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
	-- end)
	--[[  "williamboman/nvim-lsp-installer" -- simple to  language server installer ]]
	"tamago324/nlsp-settings.nvim", -- language server settings defined in json for
	"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
	--[[ ("jayp0521/mason-null-ls.nvim") ]]
	-- will install it later when needed
	"ray-x/lsp_signature.nvim",
	-- Telescope
	"nvim-telescope/telescope.nvim", -- ripgrep is important for livegrep so install it seperately by pacman
	{ "nvim-telescope/telescope-file-browser.nvim" },
	--  "sharkdp/fd"
	"junegunn/fzf",
	"junegunn/fzf.vim",
	"barrett-ruth/telescope-http.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	"ibhagwan/fzf-lua",
	"sudormrfbin/cheatsheet.nvim",
	"LinArcX/telescope-env.nvim",
	"debugloop/telescope-undo.nvim",
	"fhill2/telescope-ultisnips.nvim",
	"tsakirist/telescope-lazy.nvim",
	{
		"benfowler/telescope-luasnip.nvim",
		module = "telescope._extensions.luasnip", -- if you wish to lazy-load
	},
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		--[[ lazy=false, ]]
		--[[ build = ":TSUpdate", ]]
	},
	"JoosepAlviste/nvim-ts-context-commentstring",
	"windwp/nvim-ts-autotag",
	"RRethy/vim-illuminate",
	-- Dap
	-- DAP
	-- "mfussenegger/nvim-dap",
	--  "theHamsta/nvim-dap-virtual-text"
	-- "rcarriga/nvim-dap-ui",
	--  "Pocco81/DAPInstall.nvim"
	--[[  "Pocco81/dap-buddy.nvim" ]]
	--[[  { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" } ]]
	-- "nvim-telescope/telescope-dap.nvim",

	-- ({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })
	-- ({
	-- "microsoft/vscode-js-debug",
	-- 	opt = true,
	-- 	run = "npm install --legacy-peer-deps && npm run compile",
	-- })
	-- "jayp0521/mason-nvim-dap.nvim",

	-- Git
	"lewis6991/gitsigns.nvim",
	--  "kdheepak/lazygit.nvim"-- was not working

	--Some extra stuff
	--  "tpope/vim-surround"
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to  defaults
			})
		end,
	},
	"ThePrimeagen/vim-be-good",
	--[[ { ]]
	--[[   'nat-418/cmp-color-names.nvim', ]]
	--[[   config = { ]]
	--[[     require('cmp-color-names').setup() ]]
	--[[   } ]]
	--[[ }, ]]
	"hrsh7th/cmp-calc",
	-- 'edluffy/hologram.nvim',
	--[[ {  ]]
	--[[   'gen740/SmoothCursor.nvim', ]]
	--[[   config = function() ]]
	--[[     require('smoothcursor').setup() ]]
	--[[   end ]]
	--[[ } ]]
	--[[ {"cshuaimin/ssr.nvim",module="ssr"}, ]]
	--[[  {"nathom/filetype.nvim"} ]]
	--[[  { ]]
	--[[   'samodostal/image.nvim', ]]
	--[[   requires = { ]]
	--[[     'nvim-lua/plenary.nvim' ]]
	--[[   }, ]]
	--[[ } ]]
	--[[ ("p00f/cphelper.nvim") ]]

	--  "metakirby5/codi.vim"
	--  "unblevable/quick-scope"
	--  "justinmk/vim-sneak"
	--  "ggandor/lightspeed.nvim"
	--  "easymotion/vim-easymotion"
  {
    "folke/noice.nvim",
 -- dependencies= "rcarriga/nvim-notify"
  },
	-- "rcarriga/nvim-notify",
  -- {
  --   'rcarriga/nvim-notify',
  --   config = function ()
  --     require("notify").setup {
  --       stages = 'fade_in_slide_out',
  --       background_colour = 'FloatShadow',
  --       timeout = 100,
  --     }
  --     vim.notify = require('notify')
  --   end
  -- },
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	},
})
