{ pkgs }:

pkgs.lib // {
  maintainers = pkgs.lib.maintainers // {
    anttiharju = {
      email = "antti@harju.io";
      github = "anttiharju";
      githubId = 61745723;
      name = "Antti Harju";
    };
  };
}
