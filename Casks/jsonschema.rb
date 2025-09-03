cask "jsonschema" do
  version "11.7.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "f303f79e009f71f3a086c3ef3be3c40470cf1d21278c250292121ef1c30f6e23",
         intel: "e509ccce08c8a0a668a05b8ce6f5c7577020f53fd9afe9104a3ea431f7260aee"

  url "https://github.com/sourcemeta/jsonschema/releases/download/v#{version}/jsonschema-#{version}-darwin-#{arch}.zip"
  name "JSON Schema CLI"
  desc "The CLI for working with JSON Schema"
  homepage "https://github.com/sourcemeta/jsonschema"
  binary "jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"
  postflight do
    system_command "xattr", args: ["-c", "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"]
    # As a test
    system_command "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"
  end
end
