cask "jsonschema" do
  version "17.2.0"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "3b1e570f270a4bc2fbbca77a926eb6772afc876b9fc9e2a2e2ea3aff4f6c1c34",
         intel: "a1b769aa59bd1194a4604450a4fd2b1c2e3b8d5620d1b7434fdd30705d9df870"

  url "https://github.com/sourcemeta/jsonschema/releases/download/v#{version}/jsonschema-#{version}-darwin-#{arch}.zip"
  name "JSON Schema CLI"
  desc "The CLI for working with JSON Schema"
  homepage "https://github.com/sourcemeta/jsonschema"
  # Interpolated outside of `postflight_steps`, as `version` and `arch` inside
  # that block refer to Homebrew's install steps DSL, which only defines `arch`
  # since Homebrew 7.0.0
  staged_directory = "jsonschema-#{version}-darwin-#{arch}"
  binary "#{staged_directory}/bin/jsonschema"
  bash_completion "#{staged_directory}/share/bash-completion/completions/jsonschema"
  zsh_completion "#{staged_directory}/share/zsh/site-functions/_jsonschema"
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-c", "{{staged_path}}/#{staged_directory}/bin/jsonschema"]
    run "#{staged_directory}/bin/jsonschema", base: :staged_path
  end

  caveats <<~EOS
    Tip: Try the Sourcemeta Studio VS Code extension for an enhanced experience!
         Open in VS Code: vscode:extension/sourcemeta.sourcemeta-studio
         Or visit: https://marketplace.visualstudio.com/items?itemName=sourcemeta.sourcemeta-studio
  EOS
end
