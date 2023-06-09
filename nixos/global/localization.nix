# This setups a localization.

{ lib, config, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
    ];
    inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
        enableRimeData = true;
        addons = with pkgs; [
          fcitx5-rime
          fcitx5-gtk
          fcitx5-lua
        ];
      };
    };
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "Hack"
          "JetBrainsMono"
        ];
      })
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji # Color and Black-and-White emoji fonts
      twemoji-color-font # Twitter emoji
    ];
    fontconfig.defaultFonts = {
      serif = [
        "Noto Sans CJK SC"
        "Noto Sans"
      ];
      sansSerif = [
        "Noto Sans CJK SC"
        "Noto Sans"
      ];
      monospace = [
        "Noto Sans Mono CJK SC"
        "Symbols Nerd Font"
      ];
      emoji = [
        "Twemoji"
      ];
    };
  };
}
