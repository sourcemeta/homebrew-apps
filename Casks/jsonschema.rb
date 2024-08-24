cask "jsonschema" do
  version "4.0.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "abc4765f9aaf4cf500d12a1371eb5e9265380c36c97fd784860bad610a36c833",
         intel: "4e6d30990ce8cf1e04907e2269e9e92f765246ff0afcbe256c3bc7b9dbc27f30"

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
