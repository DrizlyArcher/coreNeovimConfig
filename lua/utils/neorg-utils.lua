-- This works in that it sourcers the app dirs and offers them, unfortuantely we are unable to create workspaces on the fly so this can't be used as intended at the moment.
function Offer_Workspace()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local function get_app_dirs()
    local apps_root = "apps"
    local scanned_roots = vim.loop.fs_scandir(apps_root)
    local notes_root = "~./Desktop/Repositories/rise-pol/"
    local notes_folder_name = "/charlieRepoNotes"
    local found_app_strings = {}

    local is_looping = true

    if scanned_roots then
      print("Found apps")
      while is_looping do
        local name, file_type = vim.loop.fs_scandir_next(scanned_roots)
        if file_type == "directory" then
          local found_directory_string = notes_root .. name .. notes_folder_name
          --table.insert(found_app_strings, found_directory_string)
          found_app_strings[name] = found_directory_string
          -- I should actually create a table and store it using the name as the key
          -- This way I can use that key to pull out the found_directory_string from it
        end
        if not name then
          is_looping = false
        end
      end
    else
      print("Nothing found....")
    end

    return found_app_strings
  end

  local function offer_selection_return_path()
    local results = {}
    local apps = get_app_dirs()
    for k, _ in pairs(apps) do
      table.insert(results, k)
    end
    local entry = ""

    pickers
        .new({}, {
          prompt_title = "Which workspace",
          finder = finders.new_table({ results = results
          }),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(_, map)
            local open_picker = function(prompt_bufnr)
              entry = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              print("selected", entry)
            end

            map("i", "<CR>", open_picker)
            map("n", "<CR>", open_picker)
            return true
          end,
        }):find()

    return apps[entry]
  end

  vim.keymap.set("n", "<leader>nd", offer_selection_return_path, { desc = "Choose [N]ote [Directory]" })
end
