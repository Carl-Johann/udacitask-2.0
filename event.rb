require_relative 'listable'
class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date, :type

  def initialize(description, options={}, type)
    @description = description
    @start_date = Date.parse(options[:start_date]) if options[:start_date]
    @end_date = Date.parse(options[:end_date]) if options[:end_date]
    @type = type.capitalize
  end

  def new_priority(new_priority)
    @priority = new_priority
  end

  def details
    format_description(@description, @type) + "Event Dates: " + format_date(start_date:@start_date, end_date:@end_date)
  end
end