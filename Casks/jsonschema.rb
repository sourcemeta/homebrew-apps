cask "jsonschema" do
  version "11.8.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "f4a2575445fd89e4a5303b36edf0f05a36180791df1c99f46138226623288452",
         intel: "6f7e8adf3554790debcdd063fa11ac8ca4b721d2e3772667bb9de732c91792b3"

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
