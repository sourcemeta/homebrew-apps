cask "jsonschema" do
  version "12.1.1"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "adc7dcf69860d1cd7453a7a36ef15ff6d477e08e5321f0417faada15234b2494",
         intel: "71b8c1a91e79533ab3ac893532881bbc671e1ea53abf2e6159e92482d3ea9444"

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
