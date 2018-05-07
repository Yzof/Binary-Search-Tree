require 'binary_search_tree'
require 'bst_node'

class RedBlackTree
  # Axioms
  # A1. A node must have a color red || black
  # A2. The root node is always black
  # A3. The parent of a red node must be black
  # A4. The children of a red node must be black
  # A5. Any path from the root to a nil leaf has the same number of black
  #     nodes as any other path
  # A6. Regardless of color all childless nodes have nil leaves
  # A7. nil leaves are black
  # -------------------------------------------
  # Notes:
  # - The longest path(root to farthest NIL) is no more than twice the
  #   length of the shortest path(root to nearest NIL)
  #     -Shortest Path: All Black Nodes
  #     -Longest Path: Alternating Red/Black Nodes
  # - Insertion and Deletion require the use of the rotation method

  def initialize
    @root = BSTNode.new(nil, 'black')
  end

  def find(value, tree_node = @root)
    # Same as BST
  end

  def insert
    # Notes:
    # - After every insertion the above Axioms must be held
    # Steps:
    #   - Insert new node and color it red
    #   - Recolor and Rotate nodes to fix any violations
    #     -After step 2 there are 4 main situations you will find yourself in
    #     - 1. new_node is the root
    #     - 2. new_node.uncle == red
    #     - 3. new_node.uncle == black && shape == triangle
    #     - 4. new_node.uncle == black && shape == line
    #   - If case 1:
    #     - Color new_node black
    #   - If case 2:
    #     - Recolor new_nodes' parent, grand_parent, and uncle
    #   - If case 3: Triangle
    #      (This shape is formed when new_node and parent are in opposite directions)
    #     - Rotate the parent and the new_node in the opposite direction of
    #       new_node(eg parent.left == new_node then right_rotation)
    #   - If case 4: Line
    #     (This shape is formed when new_node and parent are in the same direction)
    #     - Rotate new_node's grandparent in the opposite direction of
    #       new_node
    #     - Recolor new_nodes grandparent and parent
  end

  def delete

  end

    # Notes:
    # - A rotation alters the structure of a tree by rearranging subtrees
    # - Goal to reduce the height of the tree
    #   - Red-Black trees have a maximum height of O(log n)
    #   - Large subtrees up, smaller subtrees down
    # - The rotation should not effect the order of elements
    # - Two types of rotations left rotation and right rotation
    # - Left Rotation:
    #   Steps:
    #    - Left rotation triggered on a node(now known as rotation_target)
    #    - Remove rotation_target connection to right child(now known as new_parent)
    #    - Remove new_parent's connection to it's left child(now known as new_child)
    #    - new_parent's left child becomes rotation_target
    #    - rotation_target's right child becomes new_child
    # - Right Rotation:
    #   Steps:
    #     - Right Rotation triggered on a node(now known as rotation_target)
    #     - Remove rotation_target connection to it's left child(now known as new_parent)
    #     - Remove new_parent's connection to it's right child(now known as new_child)
    #     - new_parent's right child becomes rotation_target
    #     - rotation_target's left child becomes new_child

  def left_rotation

  end

  def right_rotation

  end

  def black_height(tree_node = @root)
    # The number of black nodes from the root to the nil-leaves, not counting the root

    # All paths from a node to it's NIL descendants contains the same number
    #of black nodes
  end
end
