class VmafData < Formula
  desc "VMAF models"
  homepage "https://github.com/Netflix/vmaf"
  url "https://github.com/Netflix/vmaf/archive/v2.3.0.tar.gz"
  sha256 "d8dcc83f8e9686e6855da4c33d8c373f1735d87294edbd86ed662ba2f2f89277"
  license "BSD-2-Clause-Patent"

  def install
    pkgshare.install "model"
  end

  test do
    assert_path_exists pkgshare/"model/vmaf_v0.6.1neg.json"
  end
end
