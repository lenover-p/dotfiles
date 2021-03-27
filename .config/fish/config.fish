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
		curl wttr.in/ottawa\?format=v2
	else if set -q _flag_s
		curl wttr.in/ottawa\?format=3
	else
		curl wttr.in/ottawa
	end
end

function ala_opac
	argparse --name ala_opac --exclusive 'o,opaque,t,transparent' 'o/opaque=?' 't/transparent=?' -- $argv
	if test $status -ne 0
		return 1
	else if set -q _flag_o
		sed -i 's/background_opacity: [0-9]\.*[0-9]*/background_opacity: 1/' /home/lenov/.config/alacritty/alacritty.yml
	else if set -q _flag_t
		sed -i 's/background_opacity: [0-9]\.*[0-9]*/background_opacity: 0.8/' /home/lenov/.config/alacritty/alacritty.yml
	else
		echo "Error: Did not recieve option"
		return 1
	end
end

alias flashkeeb='cd /home/lenov/qmk_firmware/;make redox/rev1:lenov:avrdude'
alias dotfiles='/usr/bin/git --git-dir=/home/lenov/.dotfiles/ --work-tree=/home/lenov'
alias nv='nvim'
