import CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean.InvariancePrinciples

/-!
# Duality Theorems: Pontryagin, Poincaré, Alexander
-/

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure PontryaginDualityPackage (G : Type u) [TopologicalSpace G] [Group G] where
  dualGroup : Group (ContinuousMap G Circle)
  bidualIsIsomorphic : IsTopologicalGroupIsomorphism G (dualGroup.dual)

structure PoincareDualityPackage (M : TopologicalSpaceObj) where
  orientedClosedManifold : Prop
  poincareDualityIso : M.cohomologyRing ≅ M.homologyRing

structure AlexanderDualityPackage (X A : TopologicalSpaceObj) (h : A ⊆ X.carrier) where
  alexanderDualityIso : X.cohomologyRing ≅ (X \ A).cohomologyRing

structure DualityEvidence (P : PontryaginDualityPackage) (Po : PoincareDualityPackage) (A : AlexanderDualityPackage) where
  pontryaginClosed : P.bidualIsIsomorphic
  poincareClosed : Po.poincareDualityIso.Bijective
  alexanderClosed : A.alexanderDualityIso.Bijective

def DualityClosed (P : PontryaginDualityPackage) (Po : PoincareDualityPackage) (A : AlexanderDualityPackage) : Prop :=
  P.bidualIsIsomorphic ∧ Po.poincareDualityIso.Bijective ∧ A.alexanderDualityIso.Bijective

theorem duality_closed_from_evidence (P : PontryaginDualityPackage) (Po : PoincareDualityPackage) (A : AlexanderDualityPackage) (E : DualityEvidence P Po A) :
    DualityClosed P Po A := by
  exact And.intro E.pontryaginClosed (And.intro E.poincareClosed E.alexanderClosed)

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse