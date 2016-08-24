require_relative 'errors.rb'
require_relative 'listable'
class UdaciList
  include UdaciListErrors
  include Listable
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []  
  end

  def add(type, description, options={})
    type = type.downcase
    if ["todo", "event", "link"].include?(type)
      @items.push TodoItem.new(description, options, type) if type == "todo"
      @items.push EventItem.new(description, options, type) if type == "event"
      @items.push LinkItem.new(description, options, type) if type == "link"
    else 
      raise UdaciListErrors::InvalidItemType
    end
  end

  def delete(index)
    if index <= @items.length
      @items.delete_at(index - 1)
    else 
      raise UdaciListErrors::IndexExceedsListSize,  "'Deletion Index Exceeds List Length'"
    end
  end

  def all
    if @title == nil
      @title = "Untitled List"
    end
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.type}: #{item.details}"
    end
  end

  def filter(item_type)
    if ["Todo", "Event", "Link"].include?(item_type.capitalize)
      @items.select!{|item| item.type == item_type.capitalize}
    else 
      raise UdaciListErrors::InvalidItemType, "'#{item_type} is not a valid item type'"
    end
  end

  def change_priority(index, new_priority)
    @items[index-1].new_priority(new_priority)
  end

  def clear_list
    @items.clear
  end
end
