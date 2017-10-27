class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="0.38.0"
  current_release="20171026215116"
  current_sha256="2ffcbf5520445ff0471b71657bb24005e11adb94644d6c4e5f953e68efb74df4"

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
