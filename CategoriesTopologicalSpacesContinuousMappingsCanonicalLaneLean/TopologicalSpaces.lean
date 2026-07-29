import CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean.AdmissibleClass

/-!
# Topological Spaces Package
-/

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure TopologicalSpacesPackage where
  openSets : Set (Set Point)
  emptyAndWholeOpen : Prop
  unionClosedUnderArbitrary : Prop
  intersectionClosedUnderFinite : Prop
  point : Type

structure TopologicalSpacesEvidence (T : TopologicalSpacesPackage) where
  emptyAndWholeOpenClosed : T.emptyAndWholeOpen
  unionClosedUnderArbitraryClosed : T.unionClosedUnderArbitrary
  intersectionClosedUnderFiniteClosed : T.intersectionClosedUnderFinite

def TopologicalSpacesClosed (T : TopologicalSpacesPackage) : Prop :=
  T.emptyAndWholeOpen ∧ T.unionClosedUnderArbitrary ∧ T.intersectionClosedUnderFinite

theorem topological_spaces_closed_from_evidence (T : TopologicalSpacesPackage)
    (E : TopologicalSpacesEvidence T) : TopologicalSpacesClosed T := by
  exact And.intro E.emptyAndWholeOpenClosed (And.intro E.unionClosedUnderArbitraryClosed E.intersectionClosedUnderFiniteClosed)

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse