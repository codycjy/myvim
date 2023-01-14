require('telescope').setup({
    defaults = {
        file_ignore_patterns = { "./node_modules/*", "node_modules", "build/*" },
    }
});
local builtin = require('telescope.builtin');
