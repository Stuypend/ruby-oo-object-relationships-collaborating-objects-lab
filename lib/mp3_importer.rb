class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def import(list_of_filenames)
    list_of_filenames.each{ |filename| Song.new_by_filename(filename) }
  end

  def files
    Dir.entries(@path).select {|f| File.ftype(f) == "mp3" }
  end



end