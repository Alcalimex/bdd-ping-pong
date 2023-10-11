#language: fr
Fonctionnalité: Arbitrage d'un service au tennis de table
  En tant qu'arbitre
  Je souhaite vérifier l'état des services / arbitrer les services
  Afin de savoir si les services sont valables

  Règle:
  - La ligne de fond correspond à la ligne en bout de table
  - Un service correspond à un positionnement correcte du corps et de la main du serveur, un lancer correcte et 1 rebond dans chaque camp sans aucune intervention de l'adverse

    Règle: Le corps du serveur doit se trouver derrière la ligne de fond
    Scénario: Bon positionnement du corps du serveur
      Etant donné que le serveur est derrière la ligne de fond
      Quand le serveur se prépare à servir
      Alors la position du corps du serveur est correcte

    Scénario: Mauvais positionnement du corps du serveur
      Etant donné que le serveur se trouve devant la ligne de fond
      Quand le serveur se prépare à servir
      Alors la position du corps du serveur est incorrecte

  Règle:
  - La main du serveur doit être derrière la ligne de fond
  - La main du serveur doit être apparente avant le lancer de la balle
    Scénario: Le serveur sert avec la main au-dessus de la table
      Etant donné que le serveur est derrière la ligne de fond
      Et que la main du serveur est devant la ligne de fond
      Quand le serveur se prépare à servir
      Alors la position de la main du serveur est incorrecte

    Scénario: La main du serveur se trouve sous la table
      Etant donné que le serveur est derrière la ligne de fond
      Et que sa paume de main se trouve en-dessous de la table
      Quand le serveur se prépare à servir
      Alors la position de la main du serveur est incorrecte

    Scénario: Position de la main correct avant le lancer la balle
      Etant donné que la main du serveur est derrière la ligne de fond
      Et que la main du serveur est apparente pour l'arbitre et le receveur
      Quand le serveur se prépare à servir
      Alors la position de la main du serveur est correcte

  Règle: La balle doit être à minimum 16cm de la table

    Plan du scénario: Balle à 16cm minimum
      Etant donné la balle a été lancée verticalement
      Et que la balle est à <Hauteur> de la table
      Quand la balle est tapé avec raquette
      Alors le lancer de la balle est correcte

      Exemples:
        | Hauteur |
        | 16cm    |
        | 17cm    |
        | 18cm    |

    Scénario: Balle à 15.99cm
      Etant donné la balle a été lancée verticalement
      Et que la balle est à 15.99cm de la table
      Quand la balle est tapé avec raquette
      Alors le lancer de la balle est incorrecte

    Scénario: Taper la balle avec autre chose que la raquette
      Etant donné la balle a été lancée verticalement
      Et que la balle est à minimum 16cm de la table
      Quand la balle est tapé avec autre chose qu'une raquette
      Alors le lancer de la balle est incorrecte

  Règle: La balle doit rebondir dans le camp du serveur au 1er rebond

    Scénario: 1er rebond de la balle ne se passe pas du côté du serveur
      Etant donné que le lancer de la balle est correcte
      Quand le 1er rebond de la balle ne se passe pas du côté du serveur
      Alors le service est incorrecte

    Scénario: 1er rebond du côté du serveur
      Etant donné que le lancer de la balle est correcte
      Quand le 1er rebond de la balle se passe du côté du serveur
      Alors le service est correcte

  Règle: L'adverse intervient avant la fin du service alors le service est correct

    Scénario: L'adverse touche la balle avant le 1er rebond
      Etant donné le lancer de la balle est correcte
      Quand l'adverse touche la balle avant que la balle rebondisse
      Alors le service est correcte

    Scénario: L'adverse touche la balle avant le 2eme rebond
      Etant donné le lancer de la balle est correcte
      Et que la balle a rebondit une 1ere fois dans le camp du serveur
      Quand l'adverse touche la balle avant que la balle ne rebondisse une 2eme fois
      Alors le service est correcte
