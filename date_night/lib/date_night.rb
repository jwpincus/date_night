require 'pry'
require_relative 'node.rb'
class BinarySearchTree
    attr_accessor :top_node, :total_nodes
    def initialize
        @top_node = nil
        @total_nodes = 0
    end
    def insert(rating, title)
        @total_nodes += 1
        if @top_node == nil
            depth = 0
            @top_node = Node.new(rating, title, depth)
        else 
            @top_node.insert_new_node(rating, title)
        end
        @top_node.check_rating(rating)
    end
    def include?(rating_to_check)
        rating_exists = @top_node.check_rating(rating_to_check)
        if rating_exists != nil
            true
        elsif rating_exists == nil
            false
        end
    end
    def depth_of(rating_to_check)
        @top_node.check_rating(rating_to_check)
    end

    def max
        @top_node.find_max
    end

    def min
        @top_node.find_min
    end

    def sort
        sorted = []
            (0..100).each do |number|
                if @top_node.sort_all(number)
                    sorted << @top_node.sort_all(number)
                end
            end
        sorted
    end
    def load(file)
        list_raw = File.open(file, 'r')
        list_array = list_raw.read.split("\n")
        existing_nodes = @total_nodes
        list_array.each do |movie|
            
            if @top_node == nil
                depth = 0
                @total_nodes += 1
                @top_node = Node.new(movie.split(', ', 2)[0].to_i, movie.split(', ', 2)[1], depth)
            else 
                if @top_node.insert_new_node(movie.split(', ', 2)[0].to_i, movie.split(', ', 2)[1]) != "no insert"
                    @total_nodes += 1
                    
                end
            end
                    
        end
        @total_nodes - existing_nodes
    end

    def health(depth)
        children = @top_node.find_children(depth)
        return_array = []
        return_array << [@top_node.rating, (children+1) , (((children+1)/@total_nodes.to_f)*100).floor]
    end    
end
