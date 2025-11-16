cask "jsonschema" do
  version "12.3.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "7d9371a8857dce9550b11b40771192b0302d1742f5c0d85594cc1f091224c2aa",
         intel: "50709b89e495e8544f1ea522df331d0aaa3a9588785666a32dac3ec93c0e699f"

  url "https://github.com/sourcemeta/jsonschema/releases/download/v#{version}/jsonschema-#{version}-darwin-#{arch}.zip"
  name "JSON Schema CLI"
  desc "The CLI for working with JSON Schema"
  homepage "https://github.com/sourcemeta/jsonschema"
  binary "jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"
  bash_completion "jsonschema-#{version}-darwin-#{arch}/share/bash-completion/completions/jsonschema"
  zsh_completion "jsonschema-#{version}-darwin-#{arch}/share/zsh/site-functions/_jsonschema"
  postflight do
    system_command "xattr", args: ["-c", "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"]
    # As a test
    system_command "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"
  end
end
