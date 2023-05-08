{ config, lib, pkgs, ... }:

let
  cfg = config.modules.services.syncthing;
  user = "kelvin";        # TODO: user from parameters
  home = "/home/kelvin";
in
{
  options.modules.services.syncthing = with lib; {
    enable = mkEnableOption "syncthing, file syncronization";
  };

  config = lib.mkIf cfg.enable {
    services.syncthing = {
      enable = true;
      user = user;
      dataDir = "${home}/data";
      guiAddress = "0.0.0.0:8384";
      openDefaultPorts = true;
    };
    networking.firewall.allowedTCPPorts = [ 8384 ];
  };
}