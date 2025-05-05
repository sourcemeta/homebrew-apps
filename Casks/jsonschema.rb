cask "jsonschema" do
  version "9.2.3"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "0c4a31ba1904ba42cd1f4ba083aeada0e24fb9b6bf9cf9c432e82c86ba1823a4",
         intel: "f64f17364d24db08daacb923b46a0d1a2289d6b8ffb1cc09bf234352fb90bf10"

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
