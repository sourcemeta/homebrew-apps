cask "jsonschema" do
  version "11.3.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "07d28e1f7f8915318b7472591d41e9ea662dd90585975a3f919d2397c732b11b",
         intel: "197d81553ead9914fb708030910f82496967ce3e23f8c1850ab6a3a27378f347"

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
