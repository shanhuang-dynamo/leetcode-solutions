#!/usr/bin/env ruby
# change the hrefs for combination of all languages repos
require 'fileutils'

fnames = Dir['*.md']
titles = []
fnames.each do |fname|
  %r{^\s*\[(?<title>.+?)\]\s*\(.+?\)} =~ File.foreach(fname).first
  titles << title unless title.nil?
end

fnames.each_with_index do |fname, idx|
  break if titles[idx].nil?
  tempfile = File.open(".comb.temp", 'w')
  fin = File.open(fname)
  tempfile << "#{fin.readline}\n" # add additional space
  fin.each do |line|
    /\[!\[(?<lang>.+?)\]\]\(.*\)/ =~ line
    if not lang.nil?
      tempfile << "[![#{lang}]](../#{lang}/#{fname})\n"
    else
      %r{images/(?<img>.*)} =~ line
      if not img.nil?
        tempfile << line.sub('images/', '../images/')
      else
        tempfile << line
      end
    end
  end
  FileUtils.mv tempfile, fname
end
