class VmafData < Formula
  desc "VMAF models"
  homepage "https://github.com/Netflix/vmaf"
  url "https://github.com/Netflix/vmaf/archive/v2.3.0.tar.gz"
  sha256 "d8dcc83f8e9686e6855da4c33d8c373f1735d87294edbd86ed662ba2f2f89277"
  license "BSD-2-Clause-Patent"

  bottle do
    root_url "https://github.com/barrbrain/homebrew-av1/releases/download/vmaf-data-2.3.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "9ec07b9623000631ff2517762458ba8d3aab9db59f0ab22b868e9c839b387fc7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "67d8c60c9b93a2db7509a3fabec38cc0cafd24fe45787212b35a6d3555ad1091"
  end

  def install
    pkgshare.install "model"
  end

  test do
    assert_path_exists pkgshare/"model/vmaf_v0.6.1neg.json"
  end
end
