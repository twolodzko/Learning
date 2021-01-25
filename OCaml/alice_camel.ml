
(* "Alice The Camel" song implemented in OCaml *)

type tokens =
    | Alice | The | Camel | Has | Humps | Hump | So | Go | Now | Is | A | Horse
    | Num of int

let next_token i = function
    | Alice -> The
    | The -> Camel
    | Camel -> Has
    | Has -> Num i
    | Num 1 -> Hump
    | Num _ -> Humps
    | _ -> assert false

let rec last_line l = match l with
    | Go :: _ -> last_line (Alice :: l)
    | Alice :: _ -> Go :: l
    | _ -> last_line (Go :: l)

let rec final_line l = match l with
    | Now :: _ -> final_line (Alice :: l)
    | Alice :: _ -> final_line (Is :: l)
    | Is :: _ -> final_line (A :: l)
    | A :: _ -> final_line (Horse :: l)
    | _ -> l

let rec next i l = match l with
    | (Humps | Hump) :: _ ->
        if i = 0 then final_line [Now] @ l @ l @ l
        else last_line [So] @ l @ l @ l
    | h :: _ -> next i (next_token i h :: l)
    | _ -> assert false

let rec verse i acc =
    if i < 0 then List.rev acc
    else verse (i-1) ((next i [Alice]) @ acc)
