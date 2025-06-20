cask "jsonschema" do
  version "9.3.7"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "aef7627f2e0f4349c4c7fc9e6570dc0aa2114859e5fcd63b9825ff0eff79487e",
         intel: "17fc2d5030202e4331ce0e33e3fe022fd739a99918c65b0ceb39bf1cb118f4fd"

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
