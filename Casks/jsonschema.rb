cask "jsonschema" do
  version "7.1.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "138481ddc56beaaf53079295522587cdfc979a137c801d9776b151701f1df43e",
         intel: "467e3232031b019baac7d3774d92ad3b19605aa08a7c341a4b8cd07608b3a81c"

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
