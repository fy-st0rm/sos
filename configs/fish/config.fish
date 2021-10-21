if status is-interactive
    # Commands to run in interactive sessions can go here
end

# To remove greeting
set fish_greeting

# Git status
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'no'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'

# Git colors
set __fish_git_prompt_color cyan
set __fish_git_prompt_color_branch brmagenta
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red
set __fish_git_prompt_color_dirtystate red
set __fish_git_prompt_color_untrackedfiles red
set __fish_git_prompt_color_stagedstate bryellow

# Status Chars
set __fish_git_prompt_char_dirtystate 'X'
set __fish_git_prompt_char_stagedstate '+'
set __fish_git_prompt_char_untrackedfiles '!'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑ '
set __fish_git_prompt_char_upstream_behind '↓ '
set __fish_git_prompt_char_upstream_equal ''


function fish_prompt
	set_color brred
	printf '['
	
	set_color bryellow
	printf '%s@' "$USER"

	set_color brblue 
	printf '%s ' "$hostname"

	set_color brgreen
	printf '%s' (prompt_pwd)
	
	set_color brred
	printf ']'
	
	set_color normal
	printf '%s' (fish_git_prompt)
	set_color brcyan
	printf '$ '
end


# Enabling starship prompt
# starship init fish | source

# [Custom] Auto start
# sfetch
colorscript -e panes
