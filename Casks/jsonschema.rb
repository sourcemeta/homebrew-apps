cask "jsonschema" do
  version "2.1.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "b030b96fdbd569d5aed3dc545eeeea9d2f1c11ff47a76f1709f121ea6623c2d8",
         intel: "45222ef5c6311835b881b68a1fa0411dcb021644e61144f90f9e97f87d397edb"

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
