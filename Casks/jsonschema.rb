cask "jsonschema" do
  version "6.0.1"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "a1954a725b9c33e46a8e4b488b79c4215b9b406744718a320bb3fb94e4b6ad05",
         intel: "126cbbebd4490f9cb7500d94e63ce5f60c361994ebde962e96ecba147633fdea"

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
