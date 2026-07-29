import CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean.CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

/-!
# Category of Topological Spaces and Continuous Maps
-/

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure TopologicalAdmittedObject where
  space : TopologicalSpaceObj
  property : Prop
  conclusion : property

structure TopologicalCategoryEvidence where
  identityExists : ∀ (X : TopologicalSpaceObj), ContinuousMapObj X X
  composableClosure : ∀ (X Y Z : TopologicalSpaceObj) (f : ContinuousMapObj X Y) (g : ContinuousMapObj Y Z), ContinuousMapObj X Z
  associativityHolds : ∀ (X Y Z W : TopologicalSpaceObj) (f : ContinuousMapObj X Y) (g : ContinuousMapObj Y Z) (h : ContinuousMapObj Z W), (g.comp f).comp h = g.comp (f.comp h)
  unitLeft : ∀ (X Y : TopologicalSpaceObj) (f : ContinuousMapObj X Y), (ContinuousMapObj.id Y).comp f = f
  unitRight : ∀ (X Y : TopologicalSpaceObj) (f : ContinuousMapObj X Y), f.comp (ContinuousMapObj.id X) = f

instance : CategoryTop where
  objects := TopologicalSpaceObj
  morphisms X Y := ContinuousMapObj X Y
  identity X := { toFun := id, continuous_toFun := continuous_id }
  compose f g := { toFun := g.toFun ∘ f.toFun, continuous_toFun := g.continuous_toFun.comp f.continuous_toFun }
  associativity f g h := rfl
  identity_left f := rfl
  identity_right f := rfl

def TopologicalWitnessClosed (O : TopologicalAdmittedObject) : Prop :=
  O.property

theorem top_category_evidence_holds : TopologicalCategoryEvidence := by
  refine {
    identityExists := λ X => ⟨id, continuous_id⟩
    composableClosure := λ X Y Z f g => ⟨g.toFun ∘ f.toFun, g.continuous_toFun.comp f.continuous_toFun⟩
    associativityHolds := λ X Y Z W f g h => rfl
    unitLeft := λ X Y f => rfl
    unitRight := λ X Y f => rfl
  }

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse