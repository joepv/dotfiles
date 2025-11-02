-- ============================================================================
-- EXTRA FILETYPES
-- ============================================================================

-- Ansible filetypes
vim.filetype.add({
    pattern = {
        [".*/playbooks/.*%.yml"] = "yaml.ansible",
        [".*/playbooks/.*%.yaml"] = "yaml.ansible",
        ["roles/.*/tasks/.*%.yml"] = "yaml.ansible",
        ["roles/.*/tasks/.*%.yaml"] = "yaml.ansible",
        ["site%.ya?ml"] = "yaml.ansible",
        ["main%.ya?ml"] = "yaml.ansible",
    },
})
