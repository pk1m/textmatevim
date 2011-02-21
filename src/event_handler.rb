#!/usr/bin/env ruby

require "rubygems"
require "json"
require File.join(File.dirname(__FILE__), "keystroke")

def log(str)
  file = File.open("/tmp/event_handler.log", "a") { |file| file.puts(str) }
end

class EventHandler
  def initialize
    @current_mode = "insert"
  end

  def handle_key_message(message)
    message = JSON.parse(message)
    keystroke = KeyStroke.from_character_and_modifier_flags(message["characters"], message["modifierFlags"])

    if @current_mode == "insert"
      if keystroke.to_s == "escape"
        @current_mode = "command"
        return ["enterCommandMode"]
      else
        return []
      end
    end

    result = case keystroke.to_s
      when "i"
        @current_mode = "insert"
        ["enterInsertMode"]
      when "h": ["moveBackward:"]
      when "l": ["moveForward:"]
      when "j": ["moveDown:"]
      when "k": ["moveUp:"]

      when "b": ["moveWordBackward:"]
      when "w": ["moveWordForward:"]
      when "e": ["moveToEndOfWord:"]

      when "0": ["moveToBeginningOfLine:"]
      when "$": ["moveToEndOfLine:"]

      when "G": ["moveToEndOfDocument:"]

      when "ctrl+d": ["moveDown:"] * 6
      when "ctrl+u": ["moveUp:"] * 6
    else
      []
    end
  end
end

log "TextMateVim event_handler coprocess is online."

event_handler = EventHandler.new
while message = STDIN.gets
  response = []
  begin
    response = event_handler.handle_key_message(message)
  rescue => error
    log error.inspect
    response = []
  end
  puts response.to_json
  STDOUT.flush
end