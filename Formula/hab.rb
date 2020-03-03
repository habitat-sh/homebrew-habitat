class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="1.5.50"
  current_sha256="7b4504fc8900fb058fa7c249a17ef44d1c7bcb07e181c8b867e825f531b2ec12"
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
