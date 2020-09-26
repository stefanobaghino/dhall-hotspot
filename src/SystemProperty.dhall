let SystemProperty
    : Type
    = { key : Text, value : Text }

let show
    : SystemProperty → Text
    = λ(p : SystemProperty) → "-D" ++ p.key ++ "=" ++ p.value

let exampleShow =
        assert
      :   show { key = "user.dir", value = "/home/user" }
        ≡ "-Duser.dir=/home/user"

in  { Type = SystemProperty, show }
