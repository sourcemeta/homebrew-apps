cask "jsonschema" do
  version "17.3.2"

  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "c4049ea94b9032086e2ae56bbf7c5583f960f08584c2285a5a3f4025bcad32fc",
         intel: "b5103187127cfd9e42b81ea6283f8d57367aec0bf3d9fcd821d651a8eabb807d"

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
