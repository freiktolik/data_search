# frozen_string_literal: true

class Database
  attr_accessor :programming_languages

  def initialize(data_hashes)
    @programming_languages = data_hashes
  end
end
