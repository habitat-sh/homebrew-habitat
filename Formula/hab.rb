class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="0.37.0"
  current_release="20171018001010"
  current_sha256="0516ef3a4db6665bc9ed5f958470eae2bc98be7880472d7dbc5021890dada9fa"

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
