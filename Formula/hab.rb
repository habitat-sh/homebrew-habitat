class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="0.67.0"
  current_release="20181029215059"
  current_sha256="0e990d51a058709a5f64c7e4a111c475a13873c01cb9e9869664cef743634ed5"

  # Installing "openssl" ensures there's a certificate chain at
  # `/usr/local/etc/openssl/cert.pem`, which our OpenSSL library needs
  # in order to work.
  #
  # Users can install using `--without-openssl` if they don't want
  # this, in which case, they'll need to set `SSL_CERT_FILE` and / or
  # `SSL_CERT_DIR` to appropriate values.
  depends_on "openssl" => :recommended

  desc "The Habitat command line application"
  homepage "https://habitat.sh"
  url "https://bintray.com/habitat/stable/download_file?file_path=darwin%2Fx86_64%2Fhab-#{current_version}-#{current_release}-x86_64-darwin.zip"
  version current_version
  sha256 current_sha256.downcase

  def install
    bin.install "hab"
  end

  test do
    `#{bin}/hab --version`
  end
end
