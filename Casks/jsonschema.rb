cask "jsonschema" do
  version "4.3.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "83c06063671a583b1e8f3837d655574e3a07581082277e19ccb8063f7388e731",
         intel: "305212e0c9fb164c304edde26fb2208861e9c7d3e982df0e1c0c0604b882ccca"

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
