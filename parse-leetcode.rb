#!/usr/bin/env ruby
# fetch the href from the leetcode.com/problemset/algorithms/ (done by wget tr and grep href)
# create a file named `problem-name.md' and heading with href link.
# ./parse-leetcode.rb hrefs.txt
LEET_CODE_SITE = 'https://leetcode.com'

href_fname = ARGV[0]
no = 0
File.foreach(href_fname) {|line| no += 1}

puts "line number: #{no}"
File.foreach(href_fname) do |line|
  %r{<a href="(?<link>.+/(?<name>.+?)/)">(?<title>.+?)</a>} =~ line
  puts "fname: #{no.to_s.rjust(3, '0')}-#{name}.md; title: #{no}. #{title}; link: #{LEET_CODE_SITE}#{link}"
  File.open("#{no.to_s.rjust(3, '0')}-#{name}.md", 'w') {|f| f.write "[#{no}. #{title}](#{LEET_CODE_SITE}#{link})\n"}
  no -= 1
end
