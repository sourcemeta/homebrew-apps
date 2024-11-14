cask "jsonschema" do
  version "4.3.2"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "75a6188e552ef7a4d185cdbc5e9c977b7c70aa6b822aebcfbb04e7da4b87decf",
         intel: "8a6605321ebd1126b96b9150334dd113fd9204b7978f7d3791e50a1ab11cb1e5"

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
