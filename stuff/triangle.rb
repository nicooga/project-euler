class Tree
  attr_reader :nodes, :size

  def initialize(ary_or_str)
    tmp = if ary_or_str.class == String
      ary_or_str.split(/\n/).map do |row|
        row.split.map(&:to_i)
      end
    else
      ary_or_str
    end
    @size = tmp.size
    @nodes = tmp.map.with_index do |row, y|
      row.map.with_index do |node, x|
        Node.new(
          value: node,
          x: x,
          y: y,
          tree: self,
        )
      end
    end.flatten
  end

  def max_path
    nodes.first.max_path
  end
end

class Tree::Node
  attr_accessor :value, :x, :y, :tree

  def initialize(hash)
    hash.each { |k, v| send("#{k}=", v) }
  end

  def beneath
    @beneath ||= tree.nodes.select { |n| (x..x+1) === n.x && n.y == y+1 }
  end

  def above
    @above ||= tree.nodes.select { |n| (x-1..x) === n.x && n.y == y-1 }
  end

  def max_path
    return @max_path ||= value if (y+1) == tree.size
    @max_path ||= beneath.map(&:max_path).max + self.value
  end
end
