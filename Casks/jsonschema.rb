cask "jsonschema" do
  version "4.1.4"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "1e13a3b9af6fe23b688607f65246d6635b8ebdcced21ed3f6e18a3b7216f5249",
         intel: "e2ea1814b3aec751ded7c58aa6b694cc73c591e4c69ede3b4e577bd45d98ff76"

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
