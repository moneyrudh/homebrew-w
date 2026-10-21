class Wlang < Formula
  desc "Compiler for W, an indentation-based language that compiles to C"
  homepage "https://github.com/moneyrudh/w-lang"
  url "https://github.com/moneyrudh/w-lang/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7f291175bdd88d8022e9afe580fff2d7571b9dc270979e0c9bd1e3cd8495cc5b"
  license "MIT"
  head "https://github.com/moneyrudh/w-lang.git", branch: "develop"

  uses_from_macos "flex" => :build

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    (testpath/"hello.w").write <<~W
      fun w(): num
          log("hello from w")
          ret 7
    W
    assert_equal "hello from w\n", shell_output("#{bin}/wlang run hello.w", 7)
    assert_match version.to_s, shell_output("#{bin}/wlang --version")
  end
end
