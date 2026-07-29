import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

open canonicalLaneMathlib.AdmissibleClass

structure TopologicalSpaceObject where
  carrier : Type u
  topology : TopologicalSpace carrier

structure ContinuousMappingObject where
  source : TopologicalSpaceObject
  target : TopologicalSpaceObject
  map : source.carrier → target.carrier
  continuous : Continuous map

structure TopologyAdmittedObject where
  space : TopologicalSpaceObject
  categoryStructure : Prop
  continuousMappingsClosed : Prop
  conclusion : categoryStructure ∧ continuousMappingsClosed

def TopologyWitnessClosed (O : TopologyAdmittedObject) : Prop :=
  O.categoryStructure ∧ O.continuousMappingsClosed

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse