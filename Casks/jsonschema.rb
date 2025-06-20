cask "jsonschema" do
  version "9.3.6"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "42db16d992988743fe0cd744a3c63b4e2a828a62dd031e02b54bd92ba3af9e7b",
         intel: "898f166a17f50f1f0c80cd8bef5085c6621c1f2eb12a9c2373cfe55db47b60e9"

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
