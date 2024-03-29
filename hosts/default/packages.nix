{
  pkgs,
  inputs,
  ...
}: let
  ani-cli = pkgs.callPackage ../../modules/nix-os/ani-cli.nix {};
in {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    neovim
    steam-run
    ffmpeg
    libsixel
    anime4k
    rsync
    xwayland
    yt-dlp
    duf
    wl-clipboard
    cliphist
    openssl
    heroic
    du-dust
    zoxide
    fd
    ani-cli
    gcc
    protonup-qt
    gnome.nautilus
    libnotify
    libsForQt5.qt5.qtwayland
    playerctl
    spotify-player
    gtk3
    dbus
    ripgrep
    wget
    curl
    firefox
    xdg-utils
    aria2
    nitch
    calibre
    swww
    pulsemixer
    blueman
    nsxiv
    python3
    zip
    imagemagick
    unzip
    qemu
    zsh-powerlevel10k
    inputs.hyprland-contrib.packages."${pkgs.system}".grimblast
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
  ];

  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
}
