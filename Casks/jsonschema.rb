cask "jsonschema" do
  version "14.6.1"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "f96dcab33b0735903e88e177aa0b6a5e9d380c9dc43c685321824ce0b4e292f8",
         intel: "bd830cdb3b46404c8f5ed05effb4e49d5966852daaccb02b4c196a6cf9984436"

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
    
    puts ""
    puts "Tip: Try the Sourcemeta Studio VS Code extension for an enhanced experience!"
    puts "     Open in VS Code: vscode:extension/sourcemeta.sourcemeta-studio"
    puts "     Or visit: https://marketplace.visualstudio.com/items?itemName=sourcemeta.sourcemeta-studio"
    puts ""
  end
end
