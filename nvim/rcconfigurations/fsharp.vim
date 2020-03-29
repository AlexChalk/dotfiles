if has('mac')
  let system_home = $HOME
  let fsharp_lsp_path = system_home . '/release-fsautocomplete/fsautocomplete.dll'
  call coc#config('languageserver.fsharp.args', [fsharp_lsp_path, '--background-service-enabled'])
endif
