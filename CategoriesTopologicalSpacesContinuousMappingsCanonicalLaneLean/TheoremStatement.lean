import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  categoryConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
  deriving Repr

def sourceRepository : String :=
  "categories-topological-spaces-continuous-mappings-canonical-lane"

def sourceDescription : String :=
  "Categories Topological Spaces Continuous Mappings"

def sourceTheoremBoundary : String :=
  "Categories Topological Spaces Continuous Mappings"

def baselineCertificateLane : String :=
  "category_constrained"

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := sourceRepository,
    theoremName := sourceRepository,
    theoremObject := sourceDescription,
    classicalBoundary := sourceTheoremBoundary,
    categoryConstrainedStatement := "category-constrained theorem certificate internalized through admissible closure",
    certificateLane := baselineCertificateLane,
    carriedRemainder := "classical source boundary carried by the canonical lane bridge"
  }

theorem theorem_statement_source_key_checked :
    sourceTheoremStatement.sourceKey = sourceRepository := by
  rfl

theorem theorem_statement_certificate_lane_checked :
    sourceTheoremStatement.certificateLane = baselineCertificateLane := by
  rfl

end CategoriesTopologicalSpacesContinuousMappingsCanonicalLaneLean
end HautevilleHouse
