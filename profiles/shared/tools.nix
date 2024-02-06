{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    curl
    rsync
    cachix
    helix
    htop
    neofetch
    coreutils
    file
    zellij
    gnupg
    glances
    sshping
  ];

  programs = {
    vim.enable = true;
    zsh = {
      enable = true;
      enableBashCompletion = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    tmux.enable = true;
    nix-index.enable = true;
    man.enable = true;
  };
}
