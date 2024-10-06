{
  description = "My own Neovim flake";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };
  };
  outputs = { nixpkgs, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    inherit (pkgs) lib;
    neovim = pkgs.neovim.overrideAttrs (oldAttrs:
    let
      runtimeDependencies = with pkgs; [
        git

        tree-sitter
        gcc

        wl-clipboard
        ripgrep

        clang-tools
        lua-language-server
        nixd
        basedpyright
      ];
    in
    {
      pname = "neovim-polybit";
      nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ runtimeDependencies;
      installPhase = (oldAttrs.installPhase or "") + lib.concatStringsSep "\n" (map (x: "ln -s ${x.out}/bin/* $out/bin") runtimeDependencies);
      postFixup = ''
        wrapProgram $out/bin/nvim --prefix PATH : ${pkgs.lib.makeBinPath runtimeDependencies}
      '';
    });
  in
  {
    packages.x86_64-linux.default = neovim;
    apps.x86_64-linux.default = {
      type = "app";
      program = "${neovim}/bin/nvim";
      dependencies = with pkgs; [ gcc ];
    };
  };
}

