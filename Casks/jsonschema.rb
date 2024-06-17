cask "jsonschema" do
  version "1.1.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "4d56523e64565e9c07beb0eb1a8f958434761edd4aeffb803a56d7cba5aa4abd",
         intel: "1d5e5c8ee3af7a2cdcde9436a54c8d3a46416235b040b17b2455a242410ce6a2"

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
