import CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean.HomotopyEquivalence

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure FundamentalGroupoidPackage {C : TopologicalCategoryPackage} where
  basepoint : C.objects
  loops : C.morphisms basepoint basepoint
  homotopyClasses : Setoid (loops)
  groupOperation : loops → loops → loops
  identityLoop : loops
  inverseLoop : loops → loops
  groupAxioms : Prop
  groupAxiomsClosed : groupAxioms

structure FundamentalGroupoidEvidence {C : TopologicalCategoryPackage}
    (F : FundamentalGroupoidPackage C) where
  groupAxiomsClosed : F.groupAxioms

def FundamentalGroupoidClosed {C : TopologicalCategoryPackage}
    (F : FundamentalGroupoidPackage C) : Prop :=
  F.groupAxioms

theorem fundamental_groupoid_closed_from_evidence {C : TopologicalCategoryPackage}
    (F : FundamentalGroupoidPackage C) (E : FundamentalGroupoidEvidence F) :
    FundamentalGroupoidClosed F := by
  exact E.groupAxiomsClosed

structure FundamentalGroupInvariant {C : TopologicalCategoryPackage} (I : InvariantPackage C) where
  groupoidIsomorphism : ∀ (X Y : C.objects) (H : HomotopyEquivalencePackage C X Y),
    HomotopyEquivalenceClosed H →
    (FundamentalGroupoidPackage.mk X).groupAxioms = (FundamentalGroupoidPackage.mk Y).groupAxioms

def FundamentalGroupInvariantClosed {C : TopologicalCategoryPackage}
    (FGI : FundamentalGroupInvariant C) : Prop :=
  FGI.groupoidIsomorphism

theorem fundamental_group_invariant_closed {C : TopologicalCategoryPackage}
    (FGI : FundamentalGroupInvariant C) (h : FGI.groupoidIsomorphism) :
    FundamentalGroupInvariantClosed FGI := h

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse