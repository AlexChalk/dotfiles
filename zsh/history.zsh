## Command history configuration
if [ -z "$HISTFILE" ]; then
  HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=50
SAVEHIST=50

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt extended_history # save timestamp and duration
setopt hist_verify # don't execute after selection, let user modify
setopt share_history # read from and write to hist file entries for other concurrent sessions
setopt hist_ignore_dups # Do not record an event that was just recorded again.
setopt hist_find_no_dups
