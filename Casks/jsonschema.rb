cask "jsonschema" do
  version "0.4.1"
  sha256 "91133c844407f908c43bfce638491151b3d1e8fe3506e126563d06028c1471eb"
  url "https://github.com/Intelligence-AI/jsonschema/releases/download/v#{version}/jsonschema-#{version}-darwin-arm64.zip"
  name "JSON Schema CLI"
  desc "The CLI for working with JSON Schema"
  homepage "https://github.com/Intelligence-AI/jsonschema"
  binary "jsonschema-#{version}-darwin-arm64/bin/jsonschema"
  postflight do
    system_command "xattr", args: ["-c", "#{staged_path}/jsonschema-#{version}-darwin-arm64/bin/jsonschema"]
    # As a test
    system_command "#{staged_path}/jsonschema-#{version}-darwin-arm64/bin/jsonschema"
  end
end
