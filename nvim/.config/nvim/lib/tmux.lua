local M = {}

-- Check if the current environment is tmux.
local function is_tmux()
	local tmux = os.getenv("TMUX")
	local term = os.getenv("TERM")

	return tmux ~= nil or (term ~= nil and term:match("tmux") ~= nil)
end

M.is_tmux = is_tmux

--- @diagnostic disable-next-line: undefined-global
if _REQUIREDNAME == nil then
	_G["util"] = M
else
	--- @diagnostic disable-next-line: undefined-global
	_G[_REQUIREDNAME] = M
end

return M
