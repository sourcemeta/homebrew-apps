cask "jsonschema" do
  version "3.2.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "f09f9981fba7ba40fad70f15fb9bfbf6deacf8d04e135b5a8d3e93e2f094a785",
         intel: "2e741b8123468ad2f1a3b83713cc71629f166195ee39d6f7168e43c1e142a35e"

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
