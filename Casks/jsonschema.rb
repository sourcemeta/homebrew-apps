cask "jsonschema" do
  version "12.2.1"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "2fbf94bf02795d8a78632fb20388649fc427651bf6ae11dd2433bd5a33931027",
         intel: "40f423e54aca187c0f6df77d3adf8a1e1eeded123c5be18f1b299244729593bd"

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
