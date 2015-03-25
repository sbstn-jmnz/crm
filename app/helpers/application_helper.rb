module ApplicationHelper
	def link_to_add_fields(name, f, association)
    	new_object = f.object.send(association).build
    	fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      		render(association.to_s.singularize + "_fields", :f => builder)
    	end
    	puts "HOLAAAAA"
    	puts name
    	puts association
    	puts fields
    	puts "CHAOOOO"
    	link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  	end
end
