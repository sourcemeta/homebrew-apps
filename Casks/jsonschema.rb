cask "jsonschema" do
  version "4.1.2"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "99cb2b21f1aa0227cf05089f3b7bcf4c597dd687fabb7b0cd269afd18057c84e",
         intel: "871867278107ad8dc5e9e8c40f8f73cb809a86d23f13f8ad22e3c6b9ba0f1dd4"

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
