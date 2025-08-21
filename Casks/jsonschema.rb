cask "jsonschema" do
  version "11.2.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "18ea6936f0f7ba5867f8026d0527978fde7d83e25d54b2fc14d035292b9d0734",
         intel: "e81de3cac0e7fa60a68c22a3098353810c20c497928458f8b33ac02c62e4dd5c"

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
