import CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean.CompactnessHausdorffPackage

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure HomeomorphismClassificationPackage (C : CompactnessPackage) (H : HausdorffPackage) where
  sourceSpace : TopologicalSpaceObject
  targetSpace : TopologicalSpaceObject
  continuousBijection : Prop
  sourceCompact : Prop
  targetHausdorff : Prop
  homeomorphismConclusion : Prop

structure HomeomorphismClassificationEvidence {C : CompactnessPackage} {H : HausdorffPackage}
    (P : HomeomorphismClassificationPackage C H) where
  continuousBijectionClosed : P.continuousBijection
  sourceCompactClosed : P.sourceCompact
  targetHausdorffClosed : P.targetHausdorff
  homeomorphismConclusionClosed : P.homeomorphismConclusion

def HomeomorphismClassificationClosed {C : CompactnessPackage} {H : HausdorffPackage}
    (P : HomeomorphismClassificationPackage C H) : Prop :=
  P.continuousBijection ∧ P.sourceCompact ∧ P.targetHausdorff ∧ P.homeomorphismConclusion

theorem homeomorphism_classification_closed_from_evidence {C : CompactnessPackage} {H : HausdorffPackage}
    (P : HomeomorphismClassificationPackage C H) (E : HomeomorphismClassificationEvidence P) :
    HomeomorphismClassificationClosed P := by
  exact And.intro E.continuousBijectionClosed (And.intro E.sourceCompactClosed (And.intro E.targetHausdorffClosed E.homeomorphismConclusionClosed))

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse