import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure CategoryOfTopologicalSpaces where
  objects : Type u
  morphisms : objects → objects → Type v
  composition : ∀ {A B C : objects}, morphisms A B → morphisms B C → morphisms A C
  identity : ∀ (A : objects), morphisms A A
  associativity : ∀ {A B C D : objects} (f : morphisms A B) (g : morphisms B C) (h : morphisms C D), composition (composition f g) h = composition f (composition g h)
  identityLeft : ∀ {A B : objects} (f : morphisms A B), composition (identity A) f = f
  identityRight : ∀ {A B : objects} (f : morphisms A B), composition f (identity B) = f
  hausdorff : ∀ (X : objects), TopologicalSpace X → Prop
  continuousMaps : ∀ (X Y : objects), (TopologicalSpace X) → (TopologicalSpace Y) → Type w
  continuousComposition : ∀ (X Y Z : objects) (tX : TopologicalSpace X) (tY : TopologicalSpace Y) (tZ : TopologicalSpace Z), continuousMaps X Y tX tY → continuousMaps Y Z tY tZ → continuousMaps X Z tX tZ
  continuousIdentity : ∀ (X : objects) (tX : TopologicalSpace X), continuousMaps X X tX tX

def categoryClosed (C : CategoryOfTopologicalSpaces) : Prop :=
  (∀ (X Y : C.objects) (tX : TopologicalSpace X) (tY : TopologicalSpace Y), Nonempty (C.continuousMaps X Y tX tY)) ∧
  (∀ (X : C.objects), Nonempty (TopologicalSpace X))

end HautevilleHouse
end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean