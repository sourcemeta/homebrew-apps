cask "jsonschema" do
  version "17.3.3"

  os macos: "darwin", linux: "linux"
  arch arm: "arm64", intel: "x86_64"

  sha256 arm:          "bfe9d3ed08e0c9f779a9ac1e6c88f045ecac7adb20710338e28856d850e268b4",
         intel:        "0adb42dce7c60b0e5d28351c25b2caf72cad10a2d9f7c04ae08e5c2b6dc9a45a",
         arm64_linux:  "5e1f1324511fec432f33333ce1d6ca2f827a678c611657feac3670d81ebce608",
         x86_64_linux: "2b2f91d5b429ee8f440d11c0413a24d6acc1406d209989fb618e39f4ff1157ed"

  url "https://github.com/sourcemeta/jsonschema/releases/download/v#{version}/jsonschema-#{version}-#{os}-#{arch}.zip"
  name "JSON Schema CLI"
  desc "The CLI for working with JSON Schema"
  homepage "https://github.com/sourcemeta/jsonschema"
  # Interpolated outside of `postflight_steps`, as that block resolves `version`,
  # `os` and `arch` against Homebrew's install steps DSL, which has no `os` at
  # all and only gained `arch` in Homebrew 7.0.0
  staged_directory = "jsonschema-#{version}-#{os}-#{arch}"
  binary "#{staged_directory}/bin/jsonschema"
  bash_completion "#{staged_directory}/share/bash-completion/completions/jsonschema"
  zsh_completion "#{staged_directory}/share/zsh/site-functions/_jsonschema"
  postflight_steps do
    on_macos do
      run "/usr/bin/xattr",
          args: ["-c", "{{staged_path}}/#{staged_directory}/bin/jsonschema"]
    end
    run "#{staged_directory}/bin/jsonschema", base: :staged_path
  end

  caveats <<~EOS
    Tip: Try the Sourcemeta Studio VS Code extension for an enhanced experience!
         Open in VS Code: vscode:extension/sourcemeta.sourcemeta-studio
         Or visit: https://marketplace.visualstudio.com/items?itemName=sourcemeta.sourcemeta-studio
  EOS
end
