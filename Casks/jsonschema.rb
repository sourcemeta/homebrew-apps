cask "jsonschema" do
  version "11.11.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "b39c8e5c57ab8a2ca53cf1252aed86a47174b96477d3aba900068d0aeabfce13",
         intel: "6e43c8dfd5ae9172edfd35e996c43838aa2aba271e09af67bb69def429605bb1"

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
