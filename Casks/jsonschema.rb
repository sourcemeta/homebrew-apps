cask "jsonschema" do
  version "4.1.6"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "43fa53a7e58c53c29c031565adc8eac2fef55678ff415f7eaf2a2f60bba07339",
         intel: "ebd6696b3fda65135d0cb7edb1ee7f03c106d0ccfbb0e18e08575dc65492cc98"

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
