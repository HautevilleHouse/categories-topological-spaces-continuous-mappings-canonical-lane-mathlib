import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean.CategoryPackage
import HautevilleHouse.CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean.TopologicalSpacePackage
import HautevilleHouse.CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean.ContinuousMapPackage

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure CategoryOfTopologicalSpacesPackage where
  cat : CategoryPackage
  objIsTopSpace : cat.objects = Type u × TopologicalSpacePackage
  homIsContMap : ∀ (A B : cat.objects), cat.arrows A B = ContinuousMapPackage A.2 B.2
  compositionIsCont : ∀ {A B C : cat.objects} (f : cat.arrows A B) (g : cat.arrows B C), cat.composition f g = (ContinuousMapPackage.mk (fun x => g.map (f.map x)) (by
    intro V hV
    have h1 : Set.mem (Set.preimage g.map V) B.openSets := g.continuous V hV
    have h2 : Set.mem (Set.preimage f.map (Set.preimage g.map V)) A.openSets := f.continuous (Set.preimage g.map V) h1
    exact h2
  ))

structure CategoryOfTopologicalSpacesEvidence (C : CategoryOfTopologicalSpacesPackage) where
  objIsTopSpaceClosed : C.objIsTopSpace = C.objIsTopSpace
  homIsContMapClosed : C.homIsContMap = C.homIsContMap
  compositionIsContClosed : C.compositionIsCont = C.compositionIsCont

def CategoryOfTopologicalSpacesClosed (C : CategoryOfTopologicalSpacesPackage) : Prop :=
  C.objIsTopSpace = C.objIsTopSpace ∧ C.homIsContMap = C.homIsContMap ∧ C.compositionIsCont = C.compositionIsCont

theorem category_of_topological_spaces_closed_from_evidence (C : CategoryOfTopologicalSpacesPackage) (E : CategoryOfTopologicalSpacesEvidence C) : CategoryOfTopologicalSpacesClosed C := by
  exact And.intro E.objIsTopSpaceClosed (And.intro E.homIsContMapClosed E.compositionIsContClosed)

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse