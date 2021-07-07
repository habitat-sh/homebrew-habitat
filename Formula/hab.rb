class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="1.6.351"
  current_sha256="fbc9857025b616065a60a06269ea4ff2165f4a8a7a265e8a3280e3e056821028"
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
