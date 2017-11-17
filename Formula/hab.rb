class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="0.39.0"
  current_release="20171116224428"
  current_sha256="2A81E7DA6F75CF0923924FFF11DC78ACF8F0C4ED389B41F6742622601F1293CB"

  desc "The Habitat command line application"
  homepage "https://habitat.sh"
  url "https://bintray.com/habitat/stable/download_file?file_path=darwin%2Fx86_64%2Fhab-#{current_version}-#{current_release}-x86_64-darwin.zip"
  version current_version
  sha256 current_sha256

  def install
    bin.install "hab"
  end

  test do
    `#{bin}/hab --version`
  end
end
