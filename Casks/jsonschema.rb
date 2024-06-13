cask "jsonschema" do
  version "0.6.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "2776609e509bd8eb9ae25a451688c859c5ad16d7e2a9b0219b93a1fa88b678b8",
         intel: "1b8f8462d603b80e0d9b95db86094725d6db027293647c30b49c6aba2d128cbf"

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
