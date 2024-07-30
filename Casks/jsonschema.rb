cask "jsonschema" do
  version "2.6.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "779153248ad151028377aeb38beb554b0f525d01ed0c40fa633e9179566741dc",
         intel: "a29daea1284362be957865fe5d2c96898acfb0e8b46f9aed8cd0da85c0708256"

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
