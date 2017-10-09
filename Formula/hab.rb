class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="0.36.0"
  current_release="20171009050124"
  current_sha256="3c4ca43b1206c56cd61e4bb22d7659913528378b7b5a1d192105318887a77e86"

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
