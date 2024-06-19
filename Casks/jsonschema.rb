cask "jsonschema" do
  version "1.1.2"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "dd1c9d85f2bb46834dd828e983f5ff0a19c1f42704b7e2c8bcaaa2a055bb2440",
         intel: "730b77c07a4a1dd31db6a52f08090a45d893e0afda52345925ab060a711b5770"

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
