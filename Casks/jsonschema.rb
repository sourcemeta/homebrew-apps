cask "jsonschema" do
  version "3.2.2"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "a745b104342d7ee414d33d2f03dc8f16f3ff00984b1e72caa1e29757648feb6c",
         intel: "e52145f997848387b44a376d69bdd6347270b0fb523ec7473f039096a74965ec"

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
