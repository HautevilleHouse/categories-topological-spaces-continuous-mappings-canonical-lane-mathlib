import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure TopologicalSpaceObject where
  carrier : Type u
  topology : TopologicalSpace carrier

structure ContinuousMappingObject (X Y : TopologicalSpaceObject) where
  mapping : X.carrier → Y.carrier
  continuous : Continuous mapping

structure ContinuousMappingAdmittedClass (X Y : TopologicalSpaceObject) where
  obj : ContinuousMappingObject X Y
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure {X Y : TopologicalSpaceObject} (A : ContinuousMappingAdmittedClass X Y) : Prop :=
  ContinuousMappingWitnessClosed A.obj ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse