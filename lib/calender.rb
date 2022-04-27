#!/usr/bin/env ruby
require "colorize"
require "date"

now = Date.today
first_day = Date.new(now.year, now.month, 1)
wday = first_day.wday
first_line_num = wday == 7 ? 7 : 7-wday
days_of_month = first_day.next_month.prev_day.day
first_line = '   '*(7-first_line_num) + first_line_num.times.map{|i| i+1==now.mday ? (i+1).to_s.rjust(2,' ').colorize(:red) : (i+1).to_s.rjust(2,' ')}.join(' ')
rest_of_lines = (first_line_num+1).upto(days_of_month).map(&:to_i).group_by{|i| (i-first_line_num-1)/7}.values.map{|i| i.map{|j| j == now.mday ? j.to_s.rjust(2,' ').colorize(:red) : j.to_s.rjust(2,' ')}.join(' ')}.join("\n")
head_str = "#{now.strftime('%m %Y')}".center(21)
week_str = 'Su Mo Tu We Th Fr Sa'

puts "#{head_str}\n#{week_str}\n#{first_line}\n#{rest_of_lines}"
