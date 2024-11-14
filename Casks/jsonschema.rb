cask "jsonschema" do
  version "4.3.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "5e7806836bc011b96e5cb91061fe7ee142711177fe43023d8531b7d5f1b3fc43",
         intel: "d245b3d53cfa51abf54e375d1fefecfd718ef0c7a38b99e95e6441233b7c1711"

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
