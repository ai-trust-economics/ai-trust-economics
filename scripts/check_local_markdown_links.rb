# frozen_string_literal: true

require "cgi"
require "pathname"

ROOT = Pathname.new(__dir__).join("..").realpath
LINK_PATTERN = /!?\[[^\]]*\]\(([^)]+)\)/
IGNORED_PREFIXES = ["#", "http://", "https://", "mailto:", "data:"].freeze

failures = []

Dir.glob(ROOT.join("**", "*.md"), File::FNM_DOTMATCH).sort.each do |filename|
  file = Pathname.new(filename)

  File.foreach(file).with_index(1) do |line, line_number|
    line.scan(LINK_PATTERN).flatten.each do |raw_target|
      target = raw_target.strip
      target = target[1..-2] if target.start_with?("<") && target.end_with?(">")
      target = target.sub(/\s+["'][^"']*["']\z/, "")

      next if target.empty? || IGNORED_PREFIXES.any? { |prefix| target.start_with?(prefix) }

      path = CGI.unescape(target.split("#", 2).first)
      next if path.empty?

      destination = file.dirname.join(path).cleanpath
      unless destination.to_s.start_with?("#{ROOT}/") || destination == ROOT
        failures << "#{file.relative_path_from(ROOT)}:#{line_number}: link escapes the repository: #{raw_target}"
        next
      end

      unless destination.exist?
        failures << "#{file.relative_path_from(ROOT)}:#{line_number}: missing local target: #{raw_target}"
      end
    end
  end
end

if failures.empty?
  puts "All local Markdown links resolve."
else
  warn failures.join("\n")
  exit 1
end
