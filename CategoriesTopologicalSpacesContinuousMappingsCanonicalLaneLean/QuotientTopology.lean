import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure QuotientTopologyPackage (X : Type u) [TopologicalSpace X] (R : X → X → Prop) where
  quotientSpace : TopologicalSpace (Quot R)
  projectionContinuous : Continuous (Quot.mk R)
  universalProperty : ∀ (Y : Type u) [TopologicalSpace Y] (f : X → Y) (hf : Continuous f) (h : ∀ x y : X, R x y → f x = f y),
    ∃! (g : Quot R → Y), Continuous g ∧ (g ∘ Quot.mk R = f)

theorem quotient_topology_projection_continuous {X : Type u} [TopologicalSpace X] {R : X → X → Prop} (Q : QuotientTopologyPackage X R) : Continuous (Quot.mk R) :=
  Q.projectionContinuous

end HautevilleHouse
end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean