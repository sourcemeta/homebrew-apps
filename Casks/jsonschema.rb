cask "jsonschema" do
  version "7.1.2"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "6eb6f333cf439785da1d258013887c759ddeaad7a6e0c02924f577682cd73b44",
         intel: "355198d1b194a4e9a42fe6aa27555d981d10c3774790165cf4637329a3b334dd"

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
