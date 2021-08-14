function fish_prompt
	set -l last_command_status $status
	set -l cwd
	set -l cwd
	set cwd (prompt_pwd)

	set -l fish     "λ"
	set -l ahead    "↑"
	set -l behind   "↓"
	set -l diverged "⥄ "
	set -l dirty    "⨯"
	set -l none     "◦"
	
	set -l normal_color     (set_color normal)
	set -l success_color    (set_color $fish_color_comment 2> /dev/null; or set_color cyan)
	set -l error_color      (set_color $fish_color_error 2> /dev/null; or set_color red --bold)
	set -l directory_color  (set_color $fish_color_comment 2> /dev/null; or set_color cyan)
	# set -l directory_color  (set_color $fish_color_quote 2> /dev/null; or set_color brown)
	set -l repository_color (set_color $fish_color_cwd 2> /dev/null; or set_color green)
	
	
	if git_is_repo
		if test $last_command_status -eq 0
			echo -n -s $success_color "╭─" $directory_color $cwd $normal_color
		else
			echo -n -s $error_color "╭─" $directory_color $cwd $normal_color
		end
		echo -n -s " on " $repository_color (git_branch_name) $normal_color " "
		
		if git_is_touched
			echo -n -s $dirty
		else
			echo -n -s (git_ahead $ahead $behind $diverged $none)
		end
	else
		if test $last_command_status -eq 0
			echo -n -s $success_color "╭─" $directory_color $cwd $normal_color
		else
			echo -n -s $error_color "╭─" $directory_color $cwd $normal_color
		end
	end
	
	if test $last_command_status -eq 0
		echo -e ''
		echo -n -s $success_color "╰─" $fish $normal_color
	else
		echo -e ''
		echo -n -s $error_color "╰─" $error_color $fish $normal_color
	end
	echo -n -s " "
end
