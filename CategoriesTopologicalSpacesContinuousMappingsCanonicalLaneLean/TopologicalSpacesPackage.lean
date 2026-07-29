import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure TopologicalSpacePackage where
  carrier : Type u
  topology : TopologicalSpace carrier
  compactnessProperty : Prop
  separationProperty : Prop
  metrizability : Prop

def TopologicalSpacePackageClosed (P : TopologicalSpacePackage) : Prop :=
  P.compactnessProperty ∧ P.separationProperty ∧ P.metrizability

structure TopologicalSpaceEvidence (P : TopologicalSpacePackage) where
  compactnessPropertyClosed : P.compactnessProperty
  separationPropertyClosed : P.separationProperty
  metrizabilityClosed : P.metrizability

theorem topological_space_package_closed_from_evidence (P : TopologicalSpacePackage) (E : TopologicalSpaceEvidence P) :
    TopologicalSpacePackageClosed P := by
  exact And.intro E.compactnessPropertyClosed (And.intro E.separationPropertyClosed E.metrizabilityClosed)

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse