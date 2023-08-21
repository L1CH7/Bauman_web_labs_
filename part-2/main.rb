# frozen_string_literal: true

# this class does logic
class Action
  def self.zip_date_temp(date_a, temp_a)
    date_a.zip(temp_a)
  end

  def self.print_date_temp(date_temp_a)
    date_temp_a.each { |date, temp| printf("%5s |%4d\n", date, temp) }
  end

  def self.calc10(date_temp_a)
    date_temp_a.select { |_, temp| temp < -10 }.size
  end
end
