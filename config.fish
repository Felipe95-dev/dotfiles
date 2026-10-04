if status is-interactive
	abbr -a config 'sudo -E nvim /etc/nixos/configuration.nix'
	abbr -a nrs 'sudo nixos-rebuild switch'
	abbr -a rwb 'pkill -SIGUSR2 waybar'
	abbr -a fetch 'nix run github:areofyl/fetch --offline'
	set -gx EDITOR nvim
	abbr -a re 'source ~/dotfiles/config.fish'
end
