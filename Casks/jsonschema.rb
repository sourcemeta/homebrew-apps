cask "jsonschema" do
  version "9.0.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "3e0d1add343a9937193f6bf09d5144c11e5bccb9a4df83748ea5bd70c8906afa",
         intel: "71fc6e517e6596f66913261f50b16ab81b0908eb5557a471a1a9e01ad2bcafd4"

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
