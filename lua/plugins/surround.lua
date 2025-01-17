-- Add/change/delete surrounding delimiter pairs with ease
-- https://github.com/kylechui/nvim-surround

-- surr*ound_words             ysiw)           (surround_words)
-- *make strings               ys$"            "make strings"
-- [delete ar*ound me!]        ds]             delete around me!
-- remove <b>HTML t*ags</b>    dst             remove HTML tags
-- 'change quot*es'            cs'"            "change quotes"
-- <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
-- delete(functi*on calls)     dsf             function calls

return {
	'kylechui/nvim-surround',
	version = '*',
	event = { 'BufReadPost', 'BufNewFile' },
	opts = {},
}
