cask "jsonschema" do
  version "12.2.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "754dd94882257139dfbd6d502ffb7b5782a052e08cf4c27baf1a167eec2f3587",
         intel: "a5b0f01e204b2b1448db5b7f31fff9484fa27d42dd6290fff6cd64c456f965c2"

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
