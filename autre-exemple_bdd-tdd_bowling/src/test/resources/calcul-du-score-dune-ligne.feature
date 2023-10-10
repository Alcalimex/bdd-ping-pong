#language: fr
Fonctionnalité: Calcul du score total d'une ligne terminée

  En tant que système de calcul de score au bowling
  Je souhaite calculer le score d'une ligne terminée
  Afin de déterminer le score final du joueur

  Un tir qui renverse des quilles sans être un strike ni un spare est appelé un tir classique

  Règle: Le score total d'une ligne sans strike ni spare est égal à la somme des quilles tombées

    Scénario: Aucune quille n'est tombée
      Étant donné la ligne terminée
        | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  |
        | - - | - - | - - | - - | - - | - - | - - | - - | - - | - - |
      Quand le score de la ligne est calculé
      Alors le score total est égal à 0


    Scénario: Une ligne terminée sans bonus
      Étant donné la ligne terminée
        | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  |
        | 3 4 | 5 3 | 2 7 | - - | - 8 | 1 - | 1 8 | 9 - | 2 5 | 6 1 |
      Quand le score de la ligne est calculé
      Alors le score total est égal à 65

  Règle: score d'un spare est 10 + nombre de quilles renversées au tir suivant

    Scénario: Un spare suivi d'une gouttière
      Étant donné la ligne terminée
        | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  |
        | - - | - - | 8 / | - - | - - | - - | - - | - - | - - | - - |
      Quand le score de la ligne est calculé
      Alors le score total est égal à 10

    Scénario: Un spare suivi d'un tir classique
      Étant donné la ligne terminée
        | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  |
        | - - | - - | 8 / | 3 - | - - | - - | - - | - - | - - | - - |
      Quand le score de la ligne est calculé
      Alors le score total est égal à 16

  Règle: score d'un strike est 10 + nombre de quilles renversées des 2 tirs suivants

    Scénario: la ligne contient un strike suivi de deux gouttières
      Étant donné la ligne terminée
        | 1   | 2   | 3 | 4   | 5   | 6   | 7   | 8   | 9   | 10  |
        | - - | - - | X | - - | - - | - - | - - | - - | - - | - - |
      Quand le score de la ligne est calculé
      Alors le score total est égal à 10

    Scénario: la ligne contient un strike suivi de deux tirs classiques
      Étant donné la ligne terminée
        | 1   | 2   | 3 | 4   | 5   | 6   | 7   | 8   | 9   | 10  |
        | - - | - - | X | 4 1 | - - | - - | - - | - - | - - | - - |
      Quand le score de la ligne est calculé
      Alors le score total est égal à 20

    Scénario: 2 strikes consécutifs suivi d'un tir classique
      Étant donné la ligne terminée
        | 1   | 2   | 3 | 4 | 5   | 6   | 7   | 8   | 9   | 10  |
        | - - | - - | X | X | 4 1 | - - | - - | - - | - - | - - |
      Quand le score de la ligne est calculé
      Alors le score total est égal à 44

    Scénario: 3 strikes consécutifs suivi de gouttières
      Étant donné la ligne terminée
        | 1   | 2   | 3 | 4 | 5 | 6   | 7   | 8   | 9   | 10  |
        | - - | - - | X | X | X | - - | - - | - - | - - | - - |
      Quand le score de la ligne est calculé
      Alors le score total est égal à 60

  Règle: sur la dernière frame un strike vaut exactement 10 points

    Scénario: 1 strike puis deux gouttières
      Étant donné la ligne terminée
        | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10    |
        | - - | - - | - - | - - | - - | - - | - - | - - | - - | X - - |
      Quand le score de la ligne est calculé
      Alors le score total est égal à 10

    Scénario: 2 strikes consécutifs suivi d'une gouttière
      Étant donné la ligne terminée
        | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10    |
        | - - | - - | - - | - - | - - | - - | - - | - - | - - | X X - |
      Quand le score de la ligne est calculé
      Alors le score total est égal à 20

    Scénario: 3 strikes consécutifs
      Étant donné la ligne terminée
        | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10    |
        | - - | - - | - - | - - | - - | - - | - - | - - | - - | X X X |
      Quand le score de la ligne est calculé
      Alors le score total est égal à 30

    Scénario: 4 strikes sur les deux dernières frames
      Étant donné la ligne terminée
        | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9 | 10    |
        | - - | - - | - - | - - | - - | - - | - - | - - | X | X X X |
      Quand le score de la ligne est calculé
      Alors le score total est égal à 60

  Règle: sur la dernière frame, un spare vaut exactement 10 points

    Scénario: un spare suivi d'une gouttière
      Étant donné la ligne terminée
        | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10    |
        | - - | - - | - - | - - | - - | - - | - - | - - | - - | 3 / - |
      Quand le score de la ligne est calculé
      Alors le score total est égal à 10

    Scénario: un spare suivi d'un strike
      Étant donné la ligne terminée
        | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10    |
        | - - | - - | - - | - - | - - | - - | - - | - - | - - | 3 / X |
      Quand le score de la ligne est calculé
      Alors le score total est égal à 20

  Règle: Le score maximal est de 300

    Scénario: full strike
      Étant donné la ligne terminée
        | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10    |
        | X | X | X | X | X | X | X | X | X | X X X |
      Quand le score de la ligne est calculé
      Alors le score total est égal à 300