cask "jsonschema" do
  version "11.8.2"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "6355878fc95d7938de4f76cc153e2ca4ffc0173100b6b5657b52351ccb6958a5",
         intel: "a82d132191ba0529c373b576a16e039b28f009103d19d7fd62d1eac60c51980e"

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
