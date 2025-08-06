cask "jsonschema" do
  version "11.0.2"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "40baac056803f975437122bc4bfa7d509c356136673a9ff891c64c1cd4331067",
         intel: "9d31a64ee5c301199c40c963301c5e84398d0960f53aa27adfab81652d6f1f3d"

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
