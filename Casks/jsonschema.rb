cask "jsonschema" do
  version "11.5.1"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "332edec9244334d9a25febf90858f45d0b64433a48ae5631946deb0d0385e5ad",
         intel: "226623f425a77260b301a82dcb097375bdbf741da2668dcd13ffa734c9195f01"

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
