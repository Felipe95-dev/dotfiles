if status is-interactive
	abbr -a config 'codium /etc/nixos/configuration.nix & disown'
	abbr -a nrs 'sudo nixos-rebuild switch'
	abbr -a rwb 'pkill -SIGUSR2 waybar'
	abbr -a fetch 'nix run github:areofyl/fetch --offline'
	set -gx EDITOR nvim
	abbr -a re 'source ~/dotfiles/config.fish'
end
