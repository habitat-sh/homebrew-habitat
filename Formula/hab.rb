class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="0.88.0"
  current_sha256="410ff097fe64b2bff6d611a97664ed1e6384822ffd81d940a06aa1052889c570"

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
  url = if current_version == "0.88.0"
    "https://bintray.com/habitat/stable/download_file?file_path=darwin%2Fx86_64%2Fhab-0.88.0-20191009205151-x86_64-darwin.zip"
  else
    "https://packages.chef.io/files/habitat/#{version}/hab-x86_64-darwin.zip"
  end
  version current_version
  sha256 current_sha256.downcase

  def install
    bin.install "hab"
  end

  test do
    `#{bin}/hab --version`
  end
end
