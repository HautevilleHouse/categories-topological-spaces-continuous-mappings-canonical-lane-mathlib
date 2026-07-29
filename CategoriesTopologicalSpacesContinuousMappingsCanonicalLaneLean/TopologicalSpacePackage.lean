import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure TopologicalSpacePackage where
  carrier : Type u
  openSets : Set (Set carrier)
  emptyOpen : Set.mem Set.empty openSets
  unionOpen : ∀ (U : Set (Set carrier)), (∀ (x : Set carrier), Set.mem x U → Set.mem x openSets) → Set.mem (Set.sUnion U) openSets
  finiteIntersectionOpen : ∀ (U : Set (Set carrier)), Set.Finite U → (∀ (x : Set carrier), Set.mem x U → Set.mem x openSets) → Set.mem (Set.sInter U) openSets

structure TopologicalSpaceEvidence (T : TopologicalSpacePackage) where
  emptyOpenClosed : T.emptyOpen = T.emptyOpen
  unionOpenClosed : T.unionOpen = T.unionOpen
  finiteIntersectionOpenClosed : T.finiteIntersectionOpen = T.finiteIntersectionOpen

def TopologicalSpaceClosed (T : TopologicalSpacePackage) : Prop :=
  T.emptyOpen = T.emptyOpen ∧ T.unionOpen = T.unionOpen ∧ T.finiteIntersectionOpen = T.finiteIntersectionOpen

theorem topological_space_closed_from_evidence (T : TopologicalSpacePackage) (E : TopologicalSpaceEvidence T) : TopologicalSpaceClosed T := by
  exact And.intro E.emptyOpenClosed (And.intro E.unionOpenClosed E.finiteIntersectionOpenClosed)

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse