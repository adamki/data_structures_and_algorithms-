require 'pry'

class BinarySearchTree
  attr_reader :root_node, :count

  def initialize
    @count = 0
  end

  def push(data, current_node=root_node)
    if root_node.nil?
      @count += 1
      @root_node = Node.new(data, nil, nil, true)
    elsif data <= current_node.data
      if current_node.left
        push(data, current_node.left)
      else
        @count += 1
        current_node.left = Node.new(data)
      end
    elsif data > current_node.data
      if current_node.right
        push(data, current_node.right)
      else
        @count += 1
        current_node.right = Node.new(data)
      end
    end
    @tree
  end

  def include?(data, current_node = @root_node)
    return false if current_node.nil?
    if data >= current_node.data
      current_node.data == data || include?(data, current_node.right)
    else
      current_node.data == data || include?(data, current_node.left)
    end
  end

  def to_array( current_node = root_node )
    if current_node.nil?
      []
    else
      [current_node.data] + to_array(current_node.left) + to_array(current_node.right)
    end
  end

  def sort(current_node = root_node)
    if current_node.nil?
      []
    else
      sort(current_node.left) + [current_node.data] + sort(current_node.right)
    end
  end

  def min
    to_array.min
  end

  def max
    to_array.max
  end
  def post_ordered(current_node = root_node) 
    if current_node.nil?
      []
    else
      post_ordered(current_node.left)+post_ordered(current_node.right)+[current_node.data]
    end
  end
end

class Node
  attr_accessor :data,
                :left,
                :right,
                :root

  def initialize(data, left=nil, right=nil, root=false)
    @data  = data
    @left  = left
    @right = right
    @root  = root
  end
end
