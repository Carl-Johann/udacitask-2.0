require_relative 'listable'
class LinkItem
  include Listable
  attr_reader :description, :site_name, :type

  def initialize(url, options={}, type)
    @description = url
    @site_name = options[:site_name]
    @type = type.capitalize
  end

  def format_name
    @site_name ? @site_name : "'No Site Name'"
  end

  def new_priority(new_priority)
    @priority = new_priority
  end
  
  def details
    format_description(@description, @type) + "Site Name: " + format_name
  end
end
