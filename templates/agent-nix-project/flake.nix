{
  description = "Agent-friendly project development shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems =
        f:
        nixpkgs.lib.genAttrs systems (
          system:
          f {
            pkgs = import nixpkgs { inherit system; };
          }
        );
    in
    {
      devShells = forAllSystems (
        { pkgs }:
        {
          default = pkgs.mkShell {
            packages = [
              (pkgs.nodejs_26 or pkgs.nodejs_latest)
              pkgs.corepack
              pkgs.bun
              pkgs.just
              pkgs.git
              pkgs.ripgrep
              pkgs.fd
              pkgs.jq
              pkgs.curl
              pkgs.openssl
              pkgs.pkg-config
            ];

            shellHook = ''
              corepack enable --install-directory "$PWD/.corepack" >/dev/null 2>&1 || true
              export PATH="$PWD/.corepack:$PATH"
              echo "Nix dev shell ready. Run: just ci"
            '';
          };
        }
      );
    };
