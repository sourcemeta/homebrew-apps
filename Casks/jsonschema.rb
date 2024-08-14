cask "jsonschema" do
  version "3.2.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "6babdda399a17a68bed90c529621e23ec407f716e1488563194e1f01c19bd1af",
         intel: "bdeca27d59c05c08d2e9e88c392465c9a3eb9931d30f7cf9378ff1b689284aac"

  url "https://github.com/Intelligence-AI/jsonschema/releases/download/v#{version}/jsonschema-#{version}-darwin-#{arch}.zip"
  name "JSON Schema CLI"
  desc "The CLI for working with JSON Schema"
  homepage "https://github.com/Intelligence-AI/jsonschema"
  binary "jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"
  postflight do
    system_command "xattr", args: ["-c", "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"]
    # As a test
    system_command "#{staged_path}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"
  end
end
