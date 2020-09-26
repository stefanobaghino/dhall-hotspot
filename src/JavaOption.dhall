let Flag = ./Flag.dhall

let SystemProperty = ./SystemProperty.dhall

let JavaOption
    : Type
    = < SystemProperty : SystemProperty.Type | Flag : Flag.Type >

let show
    : JavaOption → Text
    = λ(o : JavaOption) →
        merge { SystemProperty = SystemProperty.show, Flag = Flag.show } o

let example1 =
        assert
      :   show
            ( JavaOption.SystemProperty
                { key = "user.dir", value = "/home/user" }
            )
        ≡ "-Duser.dir=/home/user"

let example2 =
        assert
      :   show (JavaOption.Flag (Flag.XX.AllowUserSignalHandlers False))
        ≡ "-XX:-AllowUserSignalHandlers"

in  { Type = JavaOption, show }
