class Av1an < Formula
  desc "Cross-platform CLI AV1 encoding framework with per scene quality encoding"
  homepage "https://github.com/master-of-zen/Av1an"
  url "https://github.com/master-of-zen/Av1an/archive/refs/tags/0.2.0.tar.gz"
  sha256 "68169f0c8760cb7d42ab484a969ca5f092551352998d89c602ac3527542e6538"
  license "GPL-3.0-only"
  head "https://github.com/master-of-zen/Av1an.git", branch: "master"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "nasm" => :build
  depends_on "rust" => :build
  depends_on "ffmpeg-libvmaf"
  depends_on "vapoursynth"
  depends_on "vmaf-data"

  resource "bus_qcif_7.5fps.y4m" do
    url "https://media.xiph.org/video/derf/y4m/bus_qcif_7.5fps.y4m"
    sha256 "1f5bfcce0c881567ea31c1eb9ecb1da9f9583fdb7d6bb1c80a8c9acfc6b66f6b"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    args = %W[
      --vmaf-path=#{HOMEBREW_PREFIX}/share/vmaf-data/model/vmaf_v0.6.1neg.json
      --encoder rav1e
      --target-quality 90
      -i bus_qcif_7.5fps.y4m
      -o bus_qcif_7.5fps.mp4
    ]
    resource("bus_qcif_7.5fps.y4m").stage do
      system bin/"av1an", *args
    end
  end
end
