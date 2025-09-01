cask "jsonschema" do
  version "11.6.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "1c464431bf3f45ddb331b1bb0187d6cddf5facb56227d01ef994810e2abf148f",
         intel: "d8a8c6176fe409843b064762d7f7279463ce976b681cd7587d6f616349c5594f"

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
