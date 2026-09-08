cask "jsonschema" do
  version "16.10.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "2b161a91c5d92565f4fb9d9f6016ded8bd5df70fb77f0629b18b938c000e29e7",
         intel: "0c0c391fe4be89856098af018218de91ce7cb90bb472abaa5e2509fefd45c0af"

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
