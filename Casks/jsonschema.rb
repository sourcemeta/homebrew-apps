cask "jsonschema" do
  version "11.11.1"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "57a5ac17963e1e1215eb19f9f063c0c9bc8a0391c56998b4608c77b7a82dd266",
         intel: "05b375ce69cdd3efa397c4a84fb8de10423aa87a4c0e54ba2129a0014c4f0c82"

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
