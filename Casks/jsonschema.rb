cask "jsonschema" do
  version "4.1.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "3e8f247e80252d85db9fd1e0256231a9487e68660f3b4a9920a7cef9a40e4532",
         intel: "e3710c46aaf724c906b79785ae6e735fa41fdb0353d83de9e0ec90d39e110f74"

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
