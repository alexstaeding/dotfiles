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
        ++ lib.optionals stdenv.hostPlatform.isLinux [
          powertop
          s-tui
        ]
        ++ lib.optionals stdenv.hostPlatform.isDarwin [
          iterm2
          macpm
        ];
    };
}
