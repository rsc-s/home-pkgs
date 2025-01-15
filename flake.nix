{
  description = "A pin of nixpkgs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    legacyPackages = nixpkgs.legacyPackages;
  };
}
