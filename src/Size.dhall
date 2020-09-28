let showNat = (./Prelude.dhall).Natural.show

let Size
    : Type
    = < B : Natural
      | K : Natural
      | M : Natural
      | G : Natural
      | Ki : Natural
      | Mi : Natural
      | Gi : Natural
      >

let show
    : Size → Text
    = let showWithSize = λ(t : Text) → λ(n : Natural) → showNat n ++ t

      let showMultiplied =
            λ(factor : Natural) → λ(n : Natural) → showNat (n * factor)

      in  λ(u : Size) →
            merge
              { B = showNat
              , K = showWithSize "k"
              , M = showWithSize "m"
              , G = showWithSize "g"
              , Ki = showMultiplied 1000
              , Mi = showMultiplied (1000 * 1000)
              , Gi = showMultiplied (1000 * 1000 * 1000)
              }
              u

let exampleB = assert : show (Size.B 8) ≡ "8"

let exampleK = assert : show (Size.K 16) ≡ "16k"

let exampleM = assert : show (Size.M 32) ≡ "32m"

let exampleG = assert : show (Size.G 4) ≡ "4g"

let exampleKi = assert : show (Size.Ki 10) ≡ "10000"

let exampleMi = assert : show (Size.Mi 2) ≡ "2000000"

let examplegi = assert : show (Size.Gi 1) ≡ "1000000000"

in  { Type = Size, show }
