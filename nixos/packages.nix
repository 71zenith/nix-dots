{
  pkgs,
  config,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Custom
    config.nur.repos.mic92.hello-nur

    # Cli
    ## internet
    aria2
    curl
    wget
    yt-dlp
    rsync
    ani-cli

    ## unix utils
    dust
    duf
    fd
    file
    sd
    ripgrep

    ## helpful
    gcc
    ffmpeg
    imagemagick
    sqlite
    grimblast
    cliphist
    xdg-utils
    sops
    swww
    playerctl
    wl-clipboard
    translate-shell
    pulsemixer
    nvtopPackages.nvidia

    ## nix
    nitch
    nix-init
    nix-output-monitor
    nurl
    nvd

    ## compression
    zip
    unzip
    rar
    unrar
    _7zz

    # gui
    calibre
    vesktop
    firefox
    librewolf
    qbittorrent
    nautilus
    qalculate-qt
    glava
    nsxiv
    dvd-zig

    ## games
    heroic
    prismlauncher
    steam-run
    protonup-qt

    ### emulators
    desmume
    mgba
    snes9x-gtk
    #config.nur.repos.chigyutendies.citra-nightly
    #config.nur.repos.chigyutendies.suyu-dev

    # libs
    libnotify
    gtk3
    libsixel
    openssl
    xwayland

    # dev
    ## doom emacs
    (aspellWithDicts (dicts: with dicts; [en en-computers en-science]))
    wordnet
    cmigemo

    ## docs
    man-pages
    man-pages-posix

    ## langs
    python3
    zig

    ## editors
    neovim
    lem-sdl2
    zed-editor

    # disabled
    #logseq
    #openmw
  ];
}
