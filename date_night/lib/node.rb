
require 'pry'
class Node
    attr_accessor :left, :right, :depth, :all_movies
    attr_reader :rating, :title, :sorted
    def initialize (rating, title, depth = 0)
        @depth = depth
        @rating = rating
        @title = title
        @left = nil
        @right= nil
        @sorted = []
    end
    def insert_new_node(rating, title) 
        if @rating == rating
            "no insert"
        elsif @rating > rating && @left == nil 
            @left = Node.new(rating, title, @depth + 1)            
        elsif @rating < rating && @right == nil 
            @right = Node.new(rating, title, @depth + 1)          
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
        if @right.nil?
            {@title => @rating}       
        else 
            @right.find_max
        end
    end

    def find_min
        if @left.nil?
            {@title => @rating}       
        else
            @left.find_min
        end
    end

    def sort_all(rating_to_check)

         if @rating == rating_to_check
            {@title => @rating}
         else
            if @rating > rating_to_check && @left == nil
                nil
            elsif @rating < rating_to_check && @right == nil
                nil
            elsif @rating < rating_to_check && @right != nil
                @right.sort_all(rating_to_check)
            elsif @rating > rating_to_check && @left != nil
                @left.sort_all(rating_to_check)
            end
                
         end
        
    end

    def find_children(depth)
        nodes = 0
        if @left && @depth < depth
            @left.find_children(depth)
        end
        if @right && @depth < depth
            @right.find_children(depth)
        end
        # if (@left) && (@depth >= depth) 
        #     if @left
        #         nodes += 1 
        #         @left.find_children(depth)
        #     end
        #     if @right 
        #         nodes += 1
        #         @right.find_children(depth)
        #     end
        # end
        if (@right || @left) && (@depth >= depth) 
            if @left
                nodes += 1 
                nodes += @left.find_children(depth)
            end
            if @right 
                nodes += 1
                nodes += @right.find_children(depth)
            end
        end
        # if @right.nil? && @left.nil?
        #     nodes +=1
        # end
        nodes
        
    end
    
end





