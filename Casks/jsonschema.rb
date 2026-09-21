cask "jsonschema" do
  version "16.12.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "3370d42567aa8aac7ffe714a6abaa7bc2b2226715d1251052c90a7309963cf78",
         intel: "8bbe9071c34900ba8c6a623febb636bd6ea0a22224c62000dcc5e5088e0b0197"

  url "https://github.com/sourcemeta/jsonschema/releases/download/v#{version}/jsonschema-#{version}-darwin-#{arch}.zip"
  name "JSON Schema CLI"
  desc "The CLI for working with JSON Schema"
  homepage "https://github.com/sourcemeta/jsonschema"
  binary "jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"
  bash_completion "jsonschema-#{version}-darwin-#{arch}/share/bash-completion/completions/jsonschema"
  zsh_completion "jsonschema-#{version}-darwin-#{arch}/share/zsh/site-functions/_jsonschema"
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-c", "{{staged_path}}/jsonschema-#{version}-darwin-#{arch}/bin/jsonschema"]
    run "jsonschema-#{version}-darwin-#{arch}/bin/jsonschema", base: :staged_path, must_succeed: false
  end

  caveats <<~EOS
    Tip: Try the Sourcemeta Studio VS Code extension for an enhanced experience!
         Open in VS Code: vscode:extension/sourcemeta.sourcemeta-studio
         Or visit: https://marketplace.visualstudio.com/items?itemName=sourcemeta.sourcemeta-studio
  EOS
end
