local present, conflict = pcall(require, "git-conflict")
if not present then
  return
end

conflict.setup({
  default_mappings = true, -- disable buffer local mapping created by this plugin
  disable_diagnostics = false, -- this will disable the diagnostics in a buffer whilst it is conflicted
    highlights = { -- they must have background color, otherwise the default color will be used
    incoming = 'DiffText',
    current = 'DiffAdd',
  }
})
