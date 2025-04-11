cask "jsonschema" do
  version "8.1.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "6a6e12418199d7c81a061d391bab0ec99c79cbb19742d7e91fbcf417fa261752",
         intel: "f2be416fd7b79203c3a4d617bf3c3fbfb1c72a762bf1eaf8fc28294841328ff3"

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
