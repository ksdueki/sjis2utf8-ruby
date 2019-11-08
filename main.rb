require 'nokogiri'

@from_dir = "src"
@to_dir = "dest"

Dir.mkdir(@to_dir, 0666) unless Dir.exist?(@to_dir)

def convert(src, dest)
  doc = Nokogiri::HTML.parse(open(src, "r:Shift_JIS").read)

  dir_name = File.dirname(dest)
  FileUtils.mkdir_p(dir_name) unless FileTest.exist?(dir_name)

  File.open(dest, 'w+') do |html|
    html.write doc.to_html.encode("UTF-8","Shift_JIS").gsub("shift_jis", 'utf-8')
  end
end

def src_htmls
  htmlfiles = File.join("#{@from_dir}/**", "*.htm")
  Pathname.glob(htmlfiles) #.slice 0..5
end

src_htmls.each do |src_path_name|
  convert( src_path_name, src_path_name.sub(@from_dir, @to_dir).sub_ext(".html"))
end
