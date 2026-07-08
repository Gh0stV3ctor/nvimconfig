-- Snippets engine — LuaSnip, fed by core.language aggregator.
-- Each lang file can declare a snippets function that returns Luasnip snippet nodes.
-- The aggregator collects them into language.snippets[filetype] = {function, ...}.
-- This plugin evaluates each function once (memoized by function identity) and
-- registers the result with LuaSnip for the corresponding filetype.
return {
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        lazy = true,
        config = function()
            local luasnip = require('luasnip')
            local language = require('core.language')

            luasnip.setup({
                history = true,
                delete_check_events = 'TextChanged',
            })

            local evaluated = {}
            for ft, fns in pairs(language.snippets) do
                for _, fn in ipairs(fns) do
                    if not evaluated[fn] then
                        local ok, result = pcall(fn)
                        evaluated[fn] = { ok = ok, result = result }
                    end
                    local entry = evaluated[fn]
                    if entry.ok and type(entry.result) == 'table' then
                        luasnip.add_snippets(ft, entry.result)
                    end
                end
            end
        end,
    },
}
