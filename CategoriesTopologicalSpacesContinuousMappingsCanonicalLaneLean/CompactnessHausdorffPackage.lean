import CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure CompactnessPackage where
  space : TopologicalSpaceObject
  compact : Prop

structure CompactnessEvidence (P : CompactnessPackage) where
  compactClosed : P.compact

def CompactnessClosed (P : CompactnessPackage) : Prop := P.compact

theorem compactness_closed_from_evidence (P : CompactnessPackage) (E : CompactnessEvidence P) :
    CompactnessClosed P := E.compactClosed

structure HausdorffPackage where
  space : TopologicalSpaceObject
  hausdorff : Prop

structure HausdorffEvidence (P : HausdorffPackage) where
  hausdorffClosed : P.hausdorff

def HausdorffClosed (P : HausdorffPackage) : Prop := P.hausdorff

theorem hausdorff_closed_from_evidence (P : HausdorffPackage) (E : HausdorffEvidence P) :
    HausdorffClosed P := E.hausdorffClosed

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse