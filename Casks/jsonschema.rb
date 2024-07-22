cask "jsonschema" do
  version "2.3.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "82f20f2201f111f27ef49bb4f196c8adb25c5ea95f82cc0021f6e15cc96c9bf1",
         intel: "74b7ec281a229b96969276e33c11c60fd50dd26893e905990e79bb036e3343ba"

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
