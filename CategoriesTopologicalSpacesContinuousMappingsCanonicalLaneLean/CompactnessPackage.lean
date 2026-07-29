import canonicalLaneMathlib.AdmissibleClass
import CategoryOfTopologicalSpaces

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

open TopologicalSpaceCategoryPackage

structure CompactnessPackage (C : TopologicalSpaceCategoryPackage) where
  compactDefined : Prop
  hausdorffDefined : Prop
  tychonoffTheorem : Prop
  closedSubsetsCompact : Prop
  continuousImageCompact : Prop

structure CompactnessEvidence {C : TopologicalSpaceCategoryPackage}
    (K : CompactnessPackage C) where
  compactDefinedClosed : K.compactDefined
  hausdorffDefinedClosed : K.hausdorffDefined
  tychonoffTheoremClosed : K.tychonoffTheorem
  closedSubsetsCompactClosed : K.closedSubsetsCompact
  continuousImageCompactClosed : K.continuousImageCompact

def CompactnessClosed {C : TopologicalSpaceCategoryPackage}
    (K : CompactnessPackage C) : Prop :=
  K.compactDefined ∧ K.hausdorffDefined ∧ K.tychonoffTheorem ∧
  K.closedSubsetsCompact ∧ K.continuousImageCompact

theorem compactness_closed_from_evidence
    {C : TopologicalSpaceCategoryPackage} (K : CompactnessPackage C)
    (E : CompactnessEvidence K) : CompactnessClosed K := by
  exact And.intro E.compactDefinedClosed
    (And.intro E.hausdorffDefinedClosed
      (And.intro E.tychonoffTheoremClosed
        (And.intro E.closedSubsetsCompactClosed E.continuousImageCompactClosed)))

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse