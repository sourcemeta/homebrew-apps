cask "jsonschema" do
  version "7.1.4"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "e1c842d141868c684e6f4fa9647add719885c31161061b81e1b42dc881d588c9",
         intel: "7152b917013766c16af8628a54f27b9f0ab088503a40b3702c387560e41a596e"

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
