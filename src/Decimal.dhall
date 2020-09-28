let KeyValue = ./KeyValue.dhall

let showDouble = (./Prelude.dhall).Double.show

let Decimal
    : Type
    = KeyValue.Type Double

let show
    : Decimal → Text
    = λ(n : Decimal) → "-XX:" ++ n.key ++ "=" ++ showDouble n.value

let HotSpot =
      let decimal
          : Text → Double → Decimal
          = KeyValue.make Double

      in  { InitialRAMPercentage = decimal "InitialRAMPercentage"
          , MinRAMPercentage = decimal "MinRAMPercentage"
          , MaxRAMPercentage = decimal "MaxRAMPercentage"
          }

let example =
        assert
      : show (HotSpot.MaxRAMPercentage 75.0) ≡ "-XX:MaxRAMPercentage=75.0"

in  { Type = Decimal, show, HotSpot }
