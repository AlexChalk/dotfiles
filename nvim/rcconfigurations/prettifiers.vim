cnoreabbrev PrettyJson %!jq .
cnoreabbrev MinifyJson %!jq -c .
cnoreabbrev PrettyXml %!xq .
cnoreabbrev MinifyXml %!minify --type=xml

nmap <leader>fj :PrettyJson<cr>
vmap <leader>fj :PrettyJson<cr>
xmap <leader>fj :PrettyJson<cr>
nmap <leader>mj :MinifyJson<cr>
nmap <leader>fx :PrettyXml<cr>
nmap <leader>mx :MinifyXml<cr>
