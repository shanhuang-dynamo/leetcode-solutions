#!/usr/bin/env ruby
# add naviagtion links to other lanuges' solution of the same problem
# will add under the first title
require 'fileutils'

fnames = Dir['*.md']
titles = []
fnames.each do |fname|
  %r{^\s*\[(?<title>.+?)\]\s*\(.+?\)} =~ File.foreach(fname).first
  titles << title unless title.nil?
end

fnames.each_with_index do |fname, idx|
  break if titles[idx].nil?
  tempfile = File.open(".nav2.temp", 'w')
  fin = File.open(fname)
  tempfile << "#{fin.readline}"

  ['java', 'cpp', 'c', 'csharp', 'ruby', 'python', 'js'].each do |lang|
    tempfile << "[![#{lang}]](https://github.com/leetcode-study-group/leetcode-#{lang}-solutions/blob/master/#{fname})\n"
  end
  ['java', 'cpp', 'c', 'csharp', 'ruby', 'python', 'js'].each do |lang|
    tempfile << "[#{lang}]: images/#{lang}-logo.png\n"
  end

  fin.each do |line|
    tempfile << line
  end
  FileUtils.mv tempfile, fname
end
