{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware.nix
    ./packages.nix
    ./stylix.nix
    inputs.home-manager.nixosModules.default
  ];

  nix = {
    settings.auto-optimise-store = true;
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };


  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "izanagi";
  networking.wireless.enable = false;

  networking.networkmanager.enable = true;


  security.sudo.extraRules = [
    { users = [ "zen" ];
      commands = [
        {
          command = "ALL" ;
          options = ["NOPASSWD" ];
        }
      ];
    }
  ];

  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-122n.psf.gz";
    packages = with pkgs; [ terminus_font ];
  };

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  programs.zsh.enable = true;

  users.users.zen = {
    isNormalUser = true;
    description = "Mori Zen";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  home-manager = {
  extraSpecialArgs = { inherit inputs ; };
  users = {
    "zen" = import ./desktop.nix;
    };
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
  };

  xdg.portal.wlr.enable = true;

  system.stateVersion = "24.05";
}
