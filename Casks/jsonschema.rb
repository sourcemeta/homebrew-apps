cask "jsonschema" do
  arch arm: "arm64", intel: "x86_64"

  version "14.14.2"
  sha256 arm:   "ae73b90e79a7e587f05d722de502b31eeb701b072e2563c38d717388a5c6e785",
         intel: "dc6b99a44a1e9d002e7c534cec452fe351ae63791dfdd65e147a327c64974d51"

  url "https://github.com/sourcemeta/jsonschema/releases/download/v#{version}/jsonschema-#{version}-darwin-#{arch}.zip"
  name "JSON Schema CLI"
  desc "CLI for working with JSON Schema"
  homepage "https://github.com/sourcemeta/jsonschema"

  deprecate! date: "2026-03-11", because: "it moved to a formula; uninstall with: brew uninstall --cask jsonschema"

  binary "jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"
  bash_completion "jsonschema-#{version}-darwin-#{arch}/share/bash-completion/completions/jsonschema"
  zsh_completion "jsonschema-#{version}-darwin-#{arch}/share/zsh/site-functions/_jsonschema"

  postflight do
    system_command "xattr", args: ["-c", "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"]
    # As a test
    system_command "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"

    puts ""
    puts "Tip: Try the Sourcemeta Studio VS Code extension for an enhanced experience!"
    puts "     Open in VS Code: vscode:extension/sourcemeta.sourcemeta-studio"
    puts "     Or visit: https://marketplace.visualstudio.com/items?itemName=sourcemeta.sourcemeta-studio"
    puts ""
  end
end
