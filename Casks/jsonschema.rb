cask "jsonschema" do
  version "15.6.2"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "5e1ffe612815c83543d26a7d4cfb9f1bcdda2d8be748a3c83966146e69b47782",
         intel: "594049d5b90a2505155f50e83bea2ec74b5d45b434ffc29ccd2a92aaebca5c9d"

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
