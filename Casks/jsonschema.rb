cask "jsonschema" do
  version "9.5.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "e0640d6aed253189d2160163afa364aa788081fe601dbc0d9aab1219d896611e",
         intel: "fe6376e9fab351270fe906a410cf68764e5ccadbd8ab721df6e7ee526c694ea0"

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
