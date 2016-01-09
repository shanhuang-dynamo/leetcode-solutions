#!/usr/bin/env ruby
# scan all '*.md' files in current path, by convention, the first line should be a link
# looks like:
#   [This is Title](https://link.com/content.html)
#
# for each file, add a list behind the first line (and at the end of file) like:
#  - prev: none
#  - [next: The Second Article](second-article.md)
#
# XXX: according to http://stackoverflow.com/questions/20598628/do-style-tags-work-in-markdown
#      it seems that i can't provide a css to github markdown file. So I can't create a navigation
#      bar inside the md file. :(
require 'fileutils'

fnames = Dir['*.md']
titles = []
fnames.each do |fname|
  %r{^\s*\[(?<title>.+?)\]\s*\(.+?\)} =~ File.foreach(fname).first
  titles << title unless title.nil?
end

fnames.each_with_index do |fname, idx|
  break if titles[idx].nil?
  tempfile = File.open(".nav.temp", 'w')
  fin = File.open(fname)
  tempfile << "#{fin.readline}\n"
  tempfile << (idx == 0 ? "- prev: none\n" : "- [prev: #{titles[idx-1]}](#{fnames[idx-1]})\n")
  tempfile << (titles[idx+1].nil? ? "- next: none\n" : "- [next: #{titles[idx+1]}](#{fnames[idx+1]})\n")
  tempfile << "\n---\n\n"
  fin.each do |line|
    tempfile << line
  end
  tempfile << "\n---\n\n"
  tempfile << (idx == 0 ? "- prev: none\n" : "- [prev: #{titles[idx-1]}](#{fnames[idx-1]})\n")
  tempfile << (titles[idx+1].nil? ? "- next: none\n" : "- [next: #{titles[idx+1]}](#{fnames[idx+1]})\n")
  FileUtils.mv tempfile, fname
end
