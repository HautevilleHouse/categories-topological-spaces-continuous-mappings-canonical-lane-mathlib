import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure ContinuousMapStructure (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] where
  toFun : X → Y
  continuous : Continuous toFun

theorem continuous_map_structure_continuous {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (f : ContinuousMapStructure X Y) : Continuous f.toFun :=
  f.continuous

end HautevilleHouse
end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean