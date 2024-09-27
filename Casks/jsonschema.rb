cask "jsonschema" do
  version "4.1.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "115b0d7972e406766f1882a2f4573ed21d9e63f1a7cfc65c33fc55c42f28b561",
         intel: "f3762dddbe8e89c1079f3bd72e9ba86d82625ac7d6f2e50ba44b0ac794295b40"

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
