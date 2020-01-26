## Looking at fixing

- consistent way of distinguishing between OSes/machines
- asinine abbreviations
- writing my own vim functions (lua?)
- turn off ctags for certain filetypes
- piping cli output to vim commands
- slow ruby scripts -> lua rewrites?

## Considering too much work until further notice:
- fzf repetitions: https://github.com/junegunn/fzf/issues/626

## Considering solved until further notice:
1. vim startup time
- plugins add 1-2ms to startup at most, except for:
  - coc adds about 11ms
  - vim-unimpaired adds 10-15ms
  - vim-tmux-navigator adds 4-5ms
  - rainbow-parens adds about 5ms

my personal config adds about 25ms, 
- around 3ms per file
- except: setting colorscheme adds about 10ms

startup time on linux is around 115ms worst case without airline and netrw call

2. ale vs coc system
- removed ale, enhanced coc

3. omz-theme-and-appearance file/ls colors in nix (just import from omz, consider modify env var if still annoying)
