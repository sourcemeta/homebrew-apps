cask "jsonschema" do
  version "9.2.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "58adb3c53742f996e947df5e6f91bde870a204e9a78981778a37a33de71f58ec",
         intel: "ee56cf487a13324e3641bca315d99b91e43c961abf06cb1629ca86cb81eb2b22"

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
