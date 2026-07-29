import CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean.ClassificationTheorems

/-!
# Invariance Principles: Homotopy Invariance, Brouwer, Borsuk-Ulam
-/

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure HomotopyInvariancePackage (X Y : TopologicalSpaceObj) where
  homotopyInvariantFunctor : Type u
  homotopyEquivalencePreservesInvariant : Prop
  homotopyInvariantTerm : homotopyInvariantFunctor
  homotopyEquivalencePreservesTerm : homotopyEquivalencePreservesInvariant

structure FixedPointPackage (X : TopologicalSpaceObj) where
  fixedPointProperty : Prop
  brouwerTheorem : ∀ (f : ContinuousMapObj X X), ∃ x : X.carrier, f.toFun x = x

structure BorsukUlamPackage (m n : ℕ) where
  antipodalMap : ContinuousMapObj (TopologicalSpaceObj.mk (ℝ^(m+1)) inferInstance) (TopologicalSpaceObj.mk (ℝ^n) inferInstance)
  borsukUlamProperty : ∀ f : ContinuousMapObj (TopologicalSpaceObj.mk (ℝ^(m+1)) inferInstance) (TopologicalSpaceObj.mk (ℝ^n) inferInstance), ∃ x : ℝ^(m+1), f.toFun x = f.toFun (-x)

structure InvarianceEvidence (I : HomotopyInvariancePackage) (F : FixedPointPackage) (B : BorsukUlamPackage) where
  homotopyInvariantClosed : I.homotopyEquivalencePreservesInvariant
  fixedPointClosed : F.fixedPointProperty
  borsukUlamClosed : B.borsukUlamProperty

def InvarianceClosed (I : HomotopyInvariancePackage) (F : FixedPointPackage) (B : BorsukUlamPackage) : Prop :=
  I.homotopyEquivalencePreservesInvariant ∧ F.fixedPointProperty ∧ B.borsukUlamProperty

theorem invariance_closed_from_evidence (I : HomotopyInvariancePackage) (F : FixedPointPackage) (B : BorsukUlamPackage) (E : InvarianceEvidence I F B) :
    InvarianceClosed I F B := by
  exact And.intro E.homotopyInvariantClosed (And.intro E.fixedPointClosed E.borsukUlamClosed)

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse