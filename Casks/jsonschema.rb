cask "jsonschema" do
  version "3.1.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "b0b1a6f8dc8d91cd32795b9800fe361ada23087e4294741786815e173dc365fa",
         intel: "efbeeb31f85547dd9a77ca4e050ee84cdd730f3dd2eb19110cbaf99b2f1e0559"

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
