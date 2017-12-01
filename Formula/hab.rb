class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="0.50.2"
  current_release="20171201033503"
  current_sha256="ab5609d3c6a78457ae52911d4ba32c75c7cd96d0cb16f71f0d129c3356504485"

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
