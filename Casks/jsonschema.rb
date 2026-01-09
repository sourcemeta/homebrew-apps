cask "jsonschema" do
  version "14.0.3"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "4c261dedc44f71b94cf6835dc94812233c02d484d43f71e9eb15a093ea157d61",
         intel: "2074d746a79a81e7d693340b3ce36faf2e653891a4ce505e3a4c9a9c51febc87"

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
