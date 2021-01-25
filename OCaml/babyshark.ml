
(* "Baby Shark" song implemented in OCaml *)

type tokens =
    | Baby | Mommy | Daddy | Grandma | Grandpa | Shark
    | Doo
    | Let's | Go | Hunt
    | Run | Away
    | Safe | At | Last
    | It's | The | End

let next_verse = function
    | Shark :: who :: t ->
        begin match who with
            | Baby -> [Mommy]
            | Mommy -> [Daddy]
            | Daddy -> [Grandma]
            | Grandma -> [Grandpa]
            | _ -> [Let's]
        end
    | Hunt :: t -> [Run]
    | Away :: t -> [Safe]
    | Last :: t -> [It's]
    | _ -> []

let next_token = function
    | Baby | Mommy | Daddy | Grandma | Grandpa -> Shark
    | Let's -> Go
    | Go -> Hunt
    | Run -> Away
    | Safe -> At
    | At -> Last
    | It's -> The
    | The -> End
    | _ -> Doo

let rec gen l = match l with
    | Doo :: Doo :: Doo :: Doo :: Doo :: Doo :: t ->
        gen (next_verse t) @ t @ l @ l @ l
    | h :: _ -> gen (next_token h :: l)
    | _ -> []

let babyshark = List.rev (gen [Baby])
