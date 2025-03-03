cask "jsonschema" do
  version "7.0.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "0b5fc4642d6546e70dbe48f78fd6aba3cca52c2c8f44e2af7ead39be9060578a",
         intel: "19247738fa31eff37c6bebfbe65355b63e2f58cf02afc61b5b4155364c67f3b5"

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
