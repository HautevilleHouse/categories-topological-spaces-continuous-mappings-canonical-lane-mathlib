import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure CompactOpenTopologyPackage where
  source : Type u
  target : Type v
  sourceTopology : TopologicalSpace source
  targetTopology : TopologicalSpace target
  mappingSpace : Set (source → target)
  compactOpenTopology : TopologicalSpace mappingSpace
  evaluationContinuous : Continuous (λ (f : mappingSpace) (x : source) => f x)

structure CompactOpenTopologyEvidence (C : CompactOpenTopologyPackage) where
  evaluationContinuousClosed : C.evaluationContinuous

def CompactOpenTopologyClosed (C : CompactOpenTopologyPackage) : Prop :=
  C.evaluationContinuous

theorem compact_open_topology_closed_from_evidence (C : CompactOpenTopologyPackage) (E : CompactOpenTopologyEvidence C) : CompactOpenTopologyClosed C :=
  E.evaluationContinuousClosed

end HautevilleHouse
end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean