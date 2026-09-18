cask "jsonschema" do
  version "16.11.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "f435eb6554a6febf8e81fbc317fe7c75e9901530dda2bdc67aac0ec64ec3ba50",
         intel: "b0933f67ef03f518f841846261771406384fcceef9a9d99a82db844d5e8bdf29"

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
