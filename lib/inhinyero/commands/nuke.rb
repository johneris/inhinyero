# frozen_string_literal: true

require_relative '../command'

module Inhinyero
  module Commands
    class Nuke < Inhinyero::Command
      def initialize(dir, options)
        @dir = dir
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        Dir.each_child("#{@dir}") {|x| puts "#{x}" }
        output.puts "OK"
      end
    end
  end
end
