import CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure TopologicalSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure TopologicalAdmittedObject where
  space : TopologicalSpace
  connected : Prop
  compact : Prop
  hausdorff : Prop
  continuousMapModel : Type
  continuousMapTopology : TopologicalSpace continuousMapModel
  homeomorphicToModel : Prop
  conclusion : homeomorphicToModel

structure TopologicalEndgameState where
  object : TopologicalAdmittedObject

def TopologicalWitnessClosed (O : TopologicalAdmittedObject) : Prop :=
  O.homeomorphicToModel

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse