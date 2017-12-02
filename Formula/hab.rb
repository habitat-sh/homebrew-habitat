class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="0.50.3"
  current_release="20171201233208"
  current_sha256="5311d0d80df04179e6dd98a5caa6eff6e9580a01eec9a0904d6836d03fc47f5a"

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
