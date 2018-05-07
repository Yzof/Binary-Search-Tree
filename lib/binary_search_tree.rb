# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

=begin
BST Notes:
  - Every node to the left of the root node is greater than the root node
  - Every node to the right of the root node is less than the root node
  - For equality it doesn't really matter what side it ends up on only that
  you are consistent about the placement
  - Binary Search Trees should have O(log n) time for find, insert and delete
  - BST's heavily rely on recursion to work
  - BST's insert, find and delete bigO are related to the depth of the tree
=end

class BinarySearchTree
  def initialize
  end

  def insert(value)
=begin
Insert Notes:
  Steps:
    - Check if the root node is less then or greater than the target
    - Check to see if the corresponding direction is already taken or not
    - If it isn't, insert the target in as a new node
    - If the spot is taken, repeat the process fo checking equality
=end
  end

  def find(value, tree_node = @root)
=begin
Find Notes:
  Steps:
    - Check if the root node is the target
    - Check to see that the root node has children
    - See if the target is on the left or the right
    - If the target is supposed to be on a side, but the current node
    has no child in that direction, then the target is not in the tree
    - Repeat on correct side
=end
  end

  def delete(value)
=begin
Notes:
  Steps:
    -
=end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

end
