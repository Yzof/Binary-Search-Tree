# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require 'bst_node'
=begin
BST Notes:
  - Every node to the left of the root node is greater than the root node
  - Every node to the right of the root node is less than the root node
  - For equality it doesn't really matter what side it ends up on only that
  you are consistent about the placement
  - Binary Search Trees should have O(log n) time for find, insert and delete
  - BST's heavily rely on recursion to work
  - BST's insert, find and delete bigO are related to the depth of the tree
  - A BST has the following criteria that need to be satisified in order to
  be considered balanced:
    - The difference in depth between the left and right sides are at most 1
    - Both the left and right sides are also balanced(recursive definition)
  - As a byproduct of the Hibbard Deletion, our tree will become semi-unbalanced
  so we need to create a self-balancing tree
=end

class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(value, tree_node = @root)
    # Insert Notes:
    #   Steps:
    #     - Check if the root node is less then or greater than the target
    #     - Check to see if the corresponding direction is already taken or not
    #     - If it isn't, insert the target in as a new node
    #     - If the spot is taken, repeat the process for checking equality
    if tree_node.nil?
      @root = BSTNode.new(value)
    elsif tree_node.value >= value

      if tree_node.left.nil?
        new_node = BSTNode.new(value)
        tree_node.left = new_node
        new_node.parent = tree_node
      else
        insert(value, tree_node.left)
      end

    elsif tree_node.value < value

      if tree_node.right.nil?
        new_node = BSTNode.new(value)
        tree_node.right = new_node
        new_node.parent = tree_node
      else
        insert(value, tree_node.right)
      end

    end
  end

  def find(value, tree_node = @root)
    # Find Notes:
    #   Steps:
    #     - Check if the root node is the target
    #     - Check to see that the root node has children
    #     - See if the target is on the left or the right
    #     - If the target is supposed to be on a side, but the current node
    #     has no child in that direction, then the target is not in the tree
    #     - Repeat on correct side

    if tree_node.value == value
      tree_node
    elsif tree_node.left.nil? && tree_node.right.nil?
      nil
    elsif tree_node.value >= value
      find(value, tree_node.left)
    elsif tree_node.value < value
      find(value, tree_node.right)
    end
  end

  def delete(value)
  # Notes:
  #   -The following deletion algorithm is known as Hibbard Deletion
  #   - When deleting something, you must preserve the Binary Search Tree rules
  #   meaning that if the target for deletion is on the right you must replace it
  #   with something larger than the parent, or if it is on the left, you must replace
  #   the target with something smaller than the parent
  #   - The replacement must also be greater than the left sub-tree in order to
  #   preserve the BST rules
  #   - In the same fashion, the replacement must also be less than the right sub-tree
  #   - To satisfy all these rules, you must select the largest node in the left
  #   sub-tree of the target for deletion.
  #   - To do that, you must go from the root of the sub-tree and then travel as
  #   far right as you can, the last node there is the replacement for the deleted
  #   node
  #   - If the replacement target has a left child(By definition the replacement
  #   will never have a right child otherwise that child would be the replacment)
  #   then we simply replace the parent of the replacement targets reference
  #   from the target to the child, as the new right child.
  #   Steps:
  #     - (Any mention of deletion in these steps means removing the reference
  #       to the target from the targets parent)
  #     - Repeat steps of the find method
  #     - Check if the target has children
  #     - If no children, simply delete the node
  #     - If only one child, promote the child
  #     - If two children, search down the left sub-tree for the maximum value
  #       - From the root of the left sub-tree continue down the right side
  #         until you get to a node that has no right child.
  #       - This right-childless node is the replacement target
  #       - If this node has a left child, promote it
    target = find(value)
    right = nil || target.right
    left = nil || target.left
    parent = target.parent

    if @root == target
      @root = nil

    elsif (right.nil? && left.nil?) && @root != target
      if parent.left == target
        parent.left = nil
      else
        parent.right = nil
      end
      target.parent = nil

    elsif right && left
      replacement = maximum(left)
      delete(replacement.value)
      if parent.left == target
        parent.left = replacement
      else
        parent.right = replacement
      end
      replacement.right = right
      replacement.left = left
      replacement.parent = parent

    elsif left.nil? && @root != target
      if parent.left == target
        parent.left = right
      else
        parent.right = right
      end
      target.parent = nil

    elsif right.nil? && @root != target
      if parent.left == target
        parent.left = left
      else
        parent.right = left
      end
      target.parent = nil
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    if tree_node.right.nil?
      tree_node
    else
      maximum(tree_node.right)
    end
  end

  def depth(tree_node = @root)
    # Steps:
    # If the current tree_node has no children
    #return 0
    # Find the depth of the right side(if not possible set to 0)
    # Find the depth of the left side(if not possible set to 0)
    # return whichever is larger plus 1
    return 0 if tree_node.left.nil? && tree_node.right.nil?

    right_depth = tree_node.right.nil? ? 0 : depth(tree_node.right)
    left_depth = tree_node.left.nil? ? 0 : depth(tree_node.left)

    target_depth = left_depth >= right_depth ? left_depth : right_depth

    target_depth + 1
  end

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?

    right_depth = tree_node.right.nil? ? 0 : depth(tree_node.right)
    left_depth = tree_node.left.nil? ? 0 : depth(tree_node.left)

    if (right_depth - left_depth).abs <= 1
      if is_balanced?(tree_node.right) && is_balanced?(tree_node.left)
        true
      else
        false
      end
    else
      false
    end
  end

  def in_order_traversal(tree_node = @root, arr = [])
    # Steps:
    #   - If node has no children, add node to array
    #   - If node has children find the in_order array of the children
    #   - Combine the left side(if it exists) the current node, and the
    #     right child array.
    if tree_node.right.nil? && tree_node.left.nil?
      arr.push(tree_node.value)
      return arr
    end

    right = tree_node.right.nil? ? [] : in_order_traversal(tree_node.right)
    left = tree_node.left.nil? ? [] : in_order_traversal(tree_node.left)

    left.concat([tree_node.value].concat(right))
  end

  def self.I_O_T(tree_node = @root, arr = [])
    if tree_node.right.nil? && tree_node.left.nil?
      arr.push(tree_node.value)
      return arr
    end

    right = tree_node.right.nil? ? [] : self.I_O_T(tree_node.right)
    left = tree_node.left.nil? ? [] : self.I_O_T(tree_node.left)

    left.concat([tree_node.value].concat(right))
  end

  def self.find(value, tree_node = @root)
    if tree_node.value == value
      tree_node
    elsif tree_node.left.nil? && tree_node.right.nil?
      nil
    elsif tree_node.value >= value
      find(value, tree_node.left)
    elsif tree_node.value < value
      find(value, tree_node.right)
    end
  end


  private
  # optional helper methods go here:

end
