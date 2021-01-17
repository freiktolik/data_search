# frozen_string_literal: true

class SearchPerformer
  attr_accessor :database

  def initialize(database)
    @database = database
  end

  def find_data(searching_values)
    database.programming_languages.select do |programming_language|
      ProgrammingLanguage.new(programming_language).call(searching_values)
    end
  end
end
