cask "jsonschema" do
  version "9.6.1"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "9124805ecf59433f73183d4a3f9e5c022fa8d90c83e16a2b0590f576c2c265ec",
         intel: "722b9a084454a9543fa9b89915f591726630cd15d29b624b0f71f876c10a2dd3"

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
