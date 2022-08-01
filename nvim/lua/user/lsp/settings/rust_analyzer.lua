return {
	settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
			notifications = {
				cargoTomlNotFound = false
			},
			detachedFiles = true,
        }
    }
}
