local rvm='%{$fg[green]%}$(rvm-prompt i v g)%{$reset_color%}'
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="✹ "
ZSH_THEME_GIT_PROMPT_DELETED="✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="➜ "
ZSH_THEME_GIT_PROMPT_UNMERGED=" ═ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="✭ "

PROMPT='%n:%3~
→ %{$reset_color%}'
RPROMPT="${return_code} ${git_branch} ${rvm}"
