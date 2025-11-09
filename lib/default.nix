{ pkgs }:

with pkgs.lib;
{
  licenses = pkgs.lib.licenses;
  maintainers = pkgs.lib.maintainers // {
    anttiharju = {
      email = "antti@harju.io";
      github = "anttiharju";
      githubId = 61745723;
      name = "Antti Harju";
    };
  };
}
