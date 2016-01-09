#!/usr/bin/env ruby
# fetch the href from the leetcode.com/problemset/algorithms/ (done by wget tr and grep href)
# create a file named `problem-name.md' and heading with href link.
# ./parse-leetcode.rb hrefs.txt
#
# input file format: each line contains one href element
# example: <a href="/relative/name.html">Title</a>
# 
# The script just concat the BASE_URL with href link, and create a file named `problem-name.md' with a markdown link:
# output:
# [Title](https://leetcode.com/relative/name.html)
#
# change the `BASE_URL' and the no's initial value and iterating direction to process other hrefs
BASE_URL = 'https://leetcode.com'
no = 0

href_fname = ARGV[0]
File.foreach(href_fname) {|line| no += 1}

puts "line number: #{no}"
File.foreach(href_fname) do |line|
  %r{<a href="(?<link>.+/(?<name>.+?)/)">(?<title>.+?)</a>} =~ line
  puts "fname: #{no.to_s.rjust(3, '0')}-#{name}.md; title: #{no}. #{title}; link: #{BASE_URL}#{link}"
  File.open("#{no.to_s.rjust(3, '0')}-#{name}.md", 'w') {|f| f.write "[#{no}. #{title}](#{BASE_URL}#{link})\n"}
  no -= 1
end
