let KeyValue = ./KeyValue.dhall

let Size = ./Size.dhall

let Sized
    : Type
    = KeyValue.Type Size.Type

let show
    : Sized → Text
    = λ(n : Sized) → "-XX:" ++ n.key ++ "=" ++ Size.show n.value

let HotSpot =
      let sized
          : Text → Size.Type → Sized
          = KeyValue.make Size.Type

      in  { G1HeapRegionSize = sized "G1HeapRegionSize"
          , LargePageSizeInBytes = sized "LargePageSizeInBytes"
          , MaxNewSize = sized "MaxNewSize"
          , MaxPermSize = sized "MaxPermSize"
          , NewSize = sized "NewSize"
          , ReservedCodeCacheSize = sized "ReservedCodeCacheSize"
          }

let example =
        assert
      :   show (HotSpot.G1HeapRegionSize (Size.Type.M 16))
        ≡ "-XX:G1HeapRegionSize=16m"

in  { Type = Sized, show, HotSpot }
