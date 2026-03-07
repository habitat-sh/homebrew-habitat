class Hab < Formula
  # Update these values as needed as new versions are released
  current_version = "2.0.450"
  current_darwin_intel_sha256 = "3e4acae6919b980c9c46d2a8d23a14455f36cdb8c22fc3383d61d722c7898516"
  current_darwin_arm_sha256 = "b864acbc5c8100e18442361c8206804ec1c49d311100a274d715e11eccdead6c"

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
    share.install "NOTICES.txt" if File.exist?("NOTICES.txt")
  end

  test do
    `#{bin}/hab --version`
  end
end
