class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="0.53.0"
  current_release="20180205211737"
  current_sha256="a2fbf5265a04851a86c6777cd8aa5ac23cd27c37a1e1ab859d88a40bc4b46d7f"

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
