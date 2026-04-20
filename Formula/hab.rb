class Hab < Formula
  # Update these values as needed as new versions are released
  current_version = "2.0.488"
  current_darwin_intel_sha256 = "ceb2ade5ddea0f6eadd5df3c9fcd80af0ed26f1e039ba685923ddfdbfdcac753"
  current_darwin_arm_sha256 = "89ebc7400f4722b7ac5296e4b189b2eb0fa5871e8ce5e4a7a6589d40607ceaff"

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
