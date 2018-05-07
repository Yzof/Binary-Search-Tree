require 'binary_search_tree'

def kth_largest(tree_node, k)
  arr = BinarySearchTree.I_O_T(tree_node)
  arr.sort
  target = arr[arr.length - k]
  BinarySearchTree.find(target, tree_node)
end
