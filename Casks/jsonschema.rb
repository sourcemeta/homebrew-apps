cask "jsonschema" do
  version "7.3.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "99833d8b8b895fef44e4fbbc0b6da3a716a3730672e355f00933fb13a08cd921",
         intel: "463988a11941503385300dbc58bf8c839e7795be999c47a74c7fdc8bddd716f7"

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
