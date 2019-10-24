class BinarySearchTree
  attr_accessor :root

  def initialize(array)
    @root = nil
    build(array)
  end

  def to_s(current = @root, indent = "   ")
    if current == @root
      puts "ROOT: #{@root.value}"
    end
    indent += "  "
    if current.left_child != nil
      puts "#{indent}L: #{current.left_child.value}"
      to_s(current.left_child, indent)
    end
    if current.right_child != nil
      puts "#{indent}R: #{current.right_child.value}"
      to_s(current.right_child, indent)
    end
  end

  def breadth_first_search(value)
    current = @root
    queue = []
    loop do
      return current if current.value == value
      queue << current.left_child unless current.left_child.nil?
      queue << current.right_child unless current.right_child.nil?
      return nil if queue.empty?
      current = queue.shift
    end
  end

  def depth_first_search(value)
    current = @root
    stack = []
    loop do
      return current if current.value == value
      stack << current.right_child unless current.right_child.nil?
      stack << current.left_child unless current.left_child.nil?
      return nil if stack.empty?
      current = stack.pop
    end
  end

  def dfs_req(value, current = @root)
    if current.value == value
      return current
    else
      node = nil
      node = dfs_req(value, current.left_child) unless current.left_child.nil?
      if node.nil?
        node = dfs_req(value, current.right_child) unless current.right_child.nil?
      end
      node
    end    
  end

  private

  def build(array)
    @root = Node.new(array.shift)
    until array.empty?
      current = Node.new(array.shift)
      add_node(current, root)
    end
  end

  def add_node(current, parent)
    current.parent = parent
    if current.value < parent.value
      if parent.left_child == nil
        parent.left_child = current
      else
        add_node(current, parent.left_child)
      end
    else
      if parent.right_child == nil
        parent.right_child = current
      else
        add_node(current, parent.right_child)
      end
    end
  end
  
end

class Node
  attr_accessor :parent, :left_child, :right_child, :value

  def initialize(value = nil)
    @parent = nil
    @left_child = nil
    @right_child = nil
    @value = value
  end

end


tree = BinarySearchTree.new([5,7,1,15,9,2,14,8,7,3])