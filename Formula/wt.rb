class Wt < Formula
  desc "Multi-window git coordination: worktrees, claims, file-level collision detection"
  homepage "https://github.com/eharriett0/wt"
  url "https://github.com/eharriett0/wt/archive/refs/tags/v0.1.16.tar.gz"
  sha256 "aa826bf01947522e9c3a30bfc7f07a97665c46f995b7ab51ddc1033bbdc1dc99"
  license "MIT"
  head "https://github.com/eharriett0/wt.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/eharriett0/wt/internal/cli.Version=v#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wt version")
    # help renders without error and names a core command
    assert_match "wt status", shell_output("#{bin}/wt help")
  end
end
