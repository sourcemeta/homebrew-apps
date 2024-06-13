cask "jsonschema" do
  version "0.6.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "694bc3db1d612204cd253cef9aaf3005523f39bf79a26935ce0773ee1452b39e",
         intel: "c7cfd3e694af0646cb855a694483bbe588791fb459aac16db1964eaa384c9f73"

  url "https://github.com/Intelligence-AI/jsonschema/releases/download/v#{version}/jsonschema-#{version}-darwin-#{arch}.zip"
  name "JSON Schema CLI"
  desc "The CLI for working with JSON Schema"
  homepage "https://github.com/Intelligence-AI/jsonschema"
  binary "jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"
  postflight do
    system_command "xattr", args: ["-c", "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"]
    # As a test
    system_command "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"
  end
end
