cask "jsonschema" do
  version "11.1.1"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "5914dec73810c4e89ef13c8aa0bda8b72492fb45b780815b1754abb3436ea767",
         intel: "a0e05d62c1c6d86299d66405d8dbe39f997f618cdfd2eed595af41b5bb11b5cd"

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
