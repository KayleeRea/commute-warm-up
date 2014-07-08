require_relative '../lib/commute_sorter'
require_relative '../lib/file_parser'
require 'pp'

parsed_csv = FileParser.new.get_data('/Users/Kaylee/gSchoolWork/commute-warm-up/data/gschool_commute_data.csv')
pp CommuteSorter.new.group_by_name(parsed_csv)
