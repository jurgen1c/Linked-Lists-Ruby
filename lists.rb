class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def tail?
    next_node.nil?
  end
end

# Single Linked List --------------------------

class LinkedList
  attr_accessor :head, :total, :nodes, :new_node, :current

  def initialize
    @head = nil
  end

  def add(data)
    @new_node = Node.new(data)

    if @head.nil?
      @head = @new_node
    else
      @current = @head
      @current = @current.next_node until @current.next_node.nil?
      @current.next_node = @new_node
    end
  end

  def last_node(node)
    return node if node.tail?

    last_node(node.next_node)
  end

  def size
    current = @head
    @total = 0

    until current.next_node.nil?
      @total += 1
      current = current.next_node
    end
    @total
  end

  def show
    return 'List Empty!' if @head.nil?

    @nodes = []
    @current = @head

    until @current.next_node.nil?
      @nodes.push(@current.value)
      @current = @current.next_node
    end
    puts @nodes
  end

  def find(index)
    return 'Error: Index out of range' if index > size

    cindex = 0
    @current = @head
    while cindex != index
      @current = @current.next_node
      cindex += 1
    end
    @current.value
  end

  def remove(index)
    return 'ERROR: Index out of range' if index > size

    cindex = 0
    @current = @head
    until @current.next_node.nil?
      last_node = @current
      @current = @current.next_node
      if cindex == index
        last_node.next_node = @current.next_node
        return
      end
      cindex += 1
    end
  end
end

# Testing ---------------------

my_list = LinkedList.new
my_list.show

my_list.add(3)
my_list.add(5)
my_list.add(6)
my_list.add(8)
# my_list.show

p my_list.find(2)

puts my_list.head.value

my_list.remove(2)
puts my_list.find(2)
