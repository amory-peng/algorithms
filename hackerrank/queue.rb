class Queue
  attr_accessor :in, :out
  def initialize
    @in = []
    @out = []
  end

  def dequeue
    if @out.empty?
      @out << @in.pop until @in.empty?
    end
    @out.pop
  end

  def enqueue(el)
    @in << el
  end

  def first
    @out.last || @in.first
  end
end
