package dijkstra

import (
	"errors"
	"math"
	"slices"
)

type Vertex struct {
	Name     string
	Distance int
	Previous *Vertex
	Edges    []*Edge
	Explored bool
}

type Edge struct {
	Weight int
	Dest   *Vertex
}

func NewVertex(name string, edges ...*Edge) Vertex {
	return Vertex{name, math.MaxInt, nil, edges, false}
}

// Update neighbor vertices
func (v *Vertex) update() {
	for _, edge := range v.Edges {
		dist := v.Distance + edge.Weight
		if dist < edge.Dest.Distance {
			edge.Dest.Distance = dist
			edge.Dest.Previous = v
		}
	}
	v.Explored = true
}

func (v Vertex) Path() []Vertex {
	this := v
	path := []Vertex{v}
	for {
		if this.Previous != nil {
			this = *this.Previous
			path = append(path, this)
		} else {
			slices.Reverse(path)
			return path
		}

	}
}

type Graph []*Vertex

// Run the Dijkstra's algorithm over the graph
func (g *Graph) Dijkstra(end *Vertex) (*Vertex, error) {
	if len(*g) == 0 {
		return nil, errors.New("Empty graph")
	}

	vertex := (*g)[0]
	vertex.Distance = 0

	for {
		if vertex == end {
			return vertex, nil
		}

		vertex.update()

		vertex = g.next()

		if vertex == nil {
			return nil, errors.New("No path found")
		}
	}
}

// Pick next vertex to explore
func (g Graph) next() *Vertex {
	min_dist := math.MaxInt
	var picked *Vertex = nil
	for _, vertex := range g {
		if vertex.Explored {
			continue
		}
		if vertex.Distance < min_dist {
			min_dist = vertex.Distance
			picked = vertex
		}
	}
	return picked
}
