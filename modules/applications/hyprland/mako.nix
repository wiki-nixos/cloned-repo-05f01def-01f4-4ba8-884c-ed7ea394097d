{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    mako.enable = lib.mkEnableOption "Enable mako";
  };

  config = lib.mkIf config.mako.enable {
    services.mako = {
      enable = true;
      anchor = "top-center";
      defaultTimeout = 5000;
      borderSize = 3;
      borderRadius = 7;
      padding = "10";
      margin = "5";
      sort = "-time";
      format = "%s\\n%b\\n%a";
      extraConfig = ''
        outer-margin=30
        [urgency=low]
        border-color=${config.lib.stylix.colors.withHashtag.base0D}
        [urgency=normal]
        border-color=${config.lib.stylix.colors.withHashtag.base0C}
        [urgency=high]
        border-color=${config.lib.stylix.colors.withHashtag.base0B}
        default-timeout=20000
      '';
    };
  };
}
