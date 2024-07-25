cask "jsonschema" do
  version "2.6.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "26a983d135aab40199abf7b9605f7aa69c9421bf230027dbe8dd58749afc34bd",
         intel: "c4b6277b70236c0f42eae9dc7c0189a8f050e6e70ce861977bc8732dd712966f"

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
