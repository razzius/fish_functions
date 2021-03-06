if not status is-interactive
    exit
end

for f in ~/.config/fish/functions/private/*
  source $f
end

# Binds option-up
bind \e\[1\;5A history-token-search-backward
# Binds super-up (for emacs vterm integration, where there is no "option"
bind \e\[1\;2A history-token-search-backward

# option-down
bind \e\[1\;5B history-token-search-forward
# super-down
bind \e\[1\;2B history-token-search-forward

# Make C-t transpose characters :)
bind \ct transpose-chars

source ~/.profile
source ~/.fish_abbrs.fish

function postexec_source_profile --on-event fish_postexec
    if test "$argv" = "vi ~/.profile"
        echo -n 'Sourcing .profile... '
        source ~/.profile
        echo Done.
    end

    if test "$argv" = "vi /etc/hosts"
        echo -n 'Flushing dns... '
        dscacheutil -flushcache
        echo Done.
    end
end

# Emacs vterm integration causes an error in vim :terminal
if string-empty $VIM
    function fish_vterm_prompt_end --on-event fish_prompt
        printf '\e]51;A'(whoami)'@'(hostname)':'(pwd)'\e\\'
    end
end
