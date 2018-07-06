" Adding/removing/viewing/splitting

nnoremap <leader>gcc :Gcommit<cr>
nnoremap <leader>gca :Gcommit --amend<cr>
nnoremap <leader>grf :Gread<cr>
nnoremap <leader>gsf :Gwrite<cr>
nnoremap <leader>guf :silent exec '!git unstage %'<cr>
nnoremap <leader>gaa :silent exec '!git aa'<cr>
nnoremap <leader>gua :silent exec '!git unstage .'<cr>
nnoremap <leader>ge<space> :Gedit<space>
nnoremap <leader>gec :Gedit<cr>
nnoremap <leader>gdf<space> :Gvdiff<space>
nnoremap <leader>gdfc :Gvdiff<cr>
nnoremap <leader>gvs :Gvsplit<space>
nnoremap <leader>gvsc :Gvsplit<cr>

" Logging/searching 

nnoremap <leader>glr :Glog<cr>
nnoremap <leader>glc :Glog -- %<cr>
" To search on other branches: Ggrep 'text' branch
nnoremap <leader>gg :Ggrep
" To search commit messages for text: Glog --grep=text --
nnoremap <leader>gscm :Glog --grep= --<left><left><left>
" To search for text added or removed by commit: Glog -Stext --
nnoremap <leader>gscc :Glog -S --<left><left><left>

" Diffing 
" [c — jump to previous change hunk
" ]c — jump to next change hunk
nnoremap <leader>gfp :only<cr>

" Two-way diffing
xnoremap <leader>gsh :diffput \| diffupdate<cr>
xnoremap <leader>gcoh :diffget \| diffupdate<cr>
nnoremap <leader>gsh :diffput \| diffupdate<cr>
nnoremap <leader>gcoh :diffget \| diffupdate<cr>

" Three-way diffing (merge conflicts)

" No visual-line mappings for diffget, because fugitive isn't smart
" enough to correctly diffget partial hunks in a merge conflict.
xnoremap <leader>gsch :diffput 1 \| diffupdate<cr>

nnoremap <leader>gsfh :diffget //3 \| diffupdate<cr>
nnoremap <leader>gsmh :diffget //2 \| diffupdate<cr>
nnoremap <leader>gsch :diffput 1 \| diffupdate<cr>

nnoremap <leader>gFsf :Gwrite!<cr>

" Viewing commits
" - to go to parent commit
" <cr> on tree to view filesystem
" <cr> for subdir, - for parent dir
" C to go back to commit when in tree
" a to toggle view type
nnoremap <leader>gvlc :Gedit HEAD^{}<cr>

" Praise
" o to open commit in split O for tab, g? to see other options
nnoremap <leader>gp :Gblame<cr>

" Status
" <CR> edit
" o open in split
" S open in vsplit
" U checkout
" g? other options
nnoremap <leader>gss :Gstatus<cr>
