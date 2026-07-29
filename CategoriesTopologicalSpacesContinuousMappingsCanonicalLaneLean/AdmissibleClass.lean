import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure AdmittedObject where
  space : Type u
  topology : TopologicalSpace space
  isHausdorff : Prop
  isCompact : Prop
  isConnected : Prop

structure AdmissibleClass where
  object : AdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.isHausdorff ∧ A.object.isCompact ∧ A.object.isConnected) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end HautevilleHouse
end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean