import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

def bridgeClosed {X Y : TopologicalSpaceObject} (A : ContinuousMappingAdmittedClass X Y) : Prop :=
  ContinuousMappingWitnessClosed A.obj

theorem bridge_from_admissible_class {X Y : TopologicalSpaceObject} (A : ContinuousMappingAdmittedClass X Y) :
    bridgeClosed A := by
  exact A.obj.conclusion

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse