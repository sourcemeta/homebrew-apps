cask "jsonschema" do
  version "12.1.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "64da3ce6c3aac8225f98fa96582450021a8734038f511dd45ce70144a1a73006",
         intel: "e1f4350dfc80db12a9051ba49d8e867551d1ca6601388dbe1bed62e16ab80aec"

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
