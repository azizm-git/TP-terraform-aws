# Étape 1 : aucune ressource créée.
# Seule une data source interroge AWS pour valider l'authentification.

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}