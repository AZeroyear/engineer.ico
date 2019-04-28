def make_directory_tag(directory)
  excel_class = Array.new
  i = 0
  Dir.glob(directory).each do |dir|
    excel_class[i] = Hash.new
    excel_class[i][:url] = File.basename(dir, ".erb")
    File.open(dir) do |file|
      file.each_line do |line|
        excel_class[i][:title] = $1 if /<h1>(.*)<\/h1>/ =~ line
        excel_class[i][:icon] = line if /<i.*i>/ =~ line
        excel_class[i][:contents] = "<p>#{$1[0,30]}</p>" if /<p>(.*)<\/p>/ =~ line
        break if excel_class[i][:title] && excel_class[i][:icon] && excel_class[i][:contents]
      end
    end
    i += 1
  end
  excel_class.sort_by { |excel| excel[:url] }
end
