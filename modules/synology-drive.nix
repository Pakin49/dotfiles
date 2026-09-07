{ config, pkgs, ... }:
{

  # configuration.nix (system level)
  environment.systemPackages = with pkgs; [
    sshfs
  ];

  systemd.tmpfiles.rules = [
    "d /home/pakin/SynologyDrive/ 0755 pakin users -"
  ];
  systemd.services."home-pakin-nas" = {
    description = "SSHFS mount to Synology NAS";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    before = [ "sleep.target" ];
    wantedBy = [ "multi-user.target" ];

    unitConfig = {
      ConditionPathExists = "/home/pakin/.ssh/nas_key";
      StartLimitIntervalSec = "600";
      StartLimitBurst = "5";
    };

    serviceConfig = {
      Type = "simple";
      User = "pakin";
      Group = "users";
      ExecStart = "${pkgs.sshfs}/bin/sshfs -f pakin@thamkunanon.synology.me:/homes/pakin /home/pakin/SynologyDrive -o IdentityFile=/home/pakin/.ssh/nas_key,reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 -o idmap=user";
      Restart = "on-failure";
      RestartSec = "5";
      ExecStopPost = "${pkgs.util-linux}/bin/fusermount -u /home/pakin/SynologyDrive";
    };
  };

  # The actual suspend hook — now trivial since everything's system-scoped
  systemd.services."home-pakin-nas-suspend" = {
    description = "Stop sshfs mount before suspend";
    before = [ "sleep.target" ];
    wantedBy = [ "sleep.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.systemd}/bin/systemctl stop home-pakin-nas";
      ExecStop = "${pkgs.systemd}/bin/systemctl start home-pakin-nas";
    };
  };
}
