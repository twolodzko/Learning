package dijkstra_test

import (
	"testing"

	"github.com/google/go-cmp/cmp"
	d "github.com/twolodzko/Learning/Go/dijkstra"
)

func Test_empty(t *testing.T) {
	var graph d.Graph = []*d.Vertex{}
	result, err := graph.Dijkstra(nil)
	if result != nil {
		t.Error("Result is not nil")
	}
	if err != nil && err.Error() != "Empty graph" {
		t.Error("Didn't error")
	}
}

func Test_single_node(t *testing.T) {
	A := d.NewVertex("A")
	var graph d.Graph = []*d.Vertex{&A}
	result, err := graph.Dijkstra(&A)
	if result != &A {
		t.Errorf("Expected %v, got %v", A, result)
	}
	if err != nil {
		t.Errorf("Thrown error: %v", err)
	}
}

func Test_two_nodes(t *testing.T) {
	var A, B d.Vertex
	A = d.NewVertex("A", &d.Edge{1, &B})
	B = d.NewVertex("B", &d.Edge{1, &A})
	var graph d.Graph = []*d.Vertex{&A, &B}
	result, err := graph.Dijkstra(&B)
	expected := []d.Vertex{A, B}
	if result == nil || !cmp.Equal(result.Path(), expected) {
		t.Errorf("Expected %v, got %v", expected, result)
	}
	if err != nil {
		t.Errorf("Thrown error: %v", err)
	}
}

func Test_three_nodes(t *testing.T) {
	var A, B, C d.Vertex
	A = d.NewVertex("A", &d.Edge{1, &C})
	C = d.NewVertex("C", &d.Edge{1, &B})
	B = d.NewVertex("B")
	var graph d.Graph = []*d.Vertex{&A, &C, &B}
	result, err := graph.Dijkstra(&B)
	expected := []d.Vertex{A, C, B}
	if result == nil || !cmp.Equal(result.Path(), expected) {
		t.Errorf("Expected %v, got %v", expected, result)
	}
	if err != nil {
		t.Errorf("Thrown error: %v", err)
	}
}

func Test_three_nodes_shorter(t *testing.T) {
	var A, B, C d.Vertex
	A = d.NewVertex("A", &d.Edge{2, &C}, &d.Edge{3, &B})
	C = d.NewVertex("C", &d.Edge{1, &A}, &d.Edge{2, &B})
	B = d.NewVertex("B")
	var graph d.Graph = []*d.Vertex{&A, &C, &B}
	result, err := graph.Dijkstra(&B)
	expected := []d.Vertex{A, B}
	if result == nil || !cmp.Equal(result.Path(), expected) {
		t.Errorf("Expected %v, got %v", expected, result)
	}
	if err != nil {
		t.Errorf("Thrown error: %v", err)
	}
}

func Test_spanning_tree_example(t *testing.T) {
	// https://www.youtube.com/watch?v=EFg3u_E6eHU
	//      C --4-- D
	//   3/ | \1     \1
	//  A  2|  E --2- B
	//   2\ | /3     /2
	//      F --5-- G
	var A, B, C, D, E, F, G d.Vertex
	A = d.NewVertex("A", &d.Edge{3, &C}, &d.Edge{2, &F})
	B = d.NewVertex("B")
	C = d.NewVertex("C", &d.Edge{3, &A}, &d.Edge{2, &F}, &d.Edge{1, &E}, &d.Edge{4, &D})
	D = d.NewVertex("D", &d.Edge{4, &C}, &d.Edge{1, &B})
	E = d.NewVertex("E", &d.Edge{1, &C}, &d.Edge{3, &F}, &d.Edge{2, &B})
	F = d.NewVertex("F", &d.Edge{2, &A}, &d.Edge{2, &C}, &d.Edge{3, &E}, &d.Edge{5, &G}, &d.Edge{6, &B})
	G = d.NewVertex("G", &d.Edge{5, &F}, &d.Edge{2, &B})
	var graph d.Graph = []*d.Vertex{&A, &B, &C, &D, &E, &F, &G}
	result, err := graph.Dijkstra(&B)
	expected := []d.Vertex{A, C, E, B}
	if result == nil || !cmp.Equal(result.Path(), expected) {
		t.Errorf("Expected %v, got %v", expected, result)
	}
	if err != nil {
		t.Errorf("Thrown error: %v", err)
	}
}
