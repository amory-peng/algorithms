# RETURN AN EMPTY LIST IF NO SIMILAR MOVIE TO THE GIVEN MOVIE IS FOUND


class MovieHeap
    attr_accessor :store
    def initialize(size)
        @store = []
        @size = size
    end

    def add_movie(movie)
        @store << movie
        heapify_up(@store.length - 1)
        if @store.length == @size
            @store[0], @store[-1] = @store[-1], @store[0]
            heapify_down(0)
        end
    end

    def heapify_down(idx)
        children = children(idx)
        smallest_child = -1
        if children.empty?
            return
        elsif children.length == 1
            smallest_child = children[0]
        else
            smallest_child = @store[children[0]].getRating() > @store[children[1]].getRating() ? children[1] : children[0]
        end
        if @store[idx].getRating() > smallest_child[idx].getRating()
            @store[idx], @store[smallest_child] = @store[smallest_child], @store[idx]
            heapify_down*(smallest_child)
        end
        return @store
    end

    def heapify_up(idx)
        parent_idx = parent(idx)
        return @store if parent_idx <= 0
        if @store[idx].getRating() < @store[parent_idx].getRating()
            @store[idx], @store[parent_idx] = @store[parent_idx], @store[idx]
            heapify_up(parent_idx)
        end
        @store

    end

    def parent(idx)
        (idx - 1) / 2
    end

    def children(idx)
        c1 = idx * 2 + 1 < @size ? idx * 2 + 1 : nil
        c2 = idx * 2 + 2 < @size ? idx * 2 + 2 : nil
        [c1, c2].compact
    end
end

def getMovieRecommendations(movie, n)
    # WRITE YOUR CODE HERE
    return [] if movie.getSimilarMovies().empty?
    p movie.getSimilarMovies()
    movie_heap = MovieHeap.new(n)
    seen = {}
    queue = movie.getSimilarMovies()
    until queue.empty?
        current_movie = queue.shift
        seen[current_movie] = TRUE
        if !seen[current_movie]
            movie_heap.add(current_movie)
        end
        queue += current_movie.getSimilarMovies()
    end
    movie_heap.store
end
