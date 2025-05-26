cask "jsonschema" do
  version "9.3.2"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "3efcc0820fe55cf599ba920344286e2c0c5adf3ccf80fbf11e00dad3c394fc75",
         intel: "169a66bc68b410916d5bab5e6aa752411875dfa977c14825855f7c9152c1bdef"

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
