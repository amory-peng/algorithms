require_relative 'graph'

# O(|V|**2 + |E|).
def dijkstra1(source)
  paths = {}
  possible = {}
  possible[source] = {cost: 0, last_edge: nil}
  until possible.empty?
    vertex, data = possible.min_by do |(vertex, data)|
      data[:cost]
    end
    paths[vertex] = possible[vertex]
    possible.delete(vertex)

    path_cost = paths[vertex][:cost]
    vertex.out_edges.each do |edge|
      to_vertex = edge.to_vertex
      next if paths.has_key?(to_vertex)
      cumulative_cost = path_cost + edge.cost
      next if possible.has_key?(to_vertex) && possible[to_vertex][:cost] <= cumulative_cost
      possible[to_vertex] = {cost: cumulative_cost, last_edge: edge}
    end
  end
  paths
end
