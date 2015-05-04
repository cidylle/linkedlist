# Example of a linked list implementation with a duplicate removal method.
# Author:: Christian Idylle (idylle.christian@gmail.com)
# License:: The MIT License (MIT) Copyright (c) 2015 Christian Idylle

class Node
	attr_accessor :value, :next 
	def initialize(value)
		@value = value
		@next = nil
	end
end
 
def add_node(root, value)
	while !root.next.nil? 
		root = root.next 
	end
	node = Node.new(value)
	root.next = node
end

def remove_node(root, value)
	while !root.next.nil?
		if root.next.value == value
			root.next = root.next.next
		end
	end
end

def print_list(root)
	while !root.next.nil?
		puts root.value 
		root = root.next
	end
	puts root.value
end

def remove_duplicates(root)
	values = {}
	previous = nil
	while !root.next.nil?
		if values[root.value].nil? 
			values[root.value] = true
			previous = root
		else 
			previous.next = previous.next.next
			root = previous.next
		end
	end
	previous.next = nil if !values[root.value].nil?
end







