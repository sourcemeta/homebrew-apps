cask "jsonschema" do
  version "9.6.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "aa63c26076fd410e1d27aa08d770c5b85380eb43b7a558cb7828722f56e4a644",
         intel: "eee48b4e3984a2edc0861f5451e2c5844de1784ae6d263b3c24ee2f25f7693b2"

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
