{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit
    (lib)
    mkEnableOption
    mkPackageOption
    mkOption
    types
    literalExpression
    mkIf
    ;
  cfg = config.programs.spotify-player;
  tomlFormat = pkgs.formats.toml {};
in {
  meta.maintainers = with lib.hm.maintainers; [zen];
  options.programs.spotify-player = {
    enable = mkEnableOption "spotify-player";

    package = mkPackageOption pkgs "spotify-player" {};

    settings = mkOption {
      type = tomlFormat.type;
      default = {};
    };
    themes = mkOption {
      type = types.listOf tomlFormat.type;
      default = [];
    };
    keymaps = mkOption {
      type = types.listOf tomlFormat.type;
      default = [];
    };
  };
  config = mkIf cfg.enable {
    home.packages = [cfg.package];

    xdg.configFile = {
      "spotify-player/app.toml" = mkIf (cfg.settings != {}) {
        source = tomlFormat.generate "spotify-player-app" cfg.settings;
      };
      "spotify-player/theme.toml" = mkIf (cfg.themes != []) {
        source = tomlFormat.generate "spotify-player-theme" {inherit (cfg) themes;};
      };
      "spotify-player/keymap.toml" = mkIf (cfg.keymaps != []) {
        source = tomlFormat.generate "spotify-player-keymap" {
          inherit (cfg) keymaps;
        };
      };
    };
  };
}
