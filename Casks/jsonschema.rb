cask "jsonschema" do
  version "11.9.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "d6542592ff0633ed8cc13b7b89ace17a41d7a532962c0a6642c5b82f5287803a",
         intel: "a5bf14cc5d0496d2827aa90539ec90f5ae5d3591b96ccdb95bd9a65b33509c32"

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
