class ConfluentPlatform < Formula
  desc "Developer-optimized distribution of Apache Kafka"
  homepage "https://www.confluent.io/product/confluent-platform/"
  url "https://packages.confluent.io/archive/5.5/confluent-5.5.0-2.12.tar.gz"
  version "5.5.0"
  sha256 "910da4e1dac50990e5570796406270b94bcdecc61ab8182a0060799f7513cc2d"

  bottle :unneeded

  depends_on :java => "1.8"

  conflicts_with "kafka", :because => "kafka also ships with identically named Kafka related executables"

  def install
    prefix.install "bin"
    rm_rf "#{bin}/windows"
    prefix.install "etc"
    prefix.install "share"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kafka-broker-api-versions --version")
  end
end
