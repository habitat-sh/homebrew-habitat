class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="0.90.6"
  current_sha256="b35128f2dced346decbb405f0a7fbbe3be73d76a8155dcb0a5d70476a5da5510"
  source_url = if current_version == "0.88.0"
    "https://bintray.com/habitat/stable/download_file?file_path=darwin%2Fx86_64%2Fhab-0.88.0-20191009205151-x86_64-darwin.zip"
  else
    "https://packages.chef.io/files/habitat/#{current_version}/hab-x86_64-darwin.zip"
  end

  desc "The Habitat command line application"
  homepage "https://habitat.sh"
  url source_url
  version current_version
  sha256 current_sha256.downcase

  def install
    bin.install "hab"
  end

  test do
    `#{bin}/hab --version`
  end
end
