class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="0.54.0"
  current_release="20180221020527"
  current_sha256="3eb8f6e1f8145bad9edf1ceceafd7a97a10d1cab78e6c7ebec6b05e2b5e36fe7"

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
