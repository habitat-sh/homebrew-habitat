class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="0.35.0"
  current_release="20171007031819"
  current_sha256="bdae46faa34f09de5514f27c1d16adb6c50df8a8f848f1b643548025aef76ce9"

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
