cask "jsonschema" do
  version "8.1.2"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "308c5ff808ac5483ab1685b12ae14f312d2b0b11bbc88329d2773b542e184968",
         intel: "3b7d202a1a3ad60e67f0d15cd58db6d5be590c4555781e960a9db78c9fe4b527"

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
