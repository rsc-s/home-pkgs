{
  description = "Locally-installed packages";

  inputs = {
    # nixpkgs-input.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    pac-input.url = "github:katrinafyi/pac-nix";
  };

  outputs = { self, pac-input }:

    let
      system = "x86_64-linux";
      pac = pac-input.packages.${system};
      pkgs = pac-input.inputs.nixpkgs.legacyPackages.${system};
    in {
      packages.${system}.default = pkgs.buildEnv {
        name = "local-profile-packages";
        ignoreCollisions = true;
        paths = [
          pkgs.git-branchless
          pkgs.cntr
          pkgs.cachix
          pkgs.lix
          pkgs.creduce
          pkgs.drawio-headless
          pkgs.nix-output-monitor
          pkgs.nix-tree
          pkgs.nix-update
          pkgs.nurl
          pkgs.zotero
          pkgs.pycdc
          pkgs.steghide
          pkgs.terraform
          pkgs.nix-diff
          pkgs.cvc5
          # pkgs.lua51Packages.lua

          pkgs.nixfmt-rfc-style

          pac.bnfc-treesitter

          pkgs.gladtex

          pac.ddisasm
          pac.gtirb-semantics
          pac.gtirb-pprinter
          pac.aslp
          pac.basil

          pkgs.pkgsCross.aarch64-multiplatform.pkgsBuildHost.gcc
          pkgs.pkgsCross.aarch64-multiplatform.pkgsBuildHost.clang
          # pkgs.z3_4_8
        ];
      };
    };
}
