# Brew
eval (/opt/homebrew/bin/brew shellenv)

# --- Abbreviations ---
# Git
abbr -a g git
abbr -a ga 'git add -p'
abbr -a gc 'git commit'
abbr -a gco 'git checkout'
abbr -a gcp 'git cherry-pick'
abbr -a gdiff 'git diff'
abbr -a gl 'git log'
abbr -a gp 'git push'
abbr -a gs 'git status'
abbr -a gt 'git tag'
abbr -a gah 'git stash; and git pull --rebase; and git stash pop'
abbr -a pr 'gh pr create -t (git show -s --format=%s HEAD) -b (git show -s --format=%B HEAD | tail -n+3)'

# Editor
abbr -a vim hx
abbr -a vi hx
abbr -a e nvim

# General
abbr -a m make
abbr -a c cargo
abbr -a ct 'cargo t'

# ls → eza if available
if command -v eza > /dev/null
    abbr -a l 'eza'
    abbr -a ls 'eza'
    abbr -a ll 'eza -l'
    abbr -a lll 'eza -la'
else
    abbr -a l 'ls'
    abbr -a ll 'ls -l'
    abbr -a lll 'ls -la'
end

# --- Gruvbox Dark Hard fish colors ---
set -g fish_color_normal d5c4a1
set -g fish_color_command b8bb26
set -g fish_color_param d5c4a1
set -g fish_color_quote fabd2f
set -g fish_color_error fb4934
set -g fish_color_redirection d3869b
set -g fish_color_end fe8019
set -g fish_color_comment 665c54
set -g fish_color_selection --background=504945
set -g fish_color_search_match --background=504945
set -g fish_color_operator 8ec07c
set -g fish_color_escape 8ec07c
set -g fish_color_autosuggestion 665c54
set -g fish_color_valid_path --underline
set -g fish_pager_color_prefix fabd2f
set -g fish_pager_color_completion d5c4a1
set -g fish_pager_color_description 665c54
set -g fish_pager_color_progress 83a598

# --- FZF ---
set -gx FZF_DEFAULT_COMMAND 'fd --type file --follow'
set -gx FZF_CTRL_T_COMMAND 'fd --type file --follow'
set -gx FZF_DEFAULT_OPTS '--height 20%'

# --- Colored man pages ---
setenv LESS_TERMCAP_mb \e'[01;31m'
setenv LESS_TERMCAP_md \e'[01;38;5;74m'
setenv LESS_TERMCAP_me \e'[0m'
setenv LESS_TERMCAP_se \e'[0m'
setenv LESS_TERMCAP_so \e'[38;5;246m'
setenv LESS_TERMCAP_ue \e'[0m'
setenv LESS_TERMCAP_us \e'[04;38;5;146m'

# --- Git prompt settings ---
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

# --- Prompt (gruvbox-themed, from Linux config) ---
function fish_prompt
    set_color brblack
    echo -n "["(date "+%H:%M")"] "
    set_color blue
    echo -n (hostname -s)
    if [ $PWD != $HOME ]
        set_color brblack
        echo -n ':'
        set_color yellow
        echo -n (basename $PWD)
    end
    set_color green
    printf '%s ' (__fish_git_prompt)
    set_color red
    echo -n '| '
    set_color normal
end

# --- Navigate to repo root ---
function d
    while test $PWD != "/"
        if test -d .git
            break
        end
        cd ..
    end
end

# --- Tmux auto-start (uncomment if desired) ---
# if status --is-interactive
#     if ! set -q TMUX
#         exec tmux new-session
#     end
# end

# --- Ctrl+Z to fg ---
function fish_user_key_bindings
    bind \cz 'fg>/dev/null ^/dev/null'
    if functions -q fzf_key_bindings
        fzf_key_bindings
    end
end
