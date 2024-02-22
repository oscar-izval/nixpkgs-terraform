{ pkgs, ... }:

{
  packages =
    let
      update_versions = pkgs.writers.writePython3Bin "update_versions"
        {
          libraries = with pkgs.python3Packages; [ pygithub semver ];
        }
        (builtins.readFile ./update-versions.py);
    in
    [
      update_versions
      pkgs.git
    ];

  languages.javascript.enable = true;

  pre-commit.hooks.flake8.enable = true;
  pre-commit.hooks.nixpkgs-fmt.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
