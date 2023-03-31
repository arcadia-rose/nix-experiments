{ config, pkgs, ... }:

{
  home.username = "spin";
  home.homeDirectory = "/home/spin";

  home.stateVersion = "22.11";

  home.packages = with pkgs; [
    git
    ripgrep
    fd
    tree
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    initExtra = ''
      export EDITOR="vim"
    '';
  };

  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
    ];
    extraConfig = ''
      filetype plugin on
      filetype indent on
      nnoremap <SPACE> <Nop>
      let mapleader = " "
      set hlsearch
      syntax enable
      set expandtab
      set smarttab
      set shiftwidth=2
      set tabstop=2
      set wrap
      set number
      set relativenumber
      nnoremap qwh :wincmd h<CR>
      nnoremap qwj :wincmd j<CR>
      nnoremap qwk :wincmd k<CR>
      nnoremap qwl :wincmd l<CR>
    '';
  };
}
