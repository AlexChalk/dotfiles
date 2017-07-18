# Pure Red Stars

# Only display host if this is via SSH
if [[ -n $SSH_CONNECTION ]]; then
    sshing="%n@%m "
else
    sshing=""
fi

# Fish shell-like prompt
_fishy_collapsed_wd() {
  echo $(pwd | perl -pe '
      BEGIN {
      binmode STDIN,  ":encoding(UTF-8)";
      binmode STDOUT, ":encoding(UTF-8)";
      }; s|^$ENV{HOME}|~|g; s|/([^/.])[^/]*(?=/)|/$1|g; s|/\.([^/])[^/]*(?=/)|/.$1|g
      ')
}

# Git prompt values
    ZSH_THEME_GIT_PROMPT_PREFIX=""
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}✶✶ %f"
    ZSH_THEME_GIT_PROMPT_CLEAN=""

# Format for git_prompt_long_sha() and git_prompt_short_sha()
    ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %F{white}[%F{yellow}"
    ZSH_THEME_GIT_PROMPT_SHA_AFTER="%F{white}]"

# prompt turns red if the previous command didn't exit with 0
    PROMPT='%{$fg_bold[blue]%}$sshing% %{$reset_color%}%F{blue}$(_fishy_collapsed_wd)%  %F{green}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)$(git_prompt_short_sha) $(parse_git_dirty)%(?.%F{green}.%F{red})❯%f '
