import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure HomotopyEquivalencePackage where
  spaceA : Type u
  spaceB : Type v
  topA : TopologicalSpace spaceA
  topB : TopologicalSpace spaceB
  fwd : spaceA → spaceB
  bwd : spaceB → spaceA
  homotopyIdA : spaceA × 𝕀 → spaceA
  homotopyIdB : spaceB × 𝕀 → spaceB
  continuityFwd : Continuous fwd
  continuityBwd : Continuous bwd
  homotopyContinuityA : Continuous homotopyIdA
  homotopyContinuityB : Continuous homotopyIdB
  homotopyConditionA : ∀ (x : spaceA), homotopyIdA (x, 0) = (bwd ∘ fwd) x ∧ homotopyIdA (x, 1) = x
  homotopyConditionB : ∀ (y : spaceB), homotopyIdB (y, 0) = (fwd ∘ bwd) y ∧ homotopyIdB (y, 1) = y

structure HomotopyEquivalenceEvidence (H : HomotopyEquivalencePackage) where
  continuityFwdClosed : H.continuityFwd
  continuityBwdClosed : H.continuityBwd
  homotopyContinuityAClosed : H.homotopyContinuityA
  homotopyContinuityBClosed : H.homotopyContinuityB
  homotopyConditionAClosed : ∀ (x : H.spaceA), H.homotopyIdA (x, 0) = (H.bwd ∘ H.fwd) x ∧ H.homotopyIdA (x, 1) = x
  homotopyConditionBClosed : ∀ (y : H.spaceB), H.homotopyIdB (y, 0) = (H.fwd ∘ H.bwd) y ∧ H.homotopyIdB (y, 1) = y

def HomotopyEquivalenceClosed (H : HomotopyEquivalencePackage) : Prop :=
  H.continuityFwd ∧ H.continuityBwd ∧ H.homotopyContinuityA ∧ H.homotopyContinuityB ∧
  (∀ (x : H.spaceA), H.homotopyIdA (x, 0) = (H.bwd ∘ H.fwd) x ∧ H.homotopyIdA (x, 1) = x) ∧
  (∀ (y : H.spaceB), H.homotopyIdB (y, 0) = (H.fwd ∘ H.bwd) y ∧ H.homotopyIdB (y, 1) = y)

theorem homotopy_equivalence_closed_from_evidence (H : HomotopyEquivalencePackage) (E : HomotopyEquivalenceEvidence H) : HomotopyEquivalenceClosed H :=
  And.intro E.continuityFwdClosed (And.intro E.continuityBwdClosed (And.intro E.homotopyContinuityAClosed (And.intro E.homotopyContinuityBClosed (And.intro E.homotopyConditionAClosed E.homotopyConditionBClosed))))

end HautevilleHouse
end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean