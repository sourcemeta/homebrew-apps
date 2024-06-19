cask "jsonschema" do
  version "1.1.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "60ec7e5e1f5214bb00218dd965b2c8bcb8085659b74b73d97b7c38f1cc7cd50b",
         intel: "2949451b58a51be7682b32d9697552affa9cbc275c4ef34198064a26acb00b32"

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
