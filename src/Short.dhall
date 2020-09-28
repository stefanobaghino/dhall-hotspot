let KeyValue = ./KeyValue.dhall

let Size = ./Size.dhall

let Short
    : Type
    = KeyValue.Type Size.Type

let show
    : Short → Text
    = λ(m : Short) → m.key ++ Size.show m.value

let HotSpot =
      let short
          : Text → Size.Type → Short
          = KeyValue.make Size.Type

      in  { Xms = short "-Xms", Xmx = short "-Xmx", Xss = short "-Xss" }

let exampleXss = assert : show (HotSpot.Xss (Size.Type.M 16)) ≡ "-Xss16m"

let exampleXms = assert : show (HotSpot.Xms (Size.Type.G 4)) ≡ "-Xms4g"

let exampleXmx = assert : show (HotSpot.Xmx (Size.Type.G 8)) ≡ "-Xmx8g"

in  { Type = Short, show, HotSpot }
