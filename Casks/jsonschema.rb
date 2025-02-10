cask "jsonschema" do
  version "5.0.2"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "8d5a3c906a57803f05bd7f7b416dc4ba780ec5953f0ff1b088d411cbe9f86706",
         intel: "d34880be0c48909f5d030e77ef7e3a967a05b6fc764a098780d0d72b17ad74e5"

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
