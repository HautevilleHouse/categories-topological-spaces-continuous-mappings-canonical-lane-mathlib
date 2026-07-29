import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure TopologicalInvariantPackage where
  space : Type u
  topology : TopologicalSpace space
  fundamentalGroup : Type v
  homologyGroups : ℕ → Type w
  eulerCharacteristic : ℤ

structure TopologicalInvariantEvidence (I : TopologicalInvariantPackage) where
  fundamentalGroupClosed : Nonempty I.fundamentalGroup
  homologyGroupsClosed : ∀ (n : ℕ), Nonempty (I.homologyGroups n)

def TopologicalInvariantClosed (I : TopologicalInvariantPackage) : Prop :=
  Nonempty I.fundamentalGroup ∧ ∀ (n : ℕ), Nonempty (I.homologyGroups n)

theorem topological_invariant_closed_from_evidence (I : TopologicalInvariantPackage) (E : TopologicalInvariantEvidence I) : TopologicalInvariantClosed I :=
  And.intro E.fundamentalGroupClosed E.homologyGroupsClosed

theorem eulerCharacteristic_homotopyInvariant (f : ContinuousMappingPackage) :
  let X := f.source; let Y := f.target
  in EulerCharacteristic X = EulerCharacteristic Y :=
  sorry

end HautevilleHouse
end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean