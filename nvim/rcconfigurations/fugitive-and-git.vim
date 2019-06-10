
" :1:%            The current file's common ancestor during a conflict
" :2:#            The alternate file in the target branch during a conflict
" :3:#5           The file from buffer #5 in the merged branch during a conflict

" Adding/removing/viewing/splitting

nnoremap <leader>gcc :Gcommit<cr>
nnoremap <leader>gca :Gcommit --amend<cr>
nnoremap <leader>gcof :Gread<cr>
nnoremap <leader>gaf :Gwrite<cr>
nnoremap <leader>guf :silent exec '!git unstage %'<cr>
nnoremap <leader>gaa :silent exec '!git aa'<cr>
nnoremap <leader>gua :silent exec '!git unstage .'<cr>
nnoremap <leader>ge<space> :Gedit<space>
nnoremap <leader>gec :Gedit<cr>
nnoremap <leader>gdf<space> :Gvdiff<space>
nnoremap <leader>gdfc :Gvdiff<cr>
nnoremap <leader>gdfm :Gvdiff master:%<cr>
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
xnoremap <leader>gsph :diffput \| diffupdate<cr>
xnoremap <leader>gsh :diffget \| diffupdate<cr>
nnoremap <leader>gsph :diffput \| diffupdate<cr>
nnoremap <leader>gsh :diffget \| diffupdate<cr>

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
" Browse in github
nnoremap <leader>gb :Gbrowse<cr>
xnoremap <leader>gb :Gbrowse<cr>

" Review a PR
nnoremap <leader>grpr :Git! request-pull -p master ./<cr>
nnoremap <leader>grp<space> :Git! request-pull -p  ./<left><left><left>
nnoremap <leader>gdfaf :Git! diff HEAD<cr>
nnoremap <leader>gdfa<space> :Git! diff<space>

" Fix line length on commit messages: gqip
