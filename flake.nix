{
  description = "Experiment with nix flakes that sets up a scheme project";

  inputs = {
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {self, nixpkgs, ...}@inputs: inputs.utils.lib.eachSystem [
    "x86_64-linux"
  ] (system: 
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell rec {
          packages = with pkgs; [
            mitscheme
            racket
            chez
          ];
        };
      }
    );
}
