open Printf


let board_size = 3

type player = X | O | Blank

let string_of_player = function
    | X -> "X"
    | O -> "O"
    | Blank -> " "

let rec rep x n = if n = 0 then [] else x :: rep x (n-1)

let empty_board = rep Blank (board_size * board_size)

let split n lst =
    let rec aux i acc = function
        | [] -> [List.rev acc]
        | (h :: t as l) ->
            if i = 0 then (List.rev acc) :: aux n [] l
            else aux (i-1) (h :: acc) t
    in
    aux n [] lst

let str_of_board board =
    let print_row row =
        let cells = List.map string_of_player row |> String.concat " | "
        in " " ^ cells ^ " \n"
    in
    let row_sep = (rep "---" board_size |> String.concat "+") ^ "\n" in
    List.map print_row (split board_size board)
        |> String.concat row_sep

let rec any = function
    | [] -> Blank
    | h :: t -> if h <> Blank then h else any t

let rec all = function
    | [] -> Blank
    | [a] -> a
    | a :: b :: t ->
        if a <> b then Blank
        else all (b :: t)

let rec skip n = function
    | [] -> []
    | (h :: t as l) -> if n = 0 then l else skip (n-1) t

let check step lst =
    let rec aux i step acc lst =
        if (List.length acc) = board_size then (all acc) :: aux step step [] lst
        else match lst with
            | [] -> []
            | h :: t ->
                if i = 0 then aux step step (h :: acc) t
                else aux (i-1) step acc t
    in
    aux 0 step [] lst

let check_rows board = any (check 0 board)

let check_cols board = any (List.map (fun i -> (skip i board) |> check 2 |> any) [0;1;2])

let check_diag board = any (check board_size board)

let check_revdiag board = any (skip 2 board |> check 1)

let who_won board =
    any (List.map (fun f -> f board) [check_rows; check_cols; check_diag; check_revdiag])

let index_of_coord i j = i * board_size + j

let rec get i = function
    | [] -> raise Not_found
    | h :: t -> if i = 0 then h else get (i-1) t

exception Occupied_position
exception Invalid_move

let rec set i x = function
    | [] -> raise Invalid_move
    | h :: t ->
        if i = 0 then
            if h = Blank then x :: t
            else raise Occupied_position
        else h :: set (i-1) x t

let next = function
    | O -> X
    | X -> O
    | Blank -> raise Invalid_move

let rec is_board_full = function
    | [] -> true
    | h :: t ->
        if h = Blank then false
        else is_board_full t

let game_finished board = ((who_won board) <> Blank) || (is_board_full board)

let prompt player =
    printf "%s's turn: \n" (string_of_player player);
    printf "row: ";
    let i = read_int () in
    printf "col: ";
    let j = read_int () in
    i, j
