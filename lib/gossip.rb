require 'csv'

class Gossip
	attr_accessor :author, :content
	attr_reader :id
	def initialize(author, content)

		@author = author
		@content = content
		@hash = Hash.new

		@hash[@author] = @content
	end
	
	def save
		CSV.open("./db/gossip.csv", "ab") {|csv| @hash.to_a.each {|elem| csv << elem} }
	end
	def self.all
		@all_gossips = Array.new
        CSV.read("./db/gossip.csv").each do |csv_line|
        @all_gossips << Gossip.new(csv_line[0], csv_line[1])
       end
       @id = @all_gossips.length + 1
      return @all_gossips
	end
	def self.find(id)
		find_id = id.to_i
		@all_gossips.each do |item|
      	  if item.id == find_id
            return item
          end
		end
	end
end