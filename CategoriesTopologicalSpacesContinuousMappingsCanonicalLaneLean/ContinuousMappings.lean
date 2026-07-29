import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure ContinuousMappingPackage where
  source : Type u
  target : Type v
  sourceTopology : TopologicalSpace source
  targetTopology : TopologicalSpace target
  mapping : source → target
  continuityCondition : Continuous mapping

structure ContinuousMappingEvidence (C : ContinuousMappingPackage) where
  continuityClosed : C.continuityCondition

def ContinuousMappingClosed (C : ContinuousMappingPackage) : Prop :=
  C.continuityCondition

theorem continuous_mapping_closed_from_evidence (C : ContinuousMappingPackage) (E : ContinuousMappingEvidence C) : ContinuousMappingClosed C :=
  E.continuityClosed

def mappingComposition (f : ContinuousMappingPackage) (g : ContinuousMappingPackage) (h : f.target = g.source) : ContinuousMappingPackage :=
  {
    source := f.source
    target := g.target
    sourceTopology := f.sourceTopology
    targetTopology := g.targetTopology
    mapping := g.mapping ∘ f.mapping
    continuityCondition := by
      -- Composition of continuous maps is continuous
      have hf : Continuous f.mapping := f.continuityCondition
      have hg : Continuous g.mapping := g.continuityCondition
      exact hg.comp hf
  }

end HautevilleHouse
end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean