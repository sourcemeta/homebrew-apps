cask "jsonschema" do
  version "2.2.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "ec9302c765c1a630008e673ccff76b5fa754f5bbbb1459dd3891965b0ee1711f",
         intel: "5710cbe490492b059a716ae4a34ae80bd5d100053f4e9f28ab1a8b04ce926ab3"

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
