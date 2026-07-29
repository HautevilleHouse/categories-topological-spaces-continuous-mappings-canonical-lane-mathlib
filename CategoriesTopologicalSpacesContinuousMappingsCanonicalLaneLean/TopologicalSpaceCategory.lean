import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure TopologicalSpaceCategory where
  obj : Type u
  hom : obj → obj → Type v
  identity : (X : obj) → hom X X
  compose : {X Y Z : obj} → hom X Y → hom Y Z → hom X Z
  identityLeft : ∀ {X Y : obj} (f : hom X Y), compose (identity X) f = f
  identityRight : ∀ {X Y : obj} (f : hom X Y), compose f (identity Y) = f
  associativity : ∀ {W X Y Z : obj} (f : hom W X) (g : hom X Y) (h : hom Y Z), compose (compose f g) h = compose f (compose g h)

def TopologicalSpaceCategoryClosed (C : TopologicalSpaceCategory) : Prop :=
  ∀ (X Y : C.obj), True

end HautevilleHouse
end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean