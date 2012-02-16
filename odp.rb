require 'rubygems'
require 'zip/zip'
 
class Decomp
# unziping of the odp files to read the xml data of the presentation

def initialize(file,destination)
	@file = file
	@destination = destination
end

def self.unzip_odp ()
  Zip::ZipFile.open(@file) { |zip_file|
   zip_file.each { |f|
     f_path=File.join(@destination, f.name)
     FileUtils.mkdir_p(File.dirname(f_path))
     zip_file.extract(f, f_path) unless File.exist?(f_path)
   }
  }
end

end


Decomp.new(ARGV[0],ARGV[1])
Decomp.unzip_odp()