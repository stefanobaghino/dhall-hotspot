let KeyValue = ./KeyValue.dhall

let showNat = (./Prelude.dhall).Natural.show

let Integral
    : Type
    = KeyValue.Type Natural

let show
    : Integral → Text
    = λ(n : Integral) → "-XX:" ++ n.key ++ "=" ++ showNat n.value

let HotSpot =
      let integral
          : Text → Natural → Integral
          = KeyValue.make Natural

      in  { AltStackSize = integral "AltStackSize"
          , PreBlockSpin = integral "PreBlockSpin"
          , MaxGCPauseMillis = integral "MaxGCPauseMillis"
          , InitiatingHeapOccupancyPercent =
              integral "InitiatingHeapOccupancyPercent"
          , MaxTenuringThreshold = integral "MaxTenuringThreshold"
          , ParallelGCThreads = integral "ParallelGCThreads"
          , ConcGCThreads = integral "ConcGCThreads"
          , G1ReservePercent = integral "G1ReservePercent"
          , CompileThreshold = integral "CompileThreshold"
          , MaxHeapFreeRatio = integral "MaxHeapFreeRatio"
          , NewRatio = integral "NewRatio"
          , SurvivorRatio = integral "SurvivorRatio"
          , TargetSurvivorRatio = integral "TargetSurvivorRatio"
          , ThreadStackSize = integral "ThreadStackSize"
          , AllocatePrefetchLines = integral "AllocatePrefetchLines"
          , AllocatePrefetchStyle = integral "AllocatePrefetchStyle"
          }

let example = assert : show (HotSpot.PreBlockSpin 8) ≡ "-XX:PreBlockSpin=8"

in  { Type = Integral, show, HotSpot }
