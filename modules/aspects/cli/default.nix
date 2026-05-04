{ ... }:
{
  flake.modules.homeManager.cli =
    { pkgs, lib, ... }:
    {
      home.packages =
        with pkgs;
        [
          # Navigation & search
          zoxide
          fzf
          tree
          walk

          # File operations
          rsync
          unzip
          unrar
          p7zip
          zstd
          cabextract

          # System monitoring
          btop
          ncdu
          bmon
          tmux
          screen
          watch

          # Git
          git
          git-annex
          git-quick-stats
          gh

          # Network
          nmap
          iperf
          iperf2
          ookla-speedtest
          sshfs

          # Hardware (Linux)
          pciutils
          smartmontools
          ipmitool

          # Misc
          wget
          file
          killall
          fastfetch
          coreutils-full
          gnumake
          ruby
          libyaml
        ]
        ++ lib.optionals pkgs.stdenv.isLinux [
          ethtool
          powertop
          s-tui
        ]
        ++ lib.optionals pkgs.stdenv.isDarwin [
          iterm2
          macpm
        ];
    };
}
