cask "jsonschema" do
  version "14.13.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "a604cfe6cbd5562da972306d6769f2550eca0d57712466efbd5f27ea1a3f2ef9",
         intel: "250add89a3de8b862260dcbdda939166364b1e16a5afb2c1b512b3a25f0cabd9"

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
