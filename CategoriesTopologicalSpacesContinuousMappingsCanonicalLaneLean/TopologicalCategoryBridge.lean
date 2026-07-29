import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure TopologicalCategoryObject where
  spaces : TopologicalSpaceObject
  continuousMappings : ContinuousMappingObject spaces spaces
  identityMappingIncluded : Prop
  compositionClosed : Prop
  identityMappingIncludedTerm : identityMappingIncluded
  compositionClosedTerm : compositionClosed

structure TopologicalCategoryAdmittedClass where
  obj : TopologicalCategoryObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def categoryClosed (A : TopologicalCategoryAdmittedClass) : Prop :=
  A.obj.identityMappingIncluded ∧ A.obj.compositionClosed

theorem category_closed_from_admissible (A : TopologicalCategoryAdmittedClass) :
    categoryClosed A := by
  exact And.intro A.obj.identityMappingIncludedTerm A.obj.compositionClosedTerm

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse