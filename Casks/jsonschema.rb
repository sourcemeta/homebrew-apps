cask "jsonschema" do
  version "9.1.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "ffbf0a2cae2c37bd1020f68333c256d4c681e06bfdef871f9e7b22284b2d7f60",
         intel: "4e96b5074b3602beb949bd594212c9c38f1035866aef04032e0df7313e983a44"

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
