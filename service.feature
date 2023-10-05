# language: fr
Fonctionnalité:
  En tant qu'arbitre
  Je souhaite observer un service
  Afin d'évaluer sa conformité aux règles du Ping-Pong

  Règle: La position initiale de la main est ouverte, paume vers le haut et au-dessus de la table
    Plan du Scénario: Position initiale de la main
      Etant donné que la main est <statut de la main>, paume <sens de la paume> et <position relative a la table>
      Quand la validité de la position initiale est évaluée
      Alors la position initiale est <statut>

      Exemples:
        | statut de la main | sens de la paume | position relative a la table | statut   |
        | fermé             | vers le haut     | au dessus                    | invalide |
        | ouverte           | vers le bas      | au dessus                    | invalide |
        | ouverte           | vers le haut     | en dessous                   | invalide |
        | ouverte           | vers le haut     | au dessous                   | valide   |


  Règle: La balle doit rebondir du coté de celui qui sert puis dans le camp adverse
    Plan du Scénario: Coté des deux rebonds de la balle
      Etant donné que le premier rebond de la balle s'effectue du coté <coté du premier rebond>
      Et que le second rebond de la balle s'effectue du coté <coté du second rebond>
      Quand le validité des rebonds est évaluée
      Alors les rebonds de la balle sont <statut>

      Exemples:
        | coté du premier rebond | coté du second rebond | statut    |
        | coté du serveur        | coté du serveur       | invalides |
        | coté du receveur       | coté du receveur      | invalides |
        | coté du receveur       | coté du serveur       | invalides |
        | coté du serveur        | coté du receveur      | valides   |

    Scénario: Un seul rebond de la balle
      Etant donné que la balle n'effectue qu'un seul rebond
      Quand le validité des rebonds est évalué
      Alors les rebonds de la balle sont invalides

  Règle: La balle doit être lancé à au moins 16cm au dessus de la table
    Plan du Scénario: Hauteur du lancé de la balle
      Etant donné la balle est lancé à <hauteur du lancé> au dessus de la table
      Quand la balle est frappé
      Alors le lancé est <statut>

      Exemples:
        | hauteur du lancé | statut   |
        | 10cm             | invalide |
        | -3cm             | invalide |
        | 20m              | valide   |
        | 16cm             | valide   |
        | 20cm             | valide   |

    Scénario: La balle n'est pas lancé
      Etant donné la balle n'est pas lancé
      Quand la balle est frappé
      Alors le lancé est invalide

  Règle: Le balle doit être frappé lors de la descente
    Plan du Scénario: Moment de la frappe de la balle
      Etant donné la balle est en <sens de la balle>
      Quand la balle est frappé
      Alors la frappe est <statut>

      Exemples:
        | sens de la balle | statut   |
        | monté            | invalide |
        | descente         | valide   |

  Règle: Si la balle touche le filet pendant le service, ce dernier est "let" et doit être rejoué
    Etant donné que le service est en cours
      Quand la balle touche le filet
      Alors le service est "let" et doit être rejoué
