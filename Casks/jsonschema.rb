cask "jsonschema" do
  version "9.3.0"

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "13993b12cd3613b70645ad03c8c8484cab76c33d409214f0986ebe61912532f9",
         intel: "478f6cfe0e334d0c583612aadb769cba95a271105c378a7c07c7e8cf8d61f1af"

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
