require_relative 'listable'
require_relative 'errors'
class TodoItem
  include Listable
  include UdaciListErrors  
  attr_reader :description, :due, :priority, :type

  def initialize(description, options={}, type)
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    @type = type.capitalize
  end

  def new_priority(new_priority)
    @priority = new_priority
  end

  def details
    format_description(@description, @type) + "Due: " +
    format_date(due:@due) +
    format_priority(@priority)
  end
end