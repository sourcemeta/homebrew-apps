cask "jsonschema" do
  version "6.0.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "2b269e7b2c9cac2037f49c0b57f23119be18c9f08067f3090fa816474f172ce3",
         intel: "05156ed8e88a95878536127acc35fd42012dd05806ef41dc42e36542224960f9"

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
