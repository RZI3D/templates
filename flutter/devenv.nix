{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [
    pkgs.git
    pkgs.flutter
    pkgs.gum
  ];

  # https://devenv.sh/languages/
  # languages.rust.enable = true;

  # https://devenv.sh/processes/
  # processes.dev.exec = "${lib.getExe pkgs.watchexec} -n -- ls -la";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  scripts.wizard.exec = ''
    o=$(gum input --placeholder "com.example (Org)"); d=$(gum input --placeholder "Description"); t=$(gum choose "app" "module" "package" "plugin"); e="No"; [ "$t" = "app" ] && e=$(gum choose "No (Standard Template)" "Yes (--empty)"); p=$(gum choose --no-limit "ios" "android" "windows" "linux" "macos" "web" | paste -sd, -); f="--org ''${o:-com.example} --project-name $(basename "$PWD") --template $t"; [ "$e" = "Yes (--empty)" ] && f="$f --empty"; [ -n "$d" ] && f="$f --description '$d'"; [ -n "$p" ] && f="$f --platforms=$p"
    flutter create $f .
  '';

  # https://devenv.sh/basics/
  enterShell = ''
    [ -z "$(sh -c "ls -I devenv.nix -I devenv.yaml -I .envrc -I devenv.lock -I flake.nix -I flake.lock")" ] && clear && echo "Welcome to your devenv shell! The current directory is empty, run "wizard" to set up your project." || echo "Welcome to your devenv shell!"
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  # enterTest = ''
  #   echo "Running tests"
  #   git --version | grep --color=auto "${pkgs.git.version}"
  # '';

  # https://devenv.sh/git-hooks/
  # git-hooks.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
