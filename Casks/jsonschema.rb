cask "jsonschema" do
  version "17.3.1"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "8f27ad7ce3069ce4be8d6f40a68301f038366091edaeda886f0e3e212d25c5b9",
         intel: "f2f55c64a769eec023909561e6b21c2217867974da02116dde918472096cc7bf"

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
