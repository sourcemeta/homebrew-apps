cask "jsonschema" do
  version "7.0.2"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "959f8dc8c0a1a6b13ed5975c99b23a29302adb0736a72bae9d4834d856d9fe55",
         intel: "108d417738e37047365b47ebe76ef9956f86405c0e91d3dd2c56cb8bb383d5dd"

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
