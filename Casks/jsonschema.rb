cask "jsonschema" do
  version "4.2.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "0519c96d1f321457b20a873e08f17486794d92e086bd19c2d2c438d5311d6d14",
         intel: "fccf29833029ddcd272c4501dce3b30eda7bb706f2d350fd559e00ccd120f3c6"

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
