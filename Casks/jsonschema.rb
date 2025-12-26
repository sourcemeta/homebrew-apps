cask "jsonschema" do
  version "13.6.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "3c1571b01b08bdca2d744e6ec333a2f900e7e73ca64d1c46fdf787dfb96800a1",
         intel: "b3b028d95656c82062bbc09a7736e2cb0ff603eae6f74a3b162a340c32f55f39"

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
