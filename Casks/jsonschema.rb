cask "jsonschema" do
  version "11.8.1"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "674b6bf357c7b0dbd0b451a2ef5cb0b8bd2772ee0fd02232589bed5c2d5d2d4f",
         intel: "3101e5f2960b08368ea9fa9cfacfcd2e487d1d7f4555a710c0d0f6b2b77e378e"

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
