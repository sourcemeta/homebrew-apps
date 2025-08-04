cask "jsonschema" do
  version "11.0.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "6434fcab8d6bda5bcd7d3e357912671078aae07aff58e5033b03c87015449a79",
         intel: "6d1087ee05ed3587495c0d34094407b9cca7669727ef4ad56e48ad298ac2d659"

  url "https://github.com/sourcemeta/jsonschema/releases/download/v#{version}/jsonschema-#{version}-darwin-#{arch}.zip"
  name "JSON Schema CLI"
  desc "The CLI for working with JSON Schema"
  homepage "https://github.com/sourcemeta/jsonschema"
  binary "jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"
  postflight do
    system_command "xattr", args: ["-c", "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"]
    # As a test
    system_command "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"
  end
end
