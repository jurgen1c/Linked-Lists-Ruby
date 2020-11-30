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
    @head = Node.new(nil)
  end

  def add(data)
    @new_node = Node.new(data)

    if @head.value.nil?
      @head = @new_node 
    elsif
      @current = @head
      until @current.next_node.nil?
        @current = @current.next_node
      end
      @current.next_node = @new_node
    end 


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
    return "List Empty!" if @head.nil?
    @nodes = []
    @current = @head

    until @current.next_node.nil?
      @current = @current.next_node
      @nodes.push(@current.value)
    end
    puts @nodes
  end

  def find(index)
    return "Error: Index out of range" if index > self.size
    cindex = 0
    @current = @head
    while cindex != index 
      @current = @current.next_node
      cindex += 1
    end
    return @current.value 
  end
end

# Testing ---------------------

my_list = LinkedList.new
my_list.show

my_list.add(3)
my_list.add(5)
my_list.show

puts my_list.find(1)
