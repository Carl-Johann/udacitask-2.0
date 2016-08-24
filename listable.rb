require_relative 'errors'
module Listable
  include UdaciListErrors
  
  def format_description(description, type)
    if type == "Event"
    	return "#{description}".ljust(29)
    else 
    	return "#{description}".ljust(30)
    end
  end

  def format_date(options={})
   	if options.length == 1
  		options[:due] ? options[:due].strftime("%D") : "No due date"
  	elsif options.length == 2
  		dates = options[:start_date].strftime("%D") if options[:start_date]
    	dates << " -- " + options[:end_date].strftime("%D") if options[:end_date]
    	dates = "N/A" if !dates
    	return dates
    end
  end

  def format_priority(priority)
  	if ["high", "medium", "low", nil].include?(priority)
  		value = " ⇧".colorize(:red) if priority == "high"
   		value = " ⇨".colorize(:yellow) if priority == "medium"
   		value = " ⇩".colorize(:green) if priority == "low"
   		value = "" if !priority
   		return value
   	else 
   		raise UdaciListErrors::InvalidPriorityValue, "'#{priority}' is not a valid priority value'"
   	end
  end

  def clear_list(list)
  	list.clear
  end
end


