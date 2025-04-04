cask "jsonschema" do
  version "8.0.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "d630210b1a170cebe07adf8b47f22341532d4986c932687469b61e6279ff3eaa",
         intel: "e026d79c25de33aa7c455e0c8155c96a3de42b7ffc7344c2fd94972aeeefbf6f"

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
