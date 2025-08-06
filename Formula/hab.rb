class Hab < Formula
  # Update these values as needed as new versions are released
  current_version = "1.6.1244"
  current_darwin_intel_sha256 = "8458a3a06d30c86969e7f8c8e0ed025f0272a71d4249f66a954cd358a331ed52"
  current_darwin_arm_sha256 = "5eb026cc50eba98c0b9fbaaa86e7f6bac7a24ffb88979b7e3670b7c39416741c"

  on_macos do
    @source_os = "darwin"
    if Hardware::CPU.arm?
      @source_sha256 = current_darwin_arm_sha256
      @source_arch = "aarch64"
    elsif Hardware::CPU.intel?
      @source_sha256 = current_darwin_intel_sha256
      @source_arch = "x86_64"
    end
  end
  on_linux do
    raise "linux not supported"
  end
  source_url = if current_version == "0.88.0"
                 "https://bintray.com/habitat/stable/download_file?file_path=darwin%2Fx86_64%2Fhab-0.88.0-20191009205151-x86_64-darwin.zip"
               else
                 "https://packages.chef.io/files/habitat/#{current_version}/hab-#{@source_arch}-#{@source_os}.zip"
               end

  desc "The Habitat command line application"
  homepage "https://habitat.sh"
  url source_url
  version current_version
  sha256 @source_sha256

  def install
    bin.install "hab"
  end

  test do
    `#{bin}/hab --version`
  end
end
