cask "jsonschema" do
  version "1.0.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "2fae37445360b7795c09bd614b7167dfe926cb00919f8b333cd35acdeb27bdc1",
         intel: "453bc7f9195b9f39f164d3900f7545914ddad1c147b3d49f629ac69c91003920"

  url "https://github.com/Intelligence-AI/jsonschema/releases/download/v#{version}/jsonschema-#{version}-darwin-#{arch}.zip"
  name "JSON Schema CLI"
  desc "The CLI for working with JSON Schema"
  homepage "https://github.com/Intelligence-AI/jsonschema"
  binary "jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"
  postflight do
    system_command "xattr", args: ["-c", "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"]
    # As a test
    system_command "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"
  end
end
