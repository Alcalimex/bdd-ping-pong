#language: fr

Fonctionnalité:
  En tant qu'arbitre
  Je souhaite évaluer la validité d'un service
  Afin de laisser continuer un échange

  Type de lancer : Présence ou non d'un effet

  Règle: La balle doit être lancée à minimum 16cm de hauteur

    Plan du Scénario: Validité de la hauteur du lancer
      Etant donné que le serveur lance la balle
      Et donné que le lancer atteint <hauteur du lancer>cm de hauteur
      Lorsque la balle redescend
      Alors la lancer a une hauteur <statut>

      Exemples:
        | hauteur du lancer | statut   |
        | 7                 | invalide |
        | 15                | invalide |
        | 16                | valide   |
        | 33                | valide   |

  Règle: La balle doit être lancée sans effet

    Scénario: Si la balle est lancée avec un effet, le type de lancer est invalide
      Etant donné que la balle a un effet
      Lorsque la balle redescend
      Alors le type de lancer est invalide

    Scénario:
      Etant donné que la balle n'a pas d'effet
      Lorsque la balle redescend
      Alors la type de lancer est valide

  Règle: La balle doit être lancée de manière verticale

    Scénario: Si la balle n'est pas lancée verticalement, la direction du lancer est invalide
      Etant donné que le lancer n'est pas vertical
      Lorsque la balle redescend
      Alors la direction du lancer est invalide

    Scénario: Si la balle est lancée verticalement, la direction du lancer est valide
      Etant donné que le lancer est vertical
      Lorsque la balle redescend
      Alors la direction du lancer est valide

  Règle: Si la direction, le type et la hauteur du lancer sont valides, alors le lancer est valide

    Scénario: Type de lancer invalide
      Etant donné que le type de lancer est invalide
      Lorsque la balle redescend
      Alors le lancer est invalide

    Scénario: Direction du lancer invalide
      Etant donné que la direction est invalide
      Lorsque la balle redescend
      Alors le lancer est invalide

    Scénario: Hauteur du lancer invalide
      Etant donné que la hauteur du lancer est invalide
      Lorsque la balle redescend
      Alors le lancer est invalide

    Scénario: Lancer valide
      Etant donné que la direction est valide
      Et que le type de lancer est valide
      Et que la hauteur du lancer est valide
      Lorsque la balle redescend
      Alors le lancer est valide

  Règle: La balle doit être frappée lors de la descente

    Scénario: Si la balle n'est pas frappée, la frappe est invalide
      Etant donné que la balle n'est pas frappée
      Lorsque la balle n'est plus en l'air
      Alors la frappe est invalide

    Scénario: Si la frappe est lors de la montée, la frappe est invalide
      Etant donné que la balle est en phase ascendante
      Lorsque la balle est frappée
      Alors la frappe est invalide

    Scénario: Si la frappe est lors de la descente, la frappe est valide
      Etant donné que la balle est en phase descendante
      Lorsque la balle est frappée
      Alors la frappe est valide
