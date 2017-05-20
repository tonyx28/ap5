class BSTNode
  attr_accessor :left, :right, :value, :parent

  def initialize(val = nil)
    @value = val
    @parent = nil
    @left_child = nil
    @right_child = nil
  end
end
