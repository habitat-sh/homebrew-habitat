class Hab < Formula
  # Update these values as needed as new versions are released
  current_version="0.39.1"
  current_release="20171117234750"
  current_sha256="82169e832277dd3efbd299c335cb05f8ae7a13e2ce1c4b37d40be502bca5b697"

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
