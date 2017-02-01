

class Node
    attr_accessor :left, :right, :depth
    attr_reader :rating, :title
    def initialize (rating, title, depth = 0)
        @depth = depth
        @rating = rating
        @title = title
        @left = nil
        @right= nil
        @sorted = []
    end
    def insert_new_node(rating, title)
        if @rating > rating && @left == nil # decide if the node is going down the left or right.
            @left = Node.new(rating, title, @depth + 1)
            @depth
        elsif @rating < rating && @right == nil 
            @right = Node.new(rating, title, @depth + 1)
            @depth
        elsif @rating > rating && @left != nil
            child_node = @left
            child_node.insert_new_node(rating, title)
        elsif @rating < rating && @right != nil
            child_node = @right
            child_node.insert_new_node(rating, title)
        end
    end

    def check_rating(rating_to_check)

        if @rating == rating_to_check
            @depth
        else
            if @rating > rating_to_check && @left == nil
                nil
            elsif @rating < rating_to_check && @right == nil
                nil
            elsif @rating < rating_to_check && @right != nil
                @right.check_rating(rating_to_check)
            elsif @rating > rating_to_check && @left != nil
                @left.check_rating(rating_to_check)
            end
                
        end
        
    end

    def find_max
        max = {}
        if @right.nil?
            max[@title] = @rating
            max
        elsif @right
            @right.find_max
        end
    end

    def find_min
        min = {}
        if @left.nil?
            min[@title] = @rating
            min
        elsif @left
            @left.find_min
        end
    end

    def sort
        if @right && @left
            @right.sort
            @left.sort
        elsif @left
            @left.sort
        elsif @right
            @right.sort
        end
        @sorted << {@title=> @rating}
        
        else
            if @left
                @sorted.unshift({@left.title=> @left.rating})   
            end

            if @right
                @sorted << ({@right.title=> @right.rating})
            end
            
    end
end





