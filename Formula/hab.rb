class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="0.39.1"
  current_release="20171117234750"
  current_sha256="ca735f66c701a74285ccae6dfef2427fbdc2322cb658610e40c85c5f650e5c2e"

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
