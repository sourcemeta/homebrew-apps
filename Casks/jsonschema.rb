cask "jsonschema" do
  version "11.0.3"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "0261cc5513159be50d2768f7262b5ff6e08873d63baac76991385b6072dc2785",
         intel: "3cd9fff5d96353e5202848498e13cbc690636e8ddeef09be10cd50ddfbf0f90d"

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
