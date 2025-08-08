cask "jsonschema" do
  version "11.1.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "baa3fa22d54501e9c859b21472164482ba23ee3603a05d0ec6a5b794a11c93ec",
         intel: "f8ef214c1484fc02a9fb4338d9da06026047fa9a78162319bb11f3772bdf46d6"

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
