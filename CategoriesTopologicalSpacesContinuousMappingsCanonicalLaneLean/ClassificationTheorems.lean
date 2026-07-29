import CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean.CategoryTopContinuousMaps

/-!
# Classification Theorems in Topology
-/

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure CoveringSpace (E B : TopologicalSpaceObj) (p : ContinuousMapObj E B) where
  coveringProperty : ∀ x : B.carrier, ∃ U : Set B.carrier, IsOpen U ∧ x ∈ U ∧ ∃ (F : Set E.carrier), IsHomeomorphic (p.toFun⁻¹' U) (U × F)

structure FundamentalGroupoid (X : TopologicalSpaceObj) where
  objects : X.carrier
  morphisms : X.carrier → X.carrier → Set (Path X X)

structure HomotopyEquivalence (X Y : TopologicalSpaceObj) : Prop where
  f : ContinuousMapObj X Y
  g : ContinuousMapObj Y X
  h1 : HomotopyBetween (g.comp f) (ContinuousMapObj.id X)
  h2 : HomotopyBetween (f.comp g) (ContinuousMapObj.id Y)

structure ClassificationPackage (X : TopologicalSpaceObj) where
  fundamentalGroupTrivial : FundamentalGroupoid X
  simplyConnected : Prop
  coveringSpacesClassified : Prop
  sphereRecognition : Prop

structure ClassificationEvidence (C : ClassificationPackage) where
  simplyConnectedClosed : C.simplyConnected
  coveringSpacesClassifiedClosed : C.coveringSpacesClassified
  sphereRecognitionClosed : C.sphereRecognition

def ClassificationClosed (C : ClassificationPackage) : Prop :=
  C.simplyConnected ∧ C.coveringSpacesClassified ∧ C.sphereRecognition

theorem classification_closed_from_evidence (C : ClassificationPackage) (E : ClassificationEvidence C) :
    ClassificationClosed C := by
  exact And.intro E.simplyConnectedClosed (And.intro E.coveringSpacesClassifiedClosed E.sphereRecognitionClosed)

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse