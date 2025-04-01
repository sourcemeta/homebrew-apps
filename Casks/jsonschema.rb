cask "jsonschema" do
  version "7.2.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "80d96ce4e185cf608c72cc8abc947633a46b0b2bd4960fdd2429cf76a4c04760",
         intel: "a718380f9ebfe053b3502476822dde490a2cb4342a05eb35bc5e0a913218ecad"

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
