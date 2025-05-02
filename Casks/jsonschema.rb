cask "jsonschema" do
  version "9.2.2"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "f5eef3c4dde616a7eed0448cb017e4435ab8663cbb6fd7beea21ece6fb154fb1",
         intel: "f46645fd1bf25992f283b84ee2050ece684ac29bf8867025bad86e98c46075ce"

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
