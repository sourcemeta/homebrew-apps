cask "jsonschema" do
  version "0.5.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "44bf3ea8e78cc533e1dd62d95e1bff2bed73128996106474dfe9219d664cf9cc",
         intel: "0e165ebbe16027b8fac323dc040fc0e1cbf9f651606a6777511ef9e91d319e5a"

  url "https://github.com/Intelligence-AI/jsonschema/releases/download/v#{version}/jsonschema-#{version}-darwin-#{arch}.zip"
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
