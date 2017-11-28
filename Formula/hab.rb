class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="0.40.0"
  current_release="20171128173702"
  current_sha256="f5a6293da056c7432205db94b60776f9573c8bf34af5b87b9dda3b98a98e045a"

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
