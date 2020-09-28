let Prelude = ./Prelude.dhall

let JavaOption = ./JavaOption.dhall

let Decimal = JavaOption.Type.Decimal

let Flag = JavaOption.Type.Flag

let Integral = JavaOption.Type.Integral

let Short = JavaOption.Type.Short

let Sized = JavaOption.Type.Sized

let SystemProperty = JavaOption.Type.SystemProperty

let Size = ./Size.dhall

let HotSpot =
        (./Decimal.dhall).HotSpot
      ⫽ (./Flag.dhall).HotSpot
      ⫽ (./Integral.dhall).HotSpot
      ⫽ (./Short.dhall).HotSpot
      ⫽ (./Sized.dhall).HotSpot

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
            , Flag (HotSpot.UseConcMarkSweepGC True)
            ]
        ≡ "-Duser.dir=/home/user -XX:+UseConcMarkSweepGC"

let example5 =
        assert
      :   show
            [ Flag (HotSpot.UseSpinning True)
            , Integral (HotSpot.PreBlockSpin 16)
            ]
        ≡ "-XX:+UseSpinning -XX:PreBlockSpin=16"

let example6 =
        assert
      :   show
            [ Flag (HotSpot.UseSpinning True)
            , Integral (HotSpot.PreBlockSpin 16)
            , SystemProperty { key = "user.dir", value = "/home/user" }
            , Flag (HotSpot.UseConcMarkSweepGC True)
            , Short (HotSpot.Xss (Size.Type.M 8))
            , Short (HotSpot.Xms (Size.Type.G 4))
            , Short (HotSpot.Xmx (Size.Type.G 8))
            ]
        ≡ "-XX:+UseSpinning -XX:PreBlockSpin=16 -Duser.dir=/home/user -XX:+UseConcMarkSweepGC -Xss8m -Xms4g -Xmx8g"

let example6 =
        assert
      :   show
            [ Decimal (HotSpot.InitialRAMPercentage 25.0)
            , Decimal (HotSpot.MinRAMPercentage 15.0)
            , Decimal (HotSpot.MaxRAMPercentage 75.0)
            , Flag (HotSpot.UseG1GC True)
            , Sized (HotSpot.G1HeapRegionSize (Size.Type.M 64))
            ]
        ≡ "-XX:InitialRAMPercentage=25.0 -XX:MinRAMPercentage=15.0 -XX:MaxRAMPercentage=75.0 -XX:+UseG1GC -XX:G1HeapRegionSize=64m"

in  { Type = JavaOptions
    , Size = Size.Type
    , Decimal
    , Flag
    , Integral
    , Sized
    , SystemProperty
    , HotSpot
    , show
    }
