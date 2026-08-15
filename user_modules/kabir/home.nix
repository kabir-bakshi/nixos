{config, pkgs, ...}:
{
  imports = [ ./dconf.nix ];

  home.username = "kabir";
  home.homeDirectory = "/home/kabir";
  

  /* 
  home.pointerCursor = {
    enable = true;
    name = "GoogleDot-Blue"; # The exact name of the theme folder inside the package
    package = pkgs.hello;
    size = 24;
    
    # Automatically apply to GTK (writes to dconf/gsettings)
    gtk.enable = true;
    
    # Uncomment if using X11 instead of Wayland
    # x11.enable = true;
  };

  # Ensure GTK configuration is enabled if you set gtk.enable = true above
  gtk.enable = true;

  home.sessionVariables = {
    XCURSOR_THEME = "GoogleDot-Blue";
    XCURSOR_SIZE = "24";
  };
  */

  programs = {
    bash = {
      enable = true;
      initExtra = ''
        fastfetch

        source ~/git-prompt.sh      
        
        PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\n\[\e[2m\]╭── \[\e[1;3m\]\[\e[0m\] \[\e[1;2;3m\]\u\[\e[0m\]  \n\[\e[2m\]├── \[\e[1;3m\]\[\e[0m\] \[\e[1;2;3m\]\H\n\[\e[0;2m\]├── \[\e[1;3m\]\[\e[0m\] \[\e[1;2;3m\]\w\[\e[38;5;230m\]$PS1_CMD1\n\[\e[0;2m\]│\n│\n\[\e[0m\]\[\e[1;2m\]╰── 󰥳 \[\e[0m\]'
      '';

      shellAliases = {
        la = "ls -al";

        crclone = "sh ~/Documents/rclone\\ sync.sh";

        # editconf = "sudo nvim /etc/nixos/configuration.nix";
        editflake = "sudo nvim /etc/nixos/flake.nix";

        nrs = "sudo nixos-rebuild switch";
        nfu = "sudo nix flake update --flake /etc/nixos && nrs";

        # smcs = "cd ~/Games/Sync\\ Sewer; sh start.sh";
      };
    };
  
    fastfetch = {
      enable = true;
      settings = {
        logo = {
          source = "nixos";
          padding = {
            top = 1;
            right = 4;
            left = 2;
          };
        };

        display = {
          size = {
            binaryPrefix = "si";
          };
          color = "blue";
          separator = "   ";
        };
        modules = [
          "break"
          "break"
          "break"
          "break"

          {
            type = "host";
            key = "PC";
            keyColor = "blue";
          }

          {
            type = "cpu";
            key = "󰻠 ";
            keyColor = "blue";
          }

          {
            type = "gpu";
            key = "󰍹 ";
            keyColor = "blue";
          }

          {
            type = "memory";
            key = "󰑭 ";
            keyColor = "blue";
          }

          "break"

          {
            type = "os";
            key = "OS";
            keyColor = "cyan";
          }

          {
            type = "kernel";
            key = "󰌽 ";
            keyColor = "cyan";
          }

          {
            type = "packages";
            key = "󰏗 ";
            keyColor = "cyan";
          }

          {
            type = "shell";
            key = "󰞷 ";
            keyColor = "cyan";
          }

          "break"

          {
            type = "de";
            key = "DE";
            keyColor = "blue";
          }

          {
            type = "wm";
            key = "󱂬 ";
            keyColor = "blue";
          }

          {
            type = "wmtheme";
            key = "󰉦 ";
            keyColor = "blue";
          }

          {
            type = "terminal";
            key = "󰆍 ";
            keyColor = "blue";
          }

          "break"
        ];
      };
    };
  };

  home.stateVersion = "25.11";
}
