-- ~/.config/nvim/lua/snippets/vue.lua
local ls = require("luasnip")
local s  = ls.snippet
local t  = ls.text_node

return {
    s("vtc", t({
        '<script lang="ts" setup>',
        '',
        '</script>',
        '',
        '<template>',
        '  ',
        '</template>',
    })),

    s("vtcs", t({
        '<script lang="ts" setup>',
        '',
        '</script>',
        '',
        '<template>',
        '  ',
        '</template>',
        '',
        '<style scoped>',
        '',
        '</style>',
    })),
}
