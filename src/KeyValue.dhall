let KeyValue
    : Type → Type
    = λ(a : Type) → { key : Text, value : a }

let make
    : ∀(a : Type) → Text → a → KeyValue a
    = λ(a : Type) → λ(key : Text) → λ(value : a) → { key, value }

in  { Type = KeyValue, make }
