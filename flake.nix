{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
    flake-utils = {
      url = "github:numtide/flake-utils/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ attrs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        formatter = pkgs.alejandra;
        devShells.default = pkgs.mkShell {
          env = {
            LC_ALL = "C.UTF-8";
          };
          packages = with pkgs; [
            beanhub-cli
          ];
        };
      }
    );
}
