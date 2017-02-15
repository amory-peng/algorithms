require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

#Khans
def topological_sort(vertices)
  edge_count = {}
  sorted = []
  queue = []
  vertices.each do |vertex|
    edge_count[vertex] = vertex.in_edges.count
    queue << vertex if vertex.in_edges.empty?
  end
  until queue.empty?
    current = queue.shift
    sorted << current
    current.out_edges.each do |edge|
      destination = edge.to_vertex
      edge_count[destination] -= 1
      queue << destination if edge_count[destination] == 0
    end

  end
  sorted
end

#Tarjans
def topological_sort(vertices)
  sorted = []
  seen = Set.new
  vertices.each do |vertex|
    tarjans(vertex, seen, sorted) unless seen.include?(vertex)
  end
  sorted
end

def tarjans(vertex, seen, sorted)
  seen.add(vertex)
  vertex.out_edges.each do |edge|
    destination = edge.to_vertex
    tarjans(destination, seen, sorted) unless seen.include?(destination)
  end
  sorted.unshift(vertex)
end
