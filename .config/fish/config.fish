set fish_greeting 

function fish_right_prompt
  # intentionally left blank
end

thefuck --alias | source

function weather
	argparse --name weather --exclusive 'v,verbose,s,short' 'v/verbose=?' 's/short=?' -- $argv
	if test $status -ne 0
		return 1
	else if set -q _flag_v
		curl wttr.in/(xrescat i3xrocks.weather.location)\?format=v2
	else if set -q _flag_s
		curl wttr.in/(xrescat i3xrocks.weather.location)\?format=3
	else
		curl wttr.in/(xrescat i3xrocks.weather.location)
	end
end

function rcd
    set tmpfile "/tmp/pwd-from-ranger"
    ranger --choosedir=$tmpfile $argv
    set rangerpwd (cat $tmpfile)
    if test "$PWD" != $rangerpwd
        cd $rangerpwd
    end
end

alias flashkeeb='cd /home/lenov/qmk_firmware/;make redox/rev1:lenov:avrdude'
alias dotfiles='/usr/bin/git --git-dir=/home/lenov/.dotfiles/ --work-tree=/home/lenov'
alias nv='nvim'
alias t="todo.sh"
