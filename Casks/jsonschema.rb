cask "jsonschema" do
  version "2.0.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "7b36058ec11164cddfba2225118e12143a07840da1dbea24a912f4791dcf3e6c",
         intel: "9bc895489903ca073570a874efd50a857ab0c4ded582787d451ad44fde8a3796"

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
