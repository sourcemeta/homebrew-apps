cask "jsonschema" do
  version "6.0.3"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "c7dca2ebc939c2ea2797fa1e37eee89d434bf91e98eccb08998cf151f58ab556",
         intel: "d11db51e5e5f4cef15a503cfad3d277bc152f8157f82d65fd8bde4895e25647a"

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
