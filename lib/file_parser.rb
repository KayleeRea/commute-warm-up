require 'csv'

class FileParser
  def get_data(path)
    data = File.read(path)
    @parsed = CSV.parse(data)
  end
end