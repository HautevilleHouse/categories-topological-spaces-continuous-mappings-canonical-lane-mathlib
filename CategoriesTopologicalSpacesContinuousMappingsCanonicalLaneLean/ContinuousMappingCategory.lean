import HautevilleHouse.CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean.TopologyObjects

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure ContinuousMappingCategoryPackage where
  categoryExists : Prop
  continuousMapsClosedUnderComposition : Prop
  identityContinuous : Prop
  associativityHolds : Prop
  identityLawsHold : Prop
  categoryExistsTerm : categoryExists
  continuousMapsClosedUnderCompositionTerm : continuousMapsClosedUnderComposition
  identityContinuousTerm : identityContinuous
  associativityHoldsTerm : associativityHolds
  identityLawsHoldTerm : identityLawsHold

structure ContinuousMappingCategoryEvidence (C : ContinuousMappingCategoryPackage) where
  categoryExistsClosed : C.categoryExists
  continuousMapsClosedUnderCompositionClosed : C.continuousMapsClosedUnderComposition
  identityContinuousClosed : C.identityContinuous
  associativityHoldsClosed : C.associativityHolds
  identityLawsHoldClosed : C.identityLawsHold

def ContinuousMappingCategoryClosed (C : ContinuousMappingCategoryPackage) : Prop :=
  C.categoryExists ∧
  C.continuousMapsClosedUnderComposition ∧
  C.identityContinuous ∧
  C.associativityHolds ∧
  C.identityLawsHold

theorem continuous_mapping_category_closed_from_evidence
    (C : ContinuousMappingCategoryPackage) (E : ContinuousMappingCategoryEvidence C) :
    ContinuousMappingCategoryClosed C := by
  exact And.intro E.categoryExistsClosed
    (And.intro E.continuousMapsClosedUnderCompositionClosed
      (And.intro E.identityContinuousClosed
        (And.intro E.associativityHoldsClosed E.identityLawsHoldClosed)))

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse