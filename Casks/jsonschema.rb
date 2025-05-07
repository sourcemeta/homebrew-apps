cask "jsonschema" do
  version "9.2.4"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "2da719afc339701180a3b1836370b27201db78be81a0780e887969736e3137d1",
         intel: "3f1d7f3c0c474027508c78c614700509241f0b89b821a7dcd1400dd208865d54"

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
