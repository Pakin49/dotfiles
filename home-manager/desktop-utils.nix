{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    #dev
    fuse3

    # desktop utils
    bluetui
    wiremix
    brightnessctl
    btop
    aria2
    qalculate-gtk
    #gimp
    jmtpfs
    gnome-clocks

    # Media
    zathura
    mpv
    imv

    vesktop
    keymapp

    #libreoffice
    #thunderbird
    aerc
    bitwarden-desktop
  ];

}
