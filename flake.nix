{
  description = "Nix flake for developing Python3 and jupyter";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      allSystems = [
        "x86_64-linux" # 64bit AMD/Intel x86
      ];

      forAllSystems = fn:
        nixpkgs.lib.genAttrs allSystems
          (system: fn { pkgs = import nixpkgs { inherit system; }; });

    in
    {
      devShells = forAllSystems ({ pkgs }: {
        default = pkgs.mkShell {
          name = "vulkan CPP dev shell";
          # gcc appears to be broken
          nativeBuildInputs = with pkgs ;[
            python3
            ## Phython stuff for plotting
            (python3.withPackages (ps: with ps; with python3Packages; [
              jupyter
              ipython
              matplotlib
              numpy
              ipympl
            ]))
          ];
          # TODO: include deps depending on XDG_SESSION_TYPE here (wayland vs X11)s
        };
      });
    };
}
