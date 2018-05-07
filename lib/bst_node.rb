class BSTNode
  attr_accessor :left, :right, :value, :parent, :grand_parent, :uncle, :direction
  def initialize(value, color = :black)
    @value = value
    @left = nil
    @right = nil
    @parent = nil
    @grand_parent = @parent.nil? ? nil : @parent.parent
    @uncle = @grand_parent.nil? ? nil : get_uncle
    @direction = nil
    @color = color
  end

  def get_uncle
    @grand_parent.left if @value >= parent.value
    @grand_parent.right if @value < parent.value
  end

end
