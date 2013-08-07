require 'fileutils'
 
class Jekyll < Thor
  include FileUtils

  package_name "Jekyll"

  desc "create POST_NAME", "Create a new draft post"
  method_options :format => :optional
  def draft(name)
    format = options[:format] || "markdown"
    slug = name.downcase.gsub(/ +/,'-').gsub(/[^-\w]/,'').sub(/-+$/,'')
    filename = slug + ".#{format}"
    mkdir_p "_drafts"
    if File.exists?("_drafts/#{filename}")
      puts "#{filename} already exists!"
      return
    end
    File.open("_drafts/#{filename}","w+") do |f|
      f.puts "---"
      f.puts "layout: post"
      f.puts "title: #{name}"
      f.puts "tags:"
      f.puts "-"
      f.puts "excerpt"
      f.puts "---"
    end
    puts "Created _drafts/#{filename}"
  end
 
  desc "publish POST_NAME", "Publish a Post"
  def publish(file=nil)
    unless file
      puts "Choose file:"
      @files = Dir["_drafts/*"]
      @files.each_with_index { |f,i| puts "#{i+1}: #{f}" }
      print "> "
      num = STDIN.gets
      file = @files[num.to_i - 1]
    end
    now = Date.today.strftime("%Y-%m-%d").gsub(/-0/,'-')
    mv file, "_posts/#{now}-#{File.basename(file)}"
  end
end