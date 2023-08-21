# frozen_string_literal: true

# this class does funny things for lab#7
class Action
  # attr_reader file_f: f

  def self.open(source_file_name = 'F.dat', input = nil)
    @file_f = File.open source_file_name
    @file_g = File.open 'G.dat', 'w'
    unless input.nil?
      @file_f.close
      @file_f = File.open source_file_name, 'w'
      @file_f.write input
    end
    !!@file_f && !!@file_g
  end

  def self.process
    return unless @file_f || @file_g

    @file_data = @file_f.readlines.map(&:chomp)
    @file_data.map! { |line| line.reverse.chars.reject { |c| 'eErtU'.include?(c) }.join }
    @file_g.write @file_data.join("\n")
    @file_f.close
    @file_g.close

    @file_data
  end
end
