cask "jsonschema" do
  version "7.0.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "cccd23e6fbf03ea646dfceada4ed231170e9dd0dd8561dd167f78e4227941942",
         intel: "9dd54524986fced79a181912bd0775f948a109cf9e9d2ba33d0a14cce670fb87"

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
