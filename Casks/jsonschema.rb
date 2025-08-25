cask "jsonschema" do
  version "11.4.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "271698a4fa081145a73e9455638dcfac5db7ee438687419dae354579253d7955",
         intel: "e0ce42d76de61605f8891a2a908d96d5831b6ca89fd723ca6e677eb075c08510"

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
