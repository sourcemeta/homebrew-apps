cask "jsonschema" do
  version "6.0.2"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "bdef6ee3b001dce1d8041c6ecfe3421ae6aa61de9d74168d3274e4474d2ef277",
         intel: "d442b597853061dc4ce970be3ac79dd8b441d2d27d6a8e0501fc82d61dda9095"

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
