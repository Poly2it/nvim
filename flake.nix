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
    pkgs = import nixpkgs { inherit system; config.allowBroken = true; };
    inherit (pkgs) lib;
    neovim = pkgs.neovim.overrideAttrs (oldAttrs: let
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
        rust-analyzer
        cargo
        rustfmt
        rustc

        typescript-language-server

        # Rocks
        lua51Packages.luarocks-nix
        lua51Packages.magick
        lua5_1

        # image.nvim
        imagemagick
        mermaid-cli
        plantuml
        d2
        gnuplot
      ];
    in {
      pname = "neovim-polybit";
      nativeBuildInputs =
        (oldAttrs.nativeBuildInputs or [])
        ++ runtimeDependencies;
      installPhase =
        (oldAttrs.installPhase or "")
        + (
          runtimeDependencies
          |> map (x: "ln -s ${x.out}/bin/* $out/bin")
          |> lib.concatStringsSep "\n"
        );
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

