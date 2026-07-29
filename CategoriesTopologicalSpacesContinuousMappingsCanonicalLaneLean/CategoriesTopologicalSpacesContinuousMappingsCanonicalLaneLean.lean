import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure TopologicalSpaceObj where
  carrier : Type u
  topology : TopologicalSpace carrier

structure ContinuousMapObj (X Y : TopologicalSpaceObj) where
  toFun : X.carrier → Y.carrier
  continuous_toFun : Continuous toFun

structure CategoryTop where
  objects : Type u
  morphisms : TopologicalSpaceObj → TopologicalSpaceObj → Type v
  identity : (X : TopologicalSpaceObj) → morphisms X X
  compose : {X Y Z : TopologicalSpaceObj} → morphisms X Y → morphisms Y Z → morphisms X Z
  associativity : ∀ {X Y Z W : TopologicalSpaceObj} (f : morphisms X Y) (g : morphisms Y Z) (h : morphisms Z W), compose (compose f g) h = compose f (compose g h)
  identity_left : ∀ {X Y : TopologicalSpaceObj} (f : morphisms X Y), compose (identity X) f = f
  identity_right : ∀ {X Y : TopologicalSpaceObj} (f : morphisms X Y), compose f (identity Y) = f

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse