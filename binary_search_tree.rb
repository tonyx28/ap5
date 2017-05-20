require './bst_node'
require 'byebug'

class BinarySearchTree
  attr_reader :root
  def initialize
    @root = nil
  end

  def find(val)
    current_node = root
    # debugger
    while current_node != nil
      if current_node.value == val
        return true
      elsif val < current_node.value
        current_node = current_node.left
      else
        current_node = current_node.right
      end
    end
    false
  end

  def insert(el)
    if @root == nil
      @root = el
    else
      puts @root.value
      self.class.insert!(@root, el)
    end
  end

  def self.insert!(node, el)
    current_node = node
    if el.value <= current_node.value
      if current_node.left == nil
        current_node.left = el
      else
        current_node = current_node.left
        self.insert!(current_node, el)
      end
    else
      if current_node.right == nil
        current_node.right = el
      else
        current_node = current_node.right
        self.insert!(current_node, el)
      end
    end
  end

  def delete(val)
    current_node = root

    while current_node != nil
      if current_node.value == val
        if current_node.left.nil? && current_node.right.nil?
          prev_node.left == current_node ? prev_node.left = nil : prev_node.right = nil
        elsif current_node.left != nil && current_node.right != nil
          replacement = maxinum(current_node.left)
          prev_node.left = replacement
          replacement.left = current_node.left
          current_node.left = nil
          replacement.right = current_node.right
          current_node.right = nil
        else
            # has left child
          if current_node.left != nil
            prev_node.left == current_node ? prev_node.left = current_node.left : prev_node.right = current_node.left
          else
            # has right child
            prev_node.right == current_node ? prev_node.left = current_node.right : prev_node.right = current_node.right
          end
        end
      elsif val < current_node.value
        prev_node = current_node
        current_node = current_node.left
      else
        prev_node = current_node
        current_node = current_node.right
      end
    end

  end

  def is_balanced?
  end

  def in_order_traversal
  end

  def minimum(node)
    return nil if node == nil
    current_node = node
    until current_node.left == nil
      current_node = current_node.left
    end
    current_node
  end

  def maximum(node)
    return nil if node == nil
    current_node = node
    until current_node.right == nil
      current_node = current_node.right
    end
    current_node
  end

  def depth
  end
end

# load 'binary_search_tree.rb'
a = BinarySearchTree.new
one = BSTNode.new(1)
two = BSTNode.new(2)
three = BSTNode.new(3)
four = BSTNode.new(4)
five = BSTNode.new(5)
six = BSTNode.new(6)
seven = BSTNode.new(7)
eight = BSTNode.new(8)
nine = BSTNode.new(9)
a.insert(five)
a.insert(three)
a.insert(four)
a.insert(one)
a.insert(two)
a.insert(eight)
a.insert(six)
a.insert(nine)
a.insert(seven)
