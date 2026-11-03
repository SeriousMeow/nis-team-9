{
  description = "GC3 schedule correctness";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs = { nixpkgs, ... }:
    let
      systems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      devShells = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
          msccl = pkgs.python312Packages.buildPythonPackage {
            pname = "msccl";
            version = "2.3.0";
            pyproject = true;
            src = pkgs.fetchFromGitHub {
              owner = "microsoft";
              repo = "msccl-tools";
              rev = "030a750fc56e03fb863ffe48268672d84d4cdc7b";
              hash = "sha256-enxeYu8Yj7AvwH8ftnPJN33QBnBK/18LfiB/xxP29gE=";
            };
            build-system = [ pkgs.python312Packages.setuptools ];
            pythonRemoveDeps = [ "z3-solver" ];
            dependencies = with pkgs.python312Packages; [
              z3-solver argcomplete lxml humanfriendly tabulate
              (igraph.overridePythonAttrs (_: {
                doCheck = false;
                nativeCheckInputs = [];
              }))
            ];
            pythonImportsCheck = [ "msccl" "msccl.language" ];
            doCheck = false;
          };
          python = pkgs.python312.withPackages (_: [ msccl ]);
        in
        {
          default = pkgs.mkShell {
            packages = [ python ];
          };
        });
    };
}
