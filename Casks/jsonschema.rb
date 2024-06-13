cask "jsonschema" do
  version "1.0.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "289b21f6b46d7c7fc8e2a171555fce9fe9295c36aac551eb30a21cc66cd3db9a",
         intel: "6c03c068e96702b5be3dc27439f41b85630577d8f6e116e657b192455ac38689"

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
