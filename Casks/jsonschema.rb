cask "jsonschema" do
  version "0.5.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "4f69ce99996d2d381d70b9561191ac725a65fb184bddb1dff51cfaf9d522e7ba",
         intel: "26d2a347854fc044194bbcb53ee1f13d5b942c11ec250b9cbc244cdedc5942a9"

  url "https://github.com/Intelligence-AI/jsonschema/releases/download/v#{version}/jsonschema-#{version}-darwin-#{arch}.zip"
  name "JSON Schema CLI"
  desc "The CLI for working with JSON Schema"
  homepage "https://github.com/Intelligence-AI/jsonschema"
  binary "jsonschema-#{version}-darwin-arm64/bin/jsonschema"
  postflight do
    system_command "xattr", args: ["-c", "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"]
    # As a test
    system_command "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"
  end
end
