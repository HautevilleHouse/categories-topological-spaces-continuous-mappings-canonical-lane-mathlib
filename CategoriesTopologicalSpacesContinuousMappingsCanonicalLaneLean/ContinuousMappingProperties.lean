import canonicalLaneMathlib.AdmissibleClass
import CategoryOfTopologicalSpaces

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

open TopologicalSpaceCategoryPackage

structure ContinuousMappingPackage (C : TopologicalSpaceCategoryPackage) where
  homeomorphismDefined : Prop
  openMapDefined : Prop
  closedMapDefined : Prop
  embeddingDefined : Prop
  quotientMapDefined : Prop

structure ContinuousMappingEvidence {C : TopologicalSpaceCategoryPackage}
    (M : ContinuousMappingPackage C) where
  homeomorphismDefinedClosed : M.homeomorphismDefined
  openMapDefinedClosed : M.openMapDefined
  closedMapDefinedClosed : M.closedMapDefined
  embeddingDefinedClosed : M.embeddingDefined
  quotientMapDefinedClosed : M.quotientMapDefined

def ContinuousMappingClosed {C : TopologicalSpaceCategoryPackage}
    (M : ContinuousMappingPackage C) : Prop :=
  M.homeomorphismDefined ∧ M.openMapDefined ∧ M.closedMapDefined ∧
  M.embeddingDefined ∧ M.quotientMapDefined

theorem continuous_mapping_closed_from_evidence
    {C : TopologicalSpaceCategoryPackage} (M : ContinuousMappingPackage C)
    (E : ContinuousMappingEvidence M) : ContinuousMappingClosed M := by
  exact And.intro E.homeomorphismDefinedClosed
    (And.intro E.openMapDefinedClosed
      (And.intro E.closedMapDefinedClosed
        (And.intro E.embeddingDefinedClosed E.quotientMapDefinedClosed)))

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse