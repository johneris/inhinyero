# frozen_string_literal: true

require_relative '../command'
require "tty-prompt"
require 'fileutils'

module Inhinyero
  module Commands
    class Nuke < Inhinyero::Command
      def initialize(dir, options)
        @dir = dir
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        # Get *.xcodeproj and *.xcworkspace files
        files = Dir[File.join(
            @dir, '**', '*'
        )].filter { |p|
          %w(.xcodeproj .xcworkspace).include? File.extname(p) and not(["project.xcworkspace"].include? File.basename(p))
        }

        if files.empty?
          puts "There are no *.xcodeproj and *.xcworkspace files found."
          return
        end

        file_names = files.map { |file| File.basename(file) }
        map_file_name_file = files.each_with_object({}) do |file, map|
          map[File.basename(file)] = file
        end

        # Ask what to delete
        prompt = TTY::Prompt.new
        selected_file_names = prompt.multi_select("XCode Projects and Workspace", file_names)

        # Delete selected files
        selected_file_names.each { |file_name|
          puts "Deleting #{file_name}"
          FileUtils.rm_rf(map_file_name_file[file_name])
        }

        output.puts "OK"
      end
    end
  end
end
