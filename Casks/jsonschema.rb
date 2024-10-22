cask "jsonschema" do
  version "4.1.3"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "8c78a8fe3208dad75342f088116ff0c0f78f518721cc6073139b1d30c7ee2325",
         intel: "52daae1d5bbc23aabfcbd0b68ab38b59a4a4a9fa8b3aac479a3ff2110b028e65"

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
