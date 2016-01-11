#!/usr/bin/env ruby
# let the NO match the NO on the OJ
require 'fileutils'

fnames=Dir['*.md']
fnames.each do |fname|
  tempfile = File.open('.number.temp', 'w')
  heading = File.open(fname).readline
  /(?<file_no>.+?)-.*/ =~ fname
  /\[(?<content_no>.+?)\./ =~ heading
  heading.sub!(content_no, file_no)
  tempfile << heading << "\n"
  FileUtils.mv tempfile, fname
end
