cask "jsonschema" do
  version "9.2.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "8a4b3651ef117f7df280906c3157c44d24c4d4a13c614107be670b9d8fc9fc10",
         intel: "24d8534e02b1342483b33c0e01a163a046e2c09fd4e8bbe4cf3cdc22b846b833"

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
