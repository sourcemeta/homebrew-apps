class Jsonschema < Formula
  desc "The CLI for working with JSON Schema"
  homepage "https://github.com/sourcemeta/jsonschema"
  version "14.14.2"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/sourcemeta/jsonschema/releases/download/v#{version}/jsonschema-#{version}-darwin-arm64.zip"
      sha256 "ae73b90e79a7e587f05d722de502b31eeb701b072e2563c38d717388a5c6e785"
    end

    on_intel do
      url "https://github.com/sourcemeta/jsonschema/releases/download/v#{version}/jsonschema-#{version}-darwin-x86_64.zip"
      sha256 "dc6b99a44a1e9d002e7c534cec452fe351ae63791dfdd65e147a327c64974d51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sourcemeta/jsonschema/releases/download/v#{version}/jsonschema-#{version}-linux-arm64.zip"
      sha256 "cb8fd293ead5bb68be931d23b81c8d2278d047defb91b27e2d2892704211c198"
    end

    on_intel do
      url "https://github.com/sourcemeta/jsonschema/releases/download/v#{version}/jsonschema-#{version}-linux-x86_64.zip"
      sha256 "6473ee098c77d93afa15f4237c6e0fd2ce6cf3105d00ddb097cad1cf8b2f368e"
    end
  end

  def install
    # Homebrew auto-chdirs into the single top-level directory of the zip,
    # so bin/, share/, etc. are directly accessible here.
    bin.install "bin/jsonschema"
    bash_completion.install "share/bash-completion/completions/jsonschema"
    zsh_completion.install "share/zsh/site-functions/_jsonschema"
  end

  test do
    system "#{bin}/jsonschema", "--version"
  end
end
