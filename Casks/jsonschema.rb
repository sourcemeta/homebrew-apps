cask "jsonschema" do
  version "8.1.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "991a9ebc2c3c6f827a66bc110924ef634f77c075f1126541810f9d2c4f55f20b",
         intel: "48dd69e29d14843bad574cf5abfd34d6aef3b2ffe4f1c982308791d977c4f224"

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
