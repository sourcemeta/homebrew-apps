cask "jsonschema" do
  version "11.5.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "db526b58fe89ab3cb4be12e525abaf2835ced6ae63401c4c32f822495441106d",
         intel: "c82c063b52ea229edcd983a1e7d01d8b17eb0dc94c4c39cc135ddabc17968159"

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
