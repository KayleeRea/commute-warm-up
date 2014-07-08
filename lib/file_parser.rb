require 'csv'
class FileParser
  def get_data(path)
    csv_data = File.open(path)
    CSV.parse(csv_data)
  end
end