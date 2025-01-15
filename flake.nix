{
  description = "Locally-installed packages";

  inputs = {
    nixpkgs-input.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    pac-input.url = "github:katrinafyi/pac-nix";
  };

  outputs = { self, nixpkgs-input, pac-input }:

    let
      system = "x86_64-linux";
      pac = pac-input.packages.${system};
      pkgs = nixpkgs-input.legacyPackages.${system};
    in {
      packages.${system}.default = pkgs.buildEnv {
        name = "local-profile-packages";
        paths = [
          pkgs.git-branchless
          pkgs.cntr
          pkgs.cachix
          pkgs.nix-output-monitor
          pkgs.nix-tree
          pkgs.nix-update
          pkgs.nurl
          pkgs.zotero
        ];
      };
    };
}
