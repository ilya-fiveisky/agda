-- Andreas, Jesper, 2017-05-13, issue #2578 reported by nad

data _⊎_ (A B : Set) : Set where
  inj₁ : A → A ⊎ B
  inj₂ : B → A ⊎ B

record ⊤ : Set where
  constructor tt

data ⊥ : Set where

Maybe : Set → Set
Maybe A = ⊤ ⊎ A

pattern nothing = inj₁ tt
pattern just x  = inj₂ x

Bool : Set
Bool = ⊤ ⊎ ⊤

pattern true  = inj₁ tt
pattern false = inj₂ tt

x : Maybe ⊥
x = nothing

A : Set₁
A with false
A | true = Set
A | false with x | x
... | nothing | nothing = Set
... | just () | _
... | _ | just ()
