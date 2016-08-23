require_relative 'listable'
require_relative 'errors'
class TodoItem
  include Listable
  include UdaciListErrors  
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end

  def details
    format_description(@description) + "Due: " +
    format_date(due:@due) +
    format_priority(@priority)
  end
end
