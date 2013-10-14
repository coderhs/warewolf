require 'zip/zip'
 
class Odp
# unziping of the odp files to read the xml data of the presentation

  def initialize(file,destination)
    @file = file
    @destination = destination
  end

  def unzip
    Zip::ZipFile.open(@file) { |zip_file|
      zip_file.each { |f|
        f_path=File.join(@destination, f.name)
        FileUtils.mkdir_p(File.dirname(f_path))
        zip_file.extract(f, f_path) unless File.exist?(f_path)
      }
    }
  end
end

Odp.new(ARGV[0],ARGV[1]).unzip

