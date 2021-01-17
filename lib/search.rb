# frozen_string_literal: true

require 'json'
require_relative 'app/models/database'
require_relative 'app/services/search_performer'
require_relative 'app/models/programming_language'

DATA = 'app/database/data.json'
file = File.read(DATA)
data_hashes = JSON.parse(file)
database = Database.new(data_hashes)

puts SearchPerformer.new(database).find_data(ARGV)
