cask "jsonschema" do
  version "11.10.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "acdc990f32d471b94c69a449ecc9ec86db7b928eb86bf4a087d98f1db8f95ad0",
         intel: "8f2fae6a5e4596a4d5884af307ae9b621bbdf6005b9c79d68e0a500eb794e188"

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
