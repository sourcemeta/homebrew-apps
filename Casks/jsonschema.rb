cask "jsonschema" do
  version "7.1.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "11cc62e304de78756b9162317553222049af12f98e57a9d480345f26463ef42c",
         intel: "b3fb477fdc24cee87c2220939856b45c433c1345fdd9ec894642d49a597ff9a3"

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
