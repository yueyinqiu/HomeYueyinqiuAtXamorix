{
  inputs = {    
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nixpkgs-master = {
      url = "github:NixOS/nixpkgs/master";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-server = {
      url = "github:nix-community/nixos-vscode-server";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      vscode-server,
      ...
    }:
    {
      homeConfigurations.yueyinqiu = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
          vscode-server = vscode-server;
        };
        modules = [
          ./src
        ];
      };
    };
}
