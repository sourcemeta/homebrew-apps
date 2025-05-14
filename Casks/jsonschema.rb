cask "jsonschema" do
  version "9.3.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "8b49df2b2c1fa336a0ae0a830e33623475bf6a215b00295933eb32c42fe85b8c",
         intel: "e2092e1f49c50ce670fa96bdf9aa3497b3ad7cab3aac97797fc64c2006ea8aa5"

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
