require_relative 'graph'
require_relative 'priority_map'

# O(|V| + |E|*log(|V|)).
def dijkstra2(source)
  paths = {}
  possible = PriorityMap.new do |el1, el2|
    el1[:cost] <=> el2[:cost]
  end
  possible[source] = { cost: 0, last_edge: nil }
  until possible.empty?
    vertex, data = possible.extract
    paths[vertex] = data
    cost = paths[vertex][:cost]
    vertex.out_edges.each do |edge|
      to_vertex = edge.to_vertex
      next if paths.has_key?(to_vertex)
      cumulative_cost = cost + edge.cost
      next if possible.has_key?(to_vertex) && possible[to_vertex][:cost] <= cumulative_cost
      possible[to_vertex] = { cost: cumulative_cost, last_edge: edge }
    end
  end
  paths
end
