import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

def ConstrainedContinuousMappingClosure {X Y : TopologicalSpaceObject} (A : ContinuousMappingAdmittedClass X Y) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_continuous_mapping_endgame {X Y : TopologicalSpaceObject} (A : ContinuousMappingAdmittedClass X Y) :
    ConstrainedContinuousMappingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse