class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="0.51.0"
  current_release="20171218220542"
  current_sha256="aece1e1e503b039a3180052763698157f3e981c0a8da9a867415ff83d6c630ae"

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
