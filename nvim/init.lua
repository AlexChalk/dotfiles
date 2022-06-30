----------------------------------------------------------------
-- Top settings
----------------------------------------------------------------
vim.opt.compatible = false

-- Workaround code:
-- vim.api.nvim_command
-- vim.cmd
-- vim.api.nvim_exec

-- 0.7:
-- - vim.keymap.set({ "i", "s" }, "<c-k>", function() ... end, { silent = true})
-- - vim.pretty_print()
-- - vim.api.nvim_{buf_}create{/del}_user_command()
-- - vim.api.nvim_create_autocmd
-- - vim.api.nvim_create_augroup
-- - store lua functions in vim variables, e.g. vim.g.test_dict = {test_lambda = function() return 1 end}

----------------------------------------------------------------
-- Vim Plug
-- Remember to run :PlugUpdate (and :PlugUpgrade if on macOS) once in a while
-- For versioning: :SavePlugSnapshot
-- Look at switching to packer once it has snapshots: https://github.com/wbthomason/packer.nvim/pull/370
----------------------------------------------------------------
if
  vim.fn.empty(vim.fn.glob("$HOME/.local/share/nvim/site/autoload/plug.vim")) > 0
then
  vim.fn.execute(
    "!curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  )
  vim.api.nvim_create_autocmd("VimEnter", {
    pattern = { "*" },
    command = "PlugInstall --sync | source $HOME/dotfiles/nvim/init.lua",
  })
end

local Plug = vim.fn["plug#"]
vim.call("plug#begin", "$HOME/.local/share/nvim/plugged")

-- LSP and Completion and Snippets
Plug("neovim/nvim-lspconfig")
Plug("hrsh7th/cmp-nvim-lua")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
Plug("petertriho/cmp-git")
Plug("kristijanhusak/vim-dadbod-completion")
Plug("onsails/lspkind-nvim")
Plug("jose-elias-alvarez/null-ls.nvim")
Plug("L3MON4D3/LuaSnip")
Plug("saadparwaiz1/cmp_luasnip")

-- General
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim")
Plug("nvim-telescope/telescope-fzf-native.nvim", { ["do"] = "make" })
Plug("kevinhwang91/nvim-bqf")

Plug("chaoren/vim-wordmotion")
Plug("numToStr/Comment.nvim")

Plug("tommcdo/vim-exchange")
Plug("vim-scripts/ReplaceWithRegister")

Plug("machakann/vim-highlightedyank")

Plug("janko-m/vim-test")

Plug("prabirshrestha/async.vim")

Plug("EinfachToll/DidYouMean")

Plug("ap/vim-css-color")

Plug("thiagoalessio/rainbow_levels.vim")

-- Toomey other
Plug("christoomey/vim-sort-motion")

-- Tpope other
Plug("tpope/vim-speeddating")
Plug("tpope/vim-repeat")
Plug("tpope/vim-unimpaired")
Plug("tpope/vim-eunuch")
Plug("tpope/vim-surround")
Plug("tpope/vim-dadbod")
Plug("tpope/vim-fugitive")
Plug("tpope/vim-rhubarb")
Plug("tpope/vim-heroku")
Plug("tpope/vim-abolish")
Plug("tpope/vim-rails")

-- Themes
Plug("chriskempson/base16-vim")
Plug("nvim-lualine/lualine.nvim")
Plug("arkav/lualine-lsp-progress")

-- Shell interop
Plug("christoomey/vim-tmux-navigator")
Plug("christoomey/vim-tmux-runner")
Plug("mattboehm/vim-unstack")

-- Javascript
Plug("pangloss/vim-javascript", { ["for"] = { "javascript", "jsx" } })
Plug("mxw/vim-jsx", { ["for"] = { "javascript", "jsx", "typescriptreact" } })
Plug("moll/vim-node")

-- FSharp
Plug("AlexChalk/fsharp-vim")

-- Debugger
Plug("mfussenegger/nvim-dap")
Plug("rcarriga/nvim-dap-ui")

-- Misc Langs
Plug("Zaptic/elm-vim", { ["for"] = { "elm" } })
Plug("neovimhaskell/haskell-vim", { ["for"] = { "haskell" } })
Plug("HerringtonDarkholme/yats.vim", { ["for"] = { "typescript", "tsx" } })
Plug("rust-lang/rust.vim", { ["for"] = "rust" })
Plug("elixir-editors/vim-elixir", { ["for"] = "elixir" })
Plug("LnL7/vim-nix", { ["for"] = "nix" })
Plug("vim-python/python-syntax", { ["for"] = "python" })
Plug("Vimjas/vim-python-pep8-indent", { ["for"] = "python" })

-- Clojure
Plug("Olical/conjure", { ["for"] = { "clojure", "clojurescript" } })
Plug("tpope/vim-classpath", { ["for"] = { "clojure", "clojurescript" } })
Plug("guns/vim-sexp", { ["for"] = { "clojure", "clojurescript" } })
Plug(
  "tpope/vim-sexp-mappings-for-regular-people",
  { ["for"] = { "clojure", "clojurescript" } }
)
Plug("clojure-vim/clojure.vim", { ["for"] = { "clojure", "clojurescript" } })
Plug("markwoodhall/vim-sayid", { ["for"] = { "clojure", "clojurescript" } })
Plug("junegunn/rainbow_parentheses.vim")
Plug("eraserhd/parinfer-rust", {
  ["for"] = { "clojure", "clojurescript" },
  ["do"] = 'nix-shell --run "cargo build --release"',
})

-- Treesitter
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("nvim-treesitter/nvim-treesitter-textobjects")
-- Wiki
Plug("vimwiki/vimwiki")
Plug("vim-pandoc/vim-pandoc")
Plug("vim-pandoc/vim-pandoc-syntax")
Plug("godlygeek/tabular")
Plug("ledger/vim-ledger")

vim.call("plug#end")

-- let g:fsharp#automatic_workspace_init = 0
-- https://github.com/fsharp/FsAutoComplete/releases/latest/download/fsautocomplete.netcore.zip

----------------------------------------------------------------
-- Leader
----------------------------------------------------------------
-- Change leader and change space to prior leader functionality
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.api.nvim_set_keymap("n", "<space>", ",", { noremap = true })

-- abolish calls it 'mixed', i prefer 'pascal'
vim.api.nvim_set_keymap("n", "crp", "crm", { noremap = false })

----------------------------------------------------------------
-- Start-of-line only cabbrevs
----------------------------------------------------------------
function _G.abbreviate_or_noop(input, output)
  local cmdtype = vim.fn.getcmdtype()
  local cmdline = vim.fn.getcmdline()

  if cmdtype == ":" and cmdline == input then
    return output
  else
    return input
  end
end

function SetupCommandAlias(input, output)
  vim.api.nvim_command(
    "cabbrev <expr> "
      .. input
      .. " "
      .. "v:lua.abbreviate_or_noop('"
      .. input
      .. "', '"
      .. output
      .. "')"
  )
end

-- example use: SetupCommandAlias("pg", "postgres://")

----------------------------------------------------------------
-- Source my customizations
----------------------------------------------------------------
local function build_import(filename)
  local lua_extension = filename:find("%.lua$")
  return "conf/" .. filename:sub(1, lua_extension - 1)
end

for filename in io.popen("ls -1 $HOME/.config/nvim/lua/conf"):lines() do
  require(build_import(filename))
end

----------------------------------------------------------------
-- VersionedPluginBuilds
----------------------------------------------------------------
function SavePlugSnapshot()
  local datetime = os.date("%Y-%m-%d_%H:%M:%S")
  vim.api.nvim_command(
    "PlugSnapshot! $HOME/.vim-plug-snapshots/" .. datetime .. ".vim"
  )
end

vim.api.nvim_create_user_command("SavePlugSnapshot", SavePlugSnapshot, { nargs = 0 })
