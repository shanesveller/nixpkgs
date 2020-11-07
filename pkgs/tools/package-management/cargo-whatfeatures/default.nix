{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage rec {
  pname = "cargo-whatfeatures";
  version = "0.9.6";

  src = fetchFromGitHub {
    owner = "museun";
    repo = pname;
    rev = "v${version}";
    sha256 = "0vki37pxngg15za9c1z61dc6sqk0j59s0qhcf9hplnym4ib5kqx1";
  };

  cargoSha256 = "nNV7UXjKZNFmTqW4H0qsNuBW9XOP2V9nfotewtI9mYE=";

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ];

  meta = with stdenv.lib; {
    description = "a simple cargo plugin to get a list of features for a specific crate";
    homepage = "https://github.com/museun/cargo-whatfeatures";
    license = with licenses; [ asl20 /* or */ mit ];
    maintainers = with maintainers; [ ];
  };
}
