cask "jsonschema" do
  version "7.0.3"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "0f0ef6b32873015ae61df4f3a2eefea75437e25ffe7155bf5eefef37b20255a4",
         intel: "ccf8a5130ffef37ccbaebce39552b3969eeedfb83c040e6ad4de8f75d4397025"

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
