# This is a Ruby config file which uses the same format that user config files use. It defines the default key
# mappings. Mappings in the user's config file (located in ~/.textmatevimrc) can override these.

require "keymap"
include KeyMap

mode(:command, :visual) do
  # Insertion
  map "i", "insert_backward"
  map "a", "insert_forward"
  map "I", "insert_at_beginning_of_line"
  map "A", "insert_at_end_of_line"
  map "O", "insert_newline_above"
  map "o", "insert_newline_below"

  # Other
  map "u", "undo"
end

mode(:command) do
  map "<esc>", "select_none"
  map "v", "enter_visual_mode"

  # Movement
  map "h", "move_backward"
  map "l", "move_forward"
  map "j", "move_down"
  map "k", "move_up"

  map "b", "move_word_backward"
  map "w", "move_word_forward"
  map "e", "move_to_end_of_word"

  map "0", "move_to_beginning_of_line"
  map "$", "move_to_end_of_line"

  map "G", "move_to_end_of_document"
  map "gg", "move_to_beginning_of_document"

  map "<C-d>", "half_page_down"
  map "<C-u>", "half_page_up"

  # Cutting
  map "x", "cut_forward"
  map "dl", "cut_forward"
  map "dh", "cut_backward"
  map "dw", "cut_word_forward"
  map "db", "cut_word_backward"
  map "dd", "cut_line"
  map "d0", "cut_to_beginning_of_line"
  map "d$", "cut_to_end_of_line"
  map "D", "cut_to_end_of_line"

  # Copying
  map "yy", "copy_line"
  map "yl", "copy_forward"
  map "yh", "copy_backward"
  map "yw", "copy_word_forward"
  map "yb", "copy_word_backward"
  map "y0", "copy_to_beginning_of_line"
  map "y$", "copy_to_end_of_line"

  # Tabs
  map "J", "previous_tab"
  map "K", "next_tab"

  # Other
  map "p", "paste_after"
  map "P", "paste_before"
  map "<C-r>", "reload_textmatevim"
end

mode(:visual) do
  map "<esc>", "enter_command_mode"

  map "h", "select_backward"
  map "l", "select_forward"
  map "j", "select_down"
  map "k", "select_up"

  map "b", "select_word_backward"
  map "w", "select_word_forward"
  map "e", "select_to_end_of_word"

  map "0", "select_to_beginning_of_line"
  map "$", "select_to_end_of_line"

  map "G", "select_to_end_of_document"
  map "gg", "select_to_beginning_of_document"

  map "<C-d>", "select_half_page_down"
  map "<C-u>", "select_half_page_up"

  map "x", ["cut_forward", "enter_command_mode"]
  map "dl", ["cut_forward", "enter_command_mode"]

  map "y", ["copy_selection", "enter_command_mode"]

  map "p", ["paste_after", "enter_command_mode"]
  map "P", ["paste_before", "enter_command_mode"]
end

mode(:insert) do
  map "<esc>", "enter_command_mode"
end
