cask "jsonschema" do
  version "14.7.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "e0f4946dcfc4eeec6539c67d365b319c2d2e623b61f879571c2c72afb287eda0",
         intel: "fbceb29110bbf0f4d05dd1f8925842398d80510476461a4afcc0b1b216bf823d"

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
