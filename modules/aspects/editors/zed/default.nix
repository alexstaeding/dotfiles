{ ... }:
{
  flake.modules.homeManager.zed =
    { pkgs, lib, ... }:
    {
      enable = true;
      # Uncomment for bleeding edge from zed repo
      # package = pkgs.zed-latest;
      extensions = [
        "nix"
        "material-theme"
        "material-icon-theme"
      ];
      userSettings = {
        vim_mode = true;
        terminal.option_as_meta = true;
        load_direnv = "shell_hook";
        preview_tabs.enabled = false;
        minimap.show = "never";
        autosave = "on_focus_change";
        use_on_type_format = true;
        ensure_final_newline_on_save = true;
        tab_size = 2;
        base_keymap = "VSCode";
        ui_font_size = 14;
        buffer_font_size = 12;
        icon_theme = "Material Icon Theme";
        theme = {
          mode = "system";
          light = "Material Theme";
          dark = "Material Theme Ocean";
        };
        lsp.nixd.binary.path = lib.getExe pkgs.nixd;
      };
    };
}
