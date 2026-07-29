import canonicalLaneMathlib.AdmissibleClass
import CategoryOfTopologicalSpaces

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

open TopologicalSpaceCategoryPackage

structure SeparationAxiomsPackage (C : TopologicalSpaceCategoryPackage) where
  t0 : Prop
  t1 : Prop
  hausdorff : Prop
  regular : Prop
  normal : Prop
  urysohnLemma : Prop

structure SeparationAxiomsEvidence {C : TopologicalSpaceCategoryPackage}
    (S : SeparationAxiomsPackage C) where
  t0Closed : S.t0
  t1Closed : S.t1
  hausdorffClosed : S.hausdorff
  regularClosed : S.regular
  normalClosed : S.normal
  urysohnLemmaClosed : S.urysohnLemma

def SeparationAxiomsClosed {C : TopologicalSpaceCategoryPackage}
    (S : SeparationAxiomsPackage C) : Prop :=
  S.t0 ∧ S.t1 ∧ S.hausdorff ∧ S.regular ∧ S.normal ∧ S.urysohnLemma

theorem separation_axioms_closed_from_evidence
    {C : TopologicalSpaceCategoryPackage} (S : SeparationAxiomsPackage C)
    (E : SeparationAxiomsEvidence S) : SeparationAxiomsClosed S := by
  exact And.intro E.t0Closed
    (And.intro E.t1Closed
      (And.intro E.hausdorffClosed
        (And.intro E.regularClosed
          (And.intro E.normalClosed E.urysohnLemmaClosed))))

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse