{ vscode-server, pkgs, ... }: {
  imports = [
    vscode-server.homeModules.default
  ];

  services.vscode-server.enable = true;
  services.vscode-server.enableFHS = true;
  services.vscode-server.nodejsPackage = pkgs.nodejs_22;
}
