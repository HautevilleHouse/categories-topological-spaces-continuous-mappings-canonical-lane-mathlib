import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure TopologicalAdmittedObject where
  space : Type u
  topology : TopologicalSpace space
  compactHausdorff : Prop
  conclusion : compactHausdorff

def TopologicalWitnessClosed (O : TopologicalAdmittedObject) : Prop :=
  O.compactHausdorff

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse