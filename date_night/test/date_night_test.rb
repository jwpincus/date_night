gem 'minitest', '~>5.0'
require 'minitest/autorun'
require 'minitest/pride'
#require './lib/node.rb'
require './lib/date_night.rb'
class Date_night_test < Minitest::Test
    def test_node_works
        movie = Node.new(100, "Jaws")
        assert_equal 100, movie.rating
        assert_equal "Jaws", movie.title
        assert_nil movie.left
        assert_nil movie.right
    end

    def test_insert
        tree = BinarySearchTree.new
        tree.insert(50, "Jaws 2")
        tree.insert(40, "Rush Hour")
        tree.insert(60, "Titanic")
        tree.insert(70, "Layer Cake")
        tree.insert(30, "Gigli")
        tree.insert(20, "Crossroads")
        assert_equal "Jaws 2", tree.top_node.title
        assert_equal "Rush Hour", tree.top_node.left.title
        assert_equal "Titanic", tree.top_node.right.title
        assert_equal "Layer Cake", tree.top_node.right.right.title
        assert_equal "Crossroads", tree.top_node.left.left.left.title

    end

    def test_value_in_tree
        tree = BinarySearchTree.new
        tree.insert(40, "Rush Hour")
        tree.insert(50, "Jaws 2")
        assert tree.include?(50)
        refute tree.include?(72)
    end

    def test_depth_of_node
        tree = BinarySearchTree.new
        tree.insert(40, "Rush Hour")
        tree.insert(50, "Jaws 2")
        assert_equal 1, tree.depth_of(50)
    end

    def test_max
        tree = BinarySearchTree.new
        tree.insert(50, "Jaws 2")
        tree.insert(40, "Rush Hour")
        tree.insert(60, "Titanic")
        tree.insert(70, "Layer Cake")
        tree.insert(30, "Gigli")
        tree.insert(20, "Crossroads")
        assert_equal tree.max, {"Layer Cake" => 70}
    end

    def test_min
        tree = BinarySearchTree.new
        tree.insert(50, "Jaws 2")
        tree.insert(40, "Rush Hour")
        tree.insert(60, "Titanic")
        tree.insert(70, "Layer Cake")
        tree.insert(30, "Gigli")
        tree.insert(20, "Crossroads")
        assert_equal tree.min, {"Crossroads" => 20}
    end

    def test_sort
        tree = BinarySearchTree.new
        tree.insert(50, "Jaws 2")
        tree.insert(40, "Rush Hour")
        tree.insert(60, "Titanic")
        tree.insert(55, "Spy")
        assert_equal tree.sort, [{"Rush Hour" => 40}, {"Jaws 2" => 50}, {"Spy" => 55}, {"Titanic" => 60}]
    end
end