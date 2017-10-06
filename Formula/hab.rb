class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="0.34.1"
  current_release="20171002011028"
  current_sha256="c0ed40914484f7cdcb2ff12cd5369ec23a262ce8c165185e037bbb4e33b69781"

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
