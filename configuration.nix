{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;
  time.timeZone = "America/Santiago";
  i18n.defaultLocale = "es_CL.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "la-latin1";
  };
  services.xserver.enable = true;
  programs.hyprland.enable = true;
  services.xserver.xkb.layout = "latam";
  services.xserver.displayManager.lightdm.enable = false;
  services.displayManager.ly.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    wireplumber.enable = true;
    jack.enable = true;
  };
  services.libinput.enable = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options ="--delete-older-than 3d";
  };

  programs.zsh.enable = true;
  users.users.felipe = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.zsh;
  };
  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    fastfetch
    kitty
    rofi
    swaynotificationcenter
    wl-clipboard
    cliphist
    brightnessctl
    pamixer
    yazi
    ffmpegthumbnailer
    unzip
    jq
    poppler
    fd
    ripgrep
    fzf
    zsh
    blender
    git
    inkscape
    hyprpaper
    neovim
    quickshell
    waybar
    crosspipe
    pwvucontrol
    libnotify
    powershell
    pandoc
    wl-clipboard
    lmms
    hyprlock
    jp2a
    cava
  ];
  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.symbols-only
    nerd-fonts.jetbrains-mono
    monaspace
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  fonts.fontDir.enable = true;
  services.openssh.enable = true;
  system.copySystemConfiguration = true;
  system.stateVersion = "26.05"; # Did you read the comment?
}
