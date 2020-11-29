class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :current, :head, :new_node, :total, :nodes

  def initialize
    @head = Node.new(nil)
  end

  def add(data)
    @new_node = Node.new(data)
    @current = @head
    @head.value = @new_node.value if @head.value.nil?
    @current = @current.next_node until @current.next_node.nil?
    @current.next_node = @new_node
  end

  def size
    @current = @head
    @total = 0

    until @current.next_node.nil?
      @total += 1
      @current = @current.next_node
    end
    @total
  end

  def show
    @nodes = []
    @current = @head

    until @current.next_node.nil?
      @current = @current.next_node
      @nodes.push(@current.value)
    end
    puts @nodes
  end
end

my_list = LinkedList.new

my_list.show

my_list.add(5)
my_list.add(3)
my_list.show
puts my_list.head.value
