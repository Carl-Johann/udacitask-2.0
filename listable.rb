module Listable
  
  def format_description(description)
    "#{description}".ljust(30)
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
end


