cask "jsonschema" do
  version "5.0.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "48a53d20cbfacc5352bc7a5d3ff7f81f6b3c6fa8ba8a6409db9290b52b9536d3",
         intel: "b4c059546369658aca79b39e4a09299d321339dfd454a3c8d20d693cb1229691"

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
