import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure CategoryPackage where
  objects : Type u
  arrows : Type v
  identity : (x : objects) → arrows
  composition : {x y z : objects} → arrows → arrows → arrows
  identityLeft : ∀ {x y : objects} (f : arrows), composition (identity x) f = f
  identityRight : ∀ {x y : objects} (f : arrows), composition f (identity y) = f
  associativity : ∀ {w x y z : objects} (f : arrows) (g : arrows) (h : arrows), composition (composition f g) h = composition f (composition g h)

structure CategoryEvidence (C : CategoryPackage) where
  identityLeftClosed : C.identityLeft = C.identityLeft
  identityRightClosed : C.identityRight = C.identityRight
  associativityClosed : C.associativity = C.associativity

def CategoryClosed (C : CategoryPackage) : Prop :=
  C.identityLeft = C.identityLeft ∧ C.identityRight = C.identityRight ∧ C.associativity = C.associativity

theorem category_closed_from_evidence (C : CategoryPackage) (E : CategoryEvidence C) : CategoryClosed C := by
  exact And.intro E.identityLeftClosed (And.intro E.identityRightClosed E.associativityClosed)

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse