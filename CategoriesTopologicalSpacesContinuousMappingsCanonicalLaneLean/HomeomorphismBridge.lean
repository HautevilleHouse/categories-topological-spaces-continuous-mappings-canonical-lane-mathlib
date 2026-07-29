import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure HomeomorphismObject (X Y : TopologicalSpaceObject) where
  mapping : ContinuousMappingObject X Y
  inverseMapping : ContinuousMappingObject Y X
  compositionIdentity : Prop
  continuousInverse : Prop
  compositionIdentityTerm : compositionIdentity
  continuousInverseTerm : continuousInverse

structure HomeomorphismAdmittedClass (X Y : TopologicalSpaceObject) where
  obj : HomeomorphismObject X Y
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def homeomorphismClosed {X Y : TopologicalSpaceObject} (A : HomeomorphismAdmittedClass X Y) : Prop :=
  A.obj.compositionIdentity ∧ A.obj.continuousInverse

theorem homeomorphism_closed_from_admissible {X Y : TopologicalSpaceObject} (A : HomeomorphismAdmittedClass X Y) :
    homeomorphismClosed A := by
  exact And.intro A.obj.compositionIdentityTerm A.obj.continuousInverseTerm

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse