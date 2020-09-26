let Prelude = ./Prelude.dhall

let JavaOption = ./JavaOption.dhall

let SystemProperty = JavaOption.Type.SystemProperty

let Flag = JavaOption.Type.Flag

let XX = (./Flag.dhall).XX

let JavaOptions
    : Type
    = List JavaOption.Type

let show
    : JavaOptions → Text
    = Prelude.Text.concatMapSep " " JavaOption.Type JavaOption.show

let example1 = assert : show ([] : JavaOptions) ≡ ""

let example2 =
        assert
      :   show [ SystemProperty { key = "user.dir", value = "/home/user" } ]
        ≡ "-Duser.dir=/home/user"

let example3 =
        assert
      :   show
            [ SystemProperty { key = "user.dir", value = "/home/user" }
            , SystemProperty { key = "user.name", value = "user" }
            ]
        ≡ "-Duser.dir=/home/user -Duser.name=user"

let example4 =
        assert
      :   show
            [ SystemProperty { key = "user.dir", value = "/home/user" }
            , Flag (XX.UseConcMarkSweepGC True)
            ]
        ≡ "-Duser.dir=/home/user -XX:+UseConcMarkSweepGC"

in  { Type = JavaOptions, Flag, SystemProperty, XX, show }
