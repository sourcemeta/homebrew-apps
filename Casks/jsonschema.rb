cask "jsonschema" do
  version "3.1.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "cac950b16b86f0fd65a8a2adf54634452ffcd38c8a200e2e06a25ae1f018fb97",
         intel: "21dd08b132107b662a2ee7a4554a9bc4e98334c2958bb8da860209655ed7ba21"

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
