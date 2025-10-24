cask "jsonschema" do
  version "12.0.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "12b765c8485342098570b0dc537cfd0f281343704224605f343906c08d2e3acb",
         intel: "aadbda7abe87d75d3647c0bebd68d0754e330119be62826829a24fc7b7b19d9b"

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
