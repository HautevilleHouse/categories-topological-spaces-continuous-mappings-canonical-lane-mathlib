import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

def gateClosed {X Y : TopologicalSpaceObject} (A : ContinuousMappingAdmittedClass X Y) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class {X Y : TopologicalSpaceObject} (A : ContinuousMappingAdmittedClass X Y) :
    gateClosed A := by
  exact A.gateWitness

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse