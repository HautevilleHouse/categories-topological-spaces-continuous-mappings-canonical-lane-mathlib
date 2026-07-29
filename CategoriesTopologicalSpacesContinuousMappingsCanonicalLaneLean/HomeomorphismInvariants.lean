import CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean.ContinuousMappings

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure HomeomorphismPackage {C : TopologicalCategoryPackage}
    (M : ContinuousMappingPackage C) where
  inverse : C.morphisms M.target M.source
  invLeft : C.composition M.map inverse = C.identity M.source
  invRight : C.composition inverse M.map = C.identity M.target
  inverseContinuous : Prop
  inverseContinuousClosed : inverseContinuous

structure HomeomorphismEvidence {C : TopologicalCategoryPackage}
    {M : ContinuousMappingPackage C} (H : HomeomorphismPackage M) where
  inverseContinuousClosed : H.inverseContinuous

def HomeomorphismClosed {C : TopologicalCategoryPackage}
    {M : ContinuousMappingPackage C} (H : HomeomorphismPackage M) : Prop :=
  H.inverseContinuous

theorem homeomorphism_closed_from_evidence {C : TopologicalCategoryPackage}
    {M : ContinuousMappingPackage C} (H : HomeomorphismPackage M)
    (E : HomeomorphismEvidence H) : HomeomorphismClosed H := by
  exact E.inverseContinuousClosed

structure InvariantPackage {C : TopologicalCategoryPackage} where
  property : C.objects → Prop
  homeomorphismInvariant : ∀ (X Y : C.objects) (f : C.morphisms X Y) (g : C.morphisms Y X),
    (∀ x, g (f x) = x) → (∀ y, f (g y) = y) → property X = property Y

def InvariantClosed {C : TopologicalCategoryPackage} (I : InvariantPackage C) : Prop :=
  I.homeomorphismInvariant

theorem invariant_closed {C : TopologicalCategoryPackage} (I : InvariantPackage C)
    (h : I.homeomorphismInvariant) : InvariantClosed I := h

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse