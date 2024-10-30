cask "jsonschema" do
  version "4.1.5"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "5adff66142acad57edbc069b751702b36a76f87be99deed274cf610ee1e1ee23",
         intel: "dc301982ca3aa8c2c2cef98b97c2df6f51c0fe12b07f9c70dc7c54fc7003941b"

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
