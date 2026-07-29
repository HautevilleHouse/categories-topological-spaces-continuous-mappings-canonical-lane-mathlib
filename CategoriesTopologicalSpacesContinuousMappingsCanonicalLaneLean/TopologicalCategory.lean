import CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure TopologicalCategoryPackage where
  objects : Type u
  morphisms : objects → objects → Type v
  identity : (X : objects) → morphisms X X
  composition : {X Y Z : objects} → morphisms X Y → morphisms Y Z → morphisms X Z
  idLeft : ∀ {X Y : objects} (f : morphisms X Y), composition (identity X) f = f
  idRight : ∀ {X Y : objects} (f : morphisms X Y), composition f (identity Y) = f
  assoc : ∀ {W X Y Z : objects} (f : morphisms W X) (g : morphisms X Y) (h : morphisms Y Z),
    composition (composition f g) h = composition f (composition g h)

defaultTopologicalCategory : TopologicalCategoryPackage := {
  objects := Type u,
  morphisms := λ X Y => (X → Y),
  identity := λ X x => x,
  composition := λ f g x => g (f x),
  idLeft := λ f => by ext x; rfl,
  idRight := λ f => by ext x; rfl,
  assoc := λ f g h => by ext x; rfl
}

structure TopologicalCategoryEvidence (C : TopologicalCategoryPackage) where
  objectsClosed : Cat.isCategory C.objects C.morphisms
  identityClosed : Cat.isIdentity C.identity
  compositionClosed : Cat.isAssociative C.composition

def TopologicalCategoryClosed (C : TopologicalCategoryPackage) : Prop :=
  Cat.isCategory C.objects C.morphisms ∧ Cat.isIdentity C.identity ∧ Cat.isAssociative C.composition

theorem topological_category_closed_from_evidence (C : TopologicalCategoryPackage)
    (E : TopologicalCategoryEvidence C) : TopologicalCategoryClosed C := by
  exact And.intro E.objectsClosed (And.intro E.identityClosed E.compositionClosed)

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse