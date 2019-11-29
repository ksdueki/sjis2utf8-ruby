require 'nokogiri'

@from_dir = "mybook5"
@to_dir = "mybook52"

Dir.mkdir(@to_dir, 0666) unless Dir.exist?(@to_dir)

def pre2br(src, dest)
  doc = Nokogiri::HTML.parse(open(src).read)

  pre = doc.css("pre")[0]

  unless pre.nil? then
    content  = pre.content.gsub(/\R/, "<br>\n")
    pre.replace("<div>#{content}</div>")
  end

  # 親ディレクトリがなければつくる
  dir_name = File.dirname(dest)
  FileUtils.mkdir_p(dir_name) unless FileTest.exist?(dir_name)

  File.open(dest, 'w+') do |html|
    html.write doc.to_html
  end
end

def src_htmls
  htmlfiles = File.join("#{@from_dir}/**", "*.html")
  Pathname.glob(htmlfiles)
end

src_htmls.each do |src_path_name|
  pre2br( src_path_name, src_path_name.sub(@from_dir, @to_dir).sub_ext(".html"))
end

