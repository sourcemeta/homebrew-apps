cask "jsonschema" do
  version "3.0.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "657ec7eef11a9c3efeb3dac81f346ee396062eea6b2023aef42fc8c242f45456",
         intel: "c13986ee7a62f310eb90fe08b0d334a675d9ac2cabafb3384634bf47e965ed38"

  url "https://github.com/Intelligence-AI/jsonschema/releases/download/v#{version}/jsonschema-#{version}-darwin-#{arch}.zip"
  name "JSON Schema CLI"
  desc "The CLI for working with JSON Schema"
  homepage "https://github.com/Intelligence-AI/jsonschema"
  binary "jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"
  postflight do
    system_command "xattr", args: ["-c", "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"]
    # As a test
    system_command "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"
  end
end
