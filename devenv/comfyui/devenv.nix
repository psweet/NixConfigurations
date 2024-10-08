{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  languages.python = {
    enable = true;
    venv.enable = true;
  };

  # https://devenv.sh/packages/
  packages = [
    pkgs.git
    pkgs.zstd
  ];

  tasks = {
    "python:setup" = {
      exec = ''
        python -c "import torchvision" &> /dev/null || {
          echo "Venv packages not installed. Installing..."
          pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm6.2
          pip install -r requirements.txt
        }
      '';
      after = [ "devenv:python:virtualenv" ];
    };
    "devenv:enterShell".after = [ "python:setup" ];
  };

  enterShell = ''
    python main.py || echo "Restart"
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}