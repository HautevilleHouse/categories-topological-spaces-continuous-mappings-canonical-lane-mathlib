import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure ProductTopologyPackage (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] where
  productSpace : TopologicalSpace (X × Y)
  projectionsContinuous : Continuous Prod.fst ∧ Continuous Prod.snd
  universalProperty : ∀ (Z : Type u) [TopologicalSpace Z] (f : Z → X) (g : Z → Y) (hf : Continuous f) (hg : Continuous g),
    ∃! (h : Z → X × Y), Continuous h ∧ (Prod.fst ∘ h = f) ∧ (Prod.snd ∘ h = g)

theorem product_topology_projections_continuous {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (P : ProductTopologyPackage X Y) : Continuous (Prod.fst : X × Y → X) ∧ Continuous (Prod.snd : X × Y → Y) :=
  P.projectionsContinuous

end HautevilleHouse
end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean