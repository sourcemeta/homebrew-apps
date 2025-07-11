cask "jsonschema" do
  version "10.0.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "83d20fb4714fe61ae805defad185a0e71d6cddca64a28493d811897efc515d2d",
         intel: "edc52644f3a110a01a13f49e6c3a62a3b161cf9862b27692dfd522fae6b089c3"

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
