import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean.TopologicalSpacesPackage

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure ContinuousMappingsPackage (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] where
  mappingSpace : Type u
  topologyOnMappingSpace : TopologicalSpace mappingSpace
  homeomorphismGroup : Type u
  groupStructure : Group homeomorphismGroup
  topologicalInvariance : Prop

def ContinuousMappingsPackageClosed {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (P : ContinuousMappingsPackage X Y) : Prop :=
  P.topologicalInvariance

structure ContinuousMappingsEvidence {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (P : ContinuousMappingsPackage X Y) where
  topologicalInvarianceClosed : P.topologicalInvariance

theorem continuous_mappings_package_closed_from_evidence {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (P : ContinuousMappingsPackage X Y) (E : ContinuousMappingsEvidence P) :
    ContinuousMappingsPackageClosed P := by
  exact E.topologicalInvarianceClosed

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse