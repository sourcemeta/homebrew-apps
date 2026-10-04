cask "jsonschema" do
  version "17.1.1"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "d366a1b6c01e74e00b10522f357096473e7da18c89f4499d3d33f154a10e564a",
         intel: "76146ef7733d42bde40d0feb79b71efba011b894b440c5f1e52eb33b3a6c2763"

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
