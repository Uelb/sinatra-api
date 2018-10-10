class JSONHandler
  def initialize name
    @name = name
    @file = JSON.parse(File.read('data.json'))
  end

  def read_element id
    json_elem = @file[@name].find do |element|
      element['id'] == id.to_i
    end
    json_elem&.to_json
  end

  def read_collection
    @file[@name].to_json
  end
end
