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
-- - vim.api.nvim_{buf_}add{/del}_user_command()
-- - vim.api.nvim_create_autocmd
-- - store lua functions in vim variables, e.g. vim.g.test_dict = {test_lambda = function() return 1 end}

----------------------------------------------------------------
-- Vim Plug
-- Remember to run :PlugUpdate (and :PlugUpgrade if on macOS) once in a while
-- For versioning: :SavePlugSnapshot
-- Look at switching to packer once it has snapshots: https://github.com/wbthomason/packer.nvim/pull/370
----------------------------------------------------------------
local Plug = vim.fn["plug#"]
vim.call("plug#begin", "$HOME/.local/share/nvim/plugged")

-- Completion
Plug("neovim/nvim-lspconfig")
Plug("hrsh7th/cmp-nvim-lua")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
Plug("petertriho/cmp-git")

-- For luasnip users.
Plug("L3MON4D3/LuaSnip")
Plug("saadparwaiz1/cmp_luasnip")

-- For ultisnips users.
Plug("SirVer/ultisnips")
Plug("quangnguyen30192/cmp-nvim-ultisnips")

-- General
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim")
Plug("nvim-telescope/telescope-fzf-native.nvim", { ["do"] = "make" })
Plug("kevinhwang91/nvim-bqf")

Plug("dyng/ctrlsf.vim")

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

-- lsp
Plug("neoclide/coc.nvim", { ["do"] = "yarn install --frozen-lockfile" })
Plug("neoclide/coc-tsserver", { ["do"] = "yarn install --frozen-lockfile" })
Plug("neoclide/coc-eslint", { ["do"] = "yarn install --frozen-lockfile" })
Plug("neoclide/coc-tslint-plugin", { ["do"] = "yarn install --frozen-lockfile" })
Plug("neoclide/coc-prettier", { ["do"] = "yarn install --frozen-lockfile" })
Plug("fannheyward/coc-rust-analyzer", { ["do"] = "yarn install --frozen-lockfile" })
Plug("fannheyward/coc-texlab", { ["do"] = "yarn install --frozen-lockfile" })
Plug("fannheyward/coc-pyright", { ["do"] = "yarn install --frozen-lockfile" })

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

-- Themes
Plug("chriskempson/base16-vim")
Plug("itchyny/lightline.vim")

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

-- require'lspconfig'.bashls.setup{}
-- require'lspconfig'.clojure_lsp.setup{}
-- require'lspconfig'.dockerls.setup{}
-- require'lspconfig'.elmls.setup{}
-- require'lspconfig'.eslint.setup{}
-- require'lspconfig'.hls.setup{}
-- require'lspconfig'.jsonls.setup{}
-- require'lspconfig'.pyright.setup{}
-- require'lspconfig'.rnix.setup{}
-- require'lspconfig'.rust_analyzer.setup{}
-- require'lspconfig'.sumneko_lua.setup{}
-- require'lspconfig'.terraformls.setup{}
-- require'lspconfig'.texlab.setup{}
-- require'lspconfig'.tsserver.setup{}
-- require'lspconfig'.vimls.setup{}
--
-- vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
-- vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
--
-- let g:fsharp#automatic_workspace_init = 0
-- https://github.com/fsharp/FsAutoComplete/releases/latest/download/fsautocomplete.netcore.zip

vim.g.vimspector_enable_mappings = "HUMAN"
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
function SourceConfigFilesIn(directory)
  local directory_splat = "$HOME/dotfiles/nvim/" .. directory .. "/*.vim"
  local glob = vim.fn.glob(directory_splat)
  local config_files = vim.fn.split(glob, "\n")

  for i, config_file in ipairs(config_files) do
    if vim.fn.filereadable(config_file) then
      vim.api.nvim_command("source " .. config_file)
    end
  end
end
SourceConfigFilesIn("rcconfigurations")

function build_import(filename)
  lua_extension = filename:find("%.lua$")
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

vim.api.nvim_command("command! SavePlugSnapshot :lua SavePlugSnapshot()")
