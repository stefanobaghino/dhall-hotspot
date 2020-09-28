let Decimal = ./Decimal.dhall

let Flag = ./Flag.dhall

let Integral = ./Integral.dhall

let Short = ./Short.dhall

let Size = ./Size.dhall

let Sized = ./Sized.dhall

let SystemProperty = ./SystemProperty.dhall

let JavaOption
    : Type
    = < Decimal : Decimal.Type
      | Flag : Flag.Type
      | Integral : Integral.Type
      | Short : Short.Type
      | Sized : Sized.Type
      | SystemProperty : SystemProperty.Type
      >

let show
    : JavaOption → Text
    = λ(o : JavaOption) →
        merge
          { Decimal = Decimal.show
          , Flag = Flag.show
          , Integral = Integral.show
          , Short = Short.show
          , Sized = Sized.show
          , SystemProperty = SystemProperty.show
          }
          o

let exampleDecimal =
        assert
      :   show (JavaOption.Decimal (Decimal.HotSpot.InitialRAMPercentage 60.0))
        ≡ "-XX:InitialRAMPercentage=60.0"

let exampleFlag =
        assert
      :   show (JavaOption.Flag (Flag.HotSpot.AllowUserSignalHandlers False))
        ≡ "-XX:-AllowUserSignalHandlers"

let exampleIntegral =
        assert
      :   show (JavaOption.Integral (Integral.HotSpot.AltStackSize 8192))
        ≡ "-XX:AltStackSize=8192"

let exampleSized =
        assert
      :   show
            (JavaOption.Sized (Sized.HotSpot.G1HeapRegionSize (Size.Type.M 64)))
        ≡ "-XX:G1HeapRegionSize=64m"

let exampleShort =
        assert
      : show (JavaOption.Short (Short.HotSpot.Xmx (Size.Type.G 2))) ≡ "-Xmx2g"

let exampleSystemProperty =
        assert
      :   show
            ( JavaOption.SystemProperty
                { key = "user.dir", value = "/home/user" }
            )
        ≡ "-Duser.dir=/home/user"

in  { Type = JavaOption, show }
