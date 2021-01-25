open OUnit
open Main


let test_rep _ =
    assert ((rep "z" 3) = ["z";"z";"z"]);
    assert ((rep 1 1) = [1]);
    assert ((rep [1;2] 2) = [[1;2]; [1;2]]);
    assert ((rep 0 0) = [])

let test_split _ =
    assert ((split 3 [1;2;3;4;5;6;7;8;9]) = [[1;2;3];[4;5;6];[7;8;9]])

let test_str_of_board _ =
    assert ((str_of_board empty_board) =
        "   |   |   \n---+---+---\n   |   |   \n---+---+---\n   |   |   \n");
    assert ((str_of_board [X;Blank;O;Blank;X;Blank;O;O;X]) =
        " X |   | O \n---+---+---\n   | X |   \n---+---+---\n O | O | X \n")

let test_any _ =
    assert ((any [Blank;Blank;Blank]) = Blank);
    assert ((any [Blank;X;Blank]) = X);
    assert ((any [Blank;Blank;X]) = X);
    assert ((any [O;Blank;X]) = O)

let test_all _ =
    assert ((all [X;X;X]) = X);
    assert ((all [X;O;X]) = Blank);
    assert ((all [X;X;O]) = Blank)

let test_skip _ =
    assert ((skip 2 []) = []);
    assert ((skip 0 [1;2;3;4;5]) = [1;2;3;4;5]);
    assert ((skip 2 [1;2;3;4;5]) = [3;4;5])

let test_check _ =
    assert ((check 0 [X;X;X]) = [X]);
    assert ((check 2 [X;X;X]) = []);
    assert ((check 0 [X;X;X;O;O;O;Blank;Blank;Blank]) = [X;O;Blank]);
    assert ((check 0 [Blank;X;X;X;Blank]) = [Blank]);
    assert ((check 2 [X;O;Blank;X;Blank;Blank;X;O;O]) = [X]);
    assert ((check 3 [X;Blank;Blank;Blank;X;Blank;Blank;Blank;X]) = [X])

let test_check_rows _ =
    assert ((check_rows [Blank;Blank;Blank;Blank;Blank;Blank;Blank;Blank;Blank]) = Blank);
    assert ((check_rows [X;X;X;Blank;Blank;Blank;Blank;Blank;Blank]) = X);
    assert ((check_rows [Blank;Blank;Blank;O;O;O;Blank;Blank;Blank]) = O);
    assert ((check_rows [Blank;Blank;Blank;Blank;Blank;Blank;X;X;X]) = X);
    assert ((check_rows [Blank;Blank;X;X;X;Blank;Blank;Blank;Blank]) = Blank);
    assert ((check_rows [X;X;X;O;O;O;Blank;Blank;Blank]) = X)

let test_check_cols _ =
    assert ((check_cols [Blank;Blank;Blank;Blank;Blank;Blank;Blank;Blank;Blank]) = Blank);
    assert ((check_cols [X;Blank;Blank;X;Blank;Blank;X;Blank;Blank]) = X);
    assert ((check_cols [Blank;O;Blank;Blank;O;Blank;Blank;O;Blank]) = O);
    assert ((check_cols [Blank;Blank;X;Blank;Blank;X;Blank;Blank;X]) = X);
    assert ((check_cols [X;Blank;Blank;X;Blank;Blank;O;Blank;Blank]) = Blank);
    assert ((check_cols [X;O;Blank;X;O;Blank;X;O;Blank]) = X);
    assert ((check_cols [X;X;X;Blank;Blank;Blank;Blank;Blank;Blank]) = Blank)

let test_check_diag _ =
    assert ((check_diag [Blank;Blank;Blank;Blank;Blank;Blank;Blank;Blank;Blank]) = Blank);
    assert ((check_diag [X;Blank;Blank;Blank;X;Blank;Blank;Blank;X]) = X);
    assert ((check_diag [X;Blank;Blank;Blank;X;Blank;Blank;Blank;O]) = Blank)

let test_check_revdiag _ =
    assert ((check_revdiag [Blank;Blank;Blank;Blank;Blank;Blank;Blank;Blank;Blank]) = Blank);
    assert ((check_revdiag [X;Blank;Blank;X;Blank;Blank;X;Blank;Blank]) = Blank);
    assert ((check_revdiag [X;X;X;Blank;Blank;Blank;Blank;Blank;Blank]) = Blank);
    assert ((check_revdiag [Blank;Blank;X;Blank;X;Blank;X;Blank;Blank]) = X)

let test_who_won _ =
    assert ((who_won [Blank;Blank;Blank;Blank;Blank;Blank;Blank;Blank;Blank]) = Blank);
    assert ((who_won [X;X;X;Blank;Blank;Blank;Blank;Blank;Blank]) = X);
    assert ((who_won [Blank;O;Blank;Blank;O;Blank;Blank;O;Blank]) = O);
    assert ((who_won [X;X;X;O;O;O;Blank;Blank;Blank]) = X);
    assert ((who_won [X;X;O;O;X;Blank;Blank;Blank;X]) = X);
    assert ((who_won [O;X;X;X;O;O;O;O;X]) = Blank)

let test_get _ =
    let l = [1;2;3;4;5;6;7;8;9] in
    assert ((get 0 l) = 1);
    assert ((get 2 l) = 3);
    assert ((get 8 l) = 9)

let test_set _ =
    assert ((set 0 X empty_board) = [X;Blank;Blank;Blank;Blank;Blank;Blank;Blank;Blank]);
    assert ((set 8 O empty_board) = [Blank;Blank;Blank;Blank;Blank;Blank;Blank;Blank;O]);
    try
        set 0 X [O;Blank;Blank;Blank;Blank;Blank;Blank;Blank;Blank];
        failwith "Unit test failed: didn't raise exception";
    with Occupied_position -> ()

let test_is_board_full _ =
    assert (not (is_board_full empty_board));
    assert (is_board_full [X;X;O;O;X;X;O;O;X]);
    assert (not (is_board_full [X;X;O;O;X;Blank;O;O;X]))

let test_game_finished _ =
    assert (game_finished [O;X;X;X;O;O;O;O;X]);
    assert (game_finished [X;X;X;O;O;Blank;O;Blank;Blank])

let test_boring_game _ =
    let boring_game =
        let rec move board player i =
            let current_board = set i player board in
            if game_finished current_board then current_board
            else move current_board (next player) (i+1)
        in
        move empty_board O 0
    in
    assert (boring_game = [O;X;O;X;O;X;O;Blank;Blank])

let tests = "Tests" >::: [
    "test_rep" >:: test_rep;
    "test_split" >:: test_split;
    "test_str_of_board" >:: test_str_of_board;
    "test_any" >:: test_any;
    "test_all" >:: test_all;
    "test_skip" >:: test_skip;
    "test_check" >:: test_check;
    "test_check_rows" >:: test_check_rows;
    "test_check_cols" >:: test_check_cols;
    "test_check_diag" >:: test_check_diag;
    "test_check_revdiag" >:: test_check_revdiag;
    "test_who_won" >:: test_who_won;
    "test_get" >:: test_get;
    "test_set" >:: test_set;
    "test_is_board_full" >:: test_is_board_full;
    "test_boring_game" >:: test_boring_game;
    "test_game_finished" >:: test_game_finished;
]

let _ = run_test_tt_main tests
