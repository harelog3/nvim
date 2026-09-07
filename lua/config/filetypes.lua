vim.filetype.add({
    pattern = {
        [".*%.html"] = {
            function(path)
                local angular_root = vim.fs.find("angular.json", {
                    path = vim.fs.dirname(path),
                    upward = true,
                })[1]

                if angular_root then
                    return "htmlangular"
                end
            end,
            { priority = 10 },
        },
    },
})
