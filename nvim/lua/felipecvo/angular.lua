-- rails.vim-style navigation between the files of an Angular component.
-- Enabled in buffers under a directory containing angular.json or nx.json.
--
--   :A   component <-> spec                  (:AS :AV :AT to split/vsplit/tab)
--   :R   cycle component -> template -> style  (:RS :RV :RT)
--   :NgComponent :NgTemplate :NgStyle :NgSpec (take modifiers, e.g. :vert NgStyle)
--
--   <leader>nc component   <leader>nt template   <leader>ns style   <leader>nx spec

local STYLE_EXTS = { "scss", "sass", "less", "css", "styl" }
local CYCLE = { "component", "template", "style" }

local function exists(path)
  return path ~= nil and vim.uv.fs_stat(path) ~= nil
end

local function kind(path)
  if path:match("%.spec%.ts$") then return "spec" end
  if path:match("%.ts$") then return "component" end
  if path:match("%.html$") then return "template" end
  for _, ext in ipairs(STYLE_EXTS) do
    if path:match("%." .. ext .. "$") then return "style" end
  end
end

-- "app/user/user.component.spec.ts" -> "app/user/user.component"
local function stem(path)
  local pattern = kind(path) == "spec" and "%.spec%.ts$" or "%.[^./]+$"
  return (path:gsub(pattern, ""))
end

local function resolve(dir, url)
  return vim.fs.normalize(vim.fn.simplify(dir .. "/" .. url))
end

-- Reads templateUrl / styleUrl / styleUrls from a component's decorator.
local function urls(ts)
  local src = exists(ts) and table.concat(vim.fn.readfile(ts), "\n") or ""
  local dir = vim.fs.dirname(ts)

  local template = src:match("templateUrl%s*:%s*['\"`]([^'\"`]+)")
  local styles = {}
  local single = src:match("styleUrl%s*:%s*['\"`]([^'\"`]+)")
  if single then
    table.insert(styles, resolve(dir, single))
  end
  local list = src:match("styleUrls%s*:%s*(%b[])")
  for url in (list or ""):gmatch("['\"`]([^'\"`]+)") do
    table.insert(styles, resolve(dir, url))
  end

  return template and resolve(dir, template), styles
end

local function find_component(path)
  local k = kind(path)
  if k == "component" then return path end

  local candidate = stem(path) .. ".ts"
  if exists(candidate) then return candidate end
  if k == "spec" then return nil end

  -- File names don't line up: find the sibling component that points at this file.
  local dir = vim.fs.dirname(path)
  for name, type in vim.fs.dir(dir) do
    if type == "file" and kind(name) == "component" then
      local ts = dir .. "/" .. name
      local template, styles = urls(ts)
      if template == path or vim.list_contains(styles, path) then return ts end
    end
  end
end

-- Existing files of the component `path` belongs to. `spec` is always set so :A can create it.
local function component_files(path)
  local ts = find_component(path)
  if not ts then return nil end

  local base = stem(ts)
  local template, styles = urls(ts)
  for _, ext in ipairs(STYLE_EXTS) do
    table.insert(styles, base .. "." .. ext)
  end

  local files = {
    component = ts,
    template = template or base .. ".html",
    spec = base .. ".spec.ts",
  }
  if not exists(files.template) then files.template = nil end
  for _, style in ipairs(styles) do
    if exists(style) then
      files.style = style
      break
    end
  end
  return files
end

local function current_path()
  return vim.fs.normalize(vim.api.nvim_buf_get_name(0))
end

local function warn(msg)
  vim.notify(msg, vim.log.levels.WARN, { title = "angular" })
end

local function open(path, cmd, mods)
  if cmd == "edit" and path == current_path() then return end
  vim.cmd({ cmd = cmd, args = { vim.fn.fnamemodify(path, ":~:.") }, mods = mods, magic = { file = false } })
end

local function jump(target, cmd, mods)
  local files = component_files(current_path())
  if not files then return warn("No component found for this file") end
  if not files[target] then return warn("This component has no " .. target .. " file") end
  open(files[target], cmd, mods)
end

local function alternate(cmd, mods)
  jump(kind(current_path()) == "spec" and "component" or "spec", cmd, mods)
end

local function related(cmd, mods)
  local path = current_path()
  local files = component_files(path)
  if not files then return warn("No component found for this file") end

  local k = kind(path)
  if k == "spec" then return open(files.component, cmd, mods) end

  local start = vim.fn.index(CYCLE, k)
  for i = 1, #CYCLE - 1 do
    local target = files[CYCLE[(start + i) % #CYCLE + 1]]
    if target and target ~= path then return open(target, cmd, mods) end
  end
  warn("No related files (inline template and styles?)")
end

local function attach(buf)
  if vim.b[buf].angular_nav or not vim.fs.root(buf, { "angular.json", "nx.json" }) then return end
  vim.b[buf].angular_nav = true

  local function command(name, fn, cmd)
    vim.api.nvim_buf_create_user_command(buf, name, function(o)
      -- :vert/:tab do nothing to :edit, so treat them as a request to split
      local splits = o.smods.vertical or o.smods.horizontal or o.smods.tab ~= -1
      fn(cmd == "edit" and splits and "split" or cmd, o.smods)
    end, {})
  end

  for suffix, cmd in pairs({ [""] = "edit", S = "split", V = "vsplit", T = "tabedit" }) do
    command("A" .. suffix, alternate, cmd)
    command("R" .. suffix, related, cmd)
  end

  for key, target in pairs({ c = "component", t = "template", s = "style", x = "spec" }) do
    local name = "Ng" .. target:sub(1, 1):upper() .. target:sub(2)
    command(name, function(cmd, mods) jump(target, cmd, mods) end, "edit")
    vim.keymap.set("n", "<leader>n" .. key, "<cmd>" .. name .. "<CR>", { buffer = buf, desc = "Angular " .. target })
  end
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("angular_nav", { clear = true }),
  pattern = { "*.ts", "*.html", "*.scss", "*.sass", "*.less", "*.css", "*.styl" },
  callback = function(ev) attach(ev.buf) end,
})
