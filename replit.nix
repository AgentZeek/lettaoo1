{pkgs}: {
  deps = [
    pkgs.docker
    pkgs.zlib
    pkgs.pkg-config
    pkgs.openssl
    pkgs.grpc
    pkgs.c-ares
    pkgs.bash
    pkgs.postgresql
    pkgs.libxcrypt
    pkgs.libyaml
  ];
}