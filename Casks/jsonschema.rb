cask "jsonschema" do
  version "11.8.3"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "81186818550d1ed266d02d6a45a624e745f1ee3e6d93ad98783d5f5b05b25444",
         intel: "aa3a2482fbf79b5f4a6bb7bee56856f1643e142d2cee764ead2e66141f67008a"

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
