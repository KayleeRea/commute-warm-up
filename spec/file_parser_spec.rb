require 'spec_helper'
require_relative '../lib/file_parser'

describe FileParser do
  it 'reads CSV' do
    parsed_info = FileParser.new.get_data('/Users/Kaylee/gSchoolWork/commute-warm-up/data/test_data.csv')
    expect(parsed_info).to eq([["Person", "Week", "Day", "Mode", "Inbound", "Outbound", "Distance"], ["Emily", "2", "Thursday", "Walk", "12", "15", "0.65"], ["Gerard", "2", "Wednesday", "Drive", "14", "12", "5"], ["Elsa", "1", "Wednesday", "Drive", "27", "55", "24"], ["Elsa", "5", "Wednesday", "Drive", "29", "50", "24"], ["Rachel", "2", "Thursday", "Walk", "20", "20", "0.9"]])
  end
end