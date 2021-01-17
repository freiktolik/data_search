# frozen_string_literal: true

class ProgrammingLanguage
  NAME        = 'Name'
  TYPE        = 'Type'
  DESIGNED_BY = 'Designed by'

  def initialize(record)
    @name = record.fetch(NAME)
    @type = record.fetch(TYPE)
    @designed_by = record.fetch(DESIGNED_BY)
  end

  # checking whether searching values are in the record
  def call(searching_values)
    searching_values.all? { |word| record_attribute_values.include?(word) }
  end

  private

  attr_accessor :name, :type, :designed_by

  def record_attribute_values
    instance_variables.map(&method(:instance_variable_get)).join(' ')
  end
end
