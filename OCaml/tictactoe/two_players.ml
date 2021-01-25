open Main
open Printf


let rec turn player board =
    let rec move player board =
        let i, j = prompt player in
        try
            let updated_board = set (index_of_coord i j) player board in
            turn (next player) updated_board;
        with
            | Occupied_position ->
                printf "This position is already occupied, try again\n";
                move player board
            | Invalid_move ->
                printf "Invalid move, try again\n";
                move player board
    in
    let winner = who_won board in
    printf "\n%s\n" (str_of_board board);
    if game_finished board then
        if winner <> Blank then printf "%s won!\n" (string_of_player winner)
        else printf "Nobody won :(\n"
    else
        move player board

let main () =
    turn O empty_board

let _ = main ()
