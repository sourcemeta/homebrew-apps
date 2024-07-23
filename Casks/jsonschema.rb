cask "jsonschema" do
  version "2.4.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "6bd73d54d519de32ca690c565ed8e92fd1d510cdbbc8fe1c53aa1f9547dc75ef",
         intel: "c06c5f4043fd1e630914b7ee13c8c38bc977c6af03a0bb7f8a0fd4a53426b2be"

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
