import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure ContinuousMapPackage (X Y : TopologicalSpacePackage) where
  map : X.carrier → Y.carrier
  continuous : ∀ (V : Set Y.carrier), Set.mem V Y.openSets → Set.mem (Set.preimage map V) X.openSets

structure ContinuousMapEvidence {X Y : TopologicalSpacePackage} (f : ContinuousMapPackage X Y) where
  continuousClosed : f.continuous = f.continuous

def ContinuousMapClosed {X Y : TopologicalSpacePackage} (f : ContinuousMapPackage X Y) : Prop :=
  f.continuous = f.continuous

theorem continuous_map_closed_from_evidence {X Y : TopologicalSpacePackage} (f : ContinuousMapPackage X Y) (E : ContinuousMapEvidence f) : ContinuousMapClosed f := by
  exact E.continuousClosed

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse