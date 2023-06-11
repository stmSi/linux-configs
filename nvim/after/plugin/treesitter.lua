require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "c", "cpp", "dockerfile", "gdscript", "gitignore", "go",
    "rust", "html", "java", "javascript", "json", "markdown",
    "markdown_inline", "php", "python", "regex", "scss", "rst", "sql", "tsx",
    "vue", "yaml", 
-- "godot-resource"
},
  highlight = {
    enable = true, -- Enable syntax highlighting
  },
  indent = {
    enable = true, -- Enable indentation based on the syntax tree
  },
  folding = {
    enable = true, -- Enable folding based on the syntax tree
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
}
