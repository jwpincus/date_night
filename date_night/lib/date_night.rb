require_relative 'node.rb'
class BinarySearchTree
    attr_accessor :top_node
    def initialize
        @top_node = nil
    end
    def insert(rating, title)

        if @top_node == nil
            depth = 0
            @top_node = Node.new(rating, title, depth)
        else 
            @top_node.insert_new_node(rating, title)
        end

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
        @top_node.sort
    end

    
end
