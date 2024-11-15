# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  channel = "stable-23.11"; 
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.nodejs_20
    pkgs.neovim
    pkgs.git
  ];
  idx = {
    workspace = {
      onCreate = {
        npm-install = "npm install";
        git-clone = "git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim";
      };
    };
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["npm" "run" "dev" "--" "--port" "$PORT" "--host" "0.0.0.0"];
          manager = "web";
        };
      };
    };
  };
}
