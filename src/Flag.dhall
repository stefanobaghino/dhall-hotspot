let Flag
    : Type
    = { key : Text, value : Bool }

let show
    : Flag → Text
    = λ(f : Flag) → "-XX:" ++ (if f.value then "+" else "-") ++ f.key

let XX =
      let flag
          : Text → Bool → Flag
          = λ(key : Text) → λ(value : Bool) → { key, value }

      in  { AllowUserSignalHandlers = flag "AllowUserSignalHandlers"
          , DisableExplicitGC = flag "DisableExplicitGC"
          , FailOverToOldVerifier = flag "FailOverToOldVerifier"
          , HandlePromotionFailure = flag "HandlePromotionFailure"
          , MaxFDLimit = flag "MaxFDLimit"
          , RelaxAccessControlCheck = flag "RelaxAccessControlCheck"
          , ScavengeBeforeFullGC = flag "ScavengeBeforeFullGC"
          , UseAltSigs = flag "UseAltSigs"
          , UseBoundThreads = flag "UseBoundThreads"
          , UseConcMarkSweepGC = flag "UseConcMarkSweepGC"
          , UseGCOverheadLimit = flag "UseGCOverheadLimit"
          , UseLWPSynchronization = flag "UseLWPSynchronization"
          , UseParallelGC = flag "UseParallelGC"
          , UseParallelOldGC = flag "UseParallelOldGC"
          , UseSerialGC = flag "UseSerialGC"
          , UseSpinning = flag "UseSpinning"
          , UseTLAB = flag "UseTLAB"
          , UseSplitVerifier = flag "UseSplitVerifier"
          , UseThreadPriorities = flag "UseThreadPriorities"
          , UseVMInterruptibleIO = flag "UseVMInterruptibleIO"
          , UseG1GC = flag "UseG1GC"
          , AggressiveOpts = flag "AggressiveOpts"
          , UseBiasedLocking = flag "UseBiasedLocking"
          , UseFastAccessorMethods = flag "UseFastAccessorMethods"
          , UseISM = flag "UseISM"
          , UseLargePages = flag "UseLargePages"
          , UseMPSS = flag "UseMPSS"
          , UseStringCache = flag "UseStringCache"
          , UseCompressedStrings = flag "UseCompressedStrings"
          , OptimizeStringConcat = flag "OptimizeStringConcat"
          , CITime = flag "CITime"
          , ExtendedDTraceProbes = flag "ExtendedDTraceProbes"
          , HeapDumpOnOutOfMemoryError = flag "HeapDumpOnOutOfMemoryError"
          , PrintClassHistogram = flag "PrintClassHistogram"
          , PrintConcurrentLocks = flag "PrintConcurrentLocks"
          , PrintCommandLineFlags = flag "PrintCommandLineFlags"
          , PrintCompilation = flag "PrintCompilation"
          , PrintGC = flag "PrintGC"
          , PrintGCDetails = flag "PrintGCDetails"
          , PrintGCTimeStamps = flag "PrintGCTimeStamps"
          , PrintTenuringDistribution = flag "PrintTenuringDistribution"
          , PrintAdaptiveSizePolicy = flag "PrintAdaptiveSizePolicy"
          , TraceClassLoading = flag "TraceClassLoading"
          , TraceClassLoadingPreorder = flag "TraceClassLoadingPreorder"
          , TraceClassResolution = flag "TraceClassResolution"
          , TraceClassUnloading = flag "TraceClassUnloading"
          , TraceLoaderConstraints = flag "TraceLoaderConstraints"
          , PerfDataSaveToFile = flag "PerfDataSaveToFile"
          , UseCompressedOops = flag "UseCompressedOops"
          , AlwaysPreTouch = flag "AlwaysPreTouch"
          }

let exampleTrue =
        assert
      : show (XX.AllowUserSignalHandlers True) ≡ "-XX:+AllowUserSignalHandlers"

let exampleFalse =
        assert
      : show (XX.AllowUserSignalHandlers False) ≡ "-XX:-AllowUserSignalHandlers"

in  { Type = Flag, show, XX }
