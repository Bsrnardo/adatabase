| NOM               | DESCRIPTION             | TYPE      | TAILLE | CONTRAINTE        | REMARQUES                        |
|-------------------|-------------------------|-----------|--------|-------------------|----------------------------------|
| id_donateur       | id du donateur          | Serial    |        | PK, Automatique   |                                  |
| nom_donateur      | nom du donateur         | Texte     | 50     | Obligatoire       |                                  |
| prenom_donateur   | prenom du donateur      | Texte     | 50     | Obligatoire       |                                  |
| telephone         | telephone du donateur   | Texte     | 20     | Obligatoire       |                                  |
| statut_adhesion   | statut d'adhesion       | Boolean   |        |                   |                                  |
| id_depot          | id du depot             | Serial    |        | PK, Automatique   |                                  |
| type_depot        | type du depot           | Texte     | 20     | Obligatoire       | Boutique, Domicile               |
| date_depot        | date du depot           | Date      |        | Obligatoire       |                                  |
| id_article        | id d l'article          | Serial    |        | PK, Automatique   |                                  |
| nom_article       | nom d l'article         | Texte     | 150    | Obligatoire       |                                  |
| categorie         | categorie               | Texte     | 50     | Obligatoire       | mobilier, électroménager, livres, vaisselle, textile, jouets, bricolage |
| etat_article      | etat d l'article        | Texte     | 45     | Obligatoire       | bon état, à réparer, hors service |
| statut            | statut de l'article     | Texte     | 20     | Obligatoire       | reparation, rayon, recyclage     |
| poids_article     | poids de l'article      | Integer   |        | Obligatoire       |                                  |
| prix_article      | prix de l'article       | Integer   |        | FK, Obligatoire   |                                  |
| id_reparation     | id de la reparation     | Serial    |        | PK, Automatique   |                                  |
| date_entree       | date entree article     | Date      |        | Obligatoire       |                                  |
| date_sortie       | date sortie article     | Date      |        | Obligatoire       |                                  |
| resultat          | resultat                | Texte     | 15     | Obligatoire       | reussie, echouee                 |
| recyclage         | recyclage               | Boolean   |        |                   |                                  |
| id_vente          | id de la vente          | Serial    |        | PK, Automatique   |                                  |
| date_vente        | date de la vente        | Date      |        | Obligatoire       |                                  |
| mode_paiement     | mode de paiement        | Texte     | 15     | Obligatoire       |                                  |
| id_adherent       | id de l'adherent        | Serial    |        | PK, Automatique   |                                  |
| nom_adherent      | nom de l'adherent       | Texte     | 50     | Obligatoire       |                                  |
| prenom_adherent   | prenom de l'adherent    | Texte     | 50     | Obligatoire       |                                  |
| date_affiliation  | date d'affiliation      | Date      |        | Obligatoire       |                                  |
| id_atelier        | id d l'atelier          | Serial    |        | PK, Automatique   |                                  |
| nom_atelier       | nom de l'atelier        | Texte     | 120    | Obligatoire       |                                  |
| date_atelier      | date de l'atelier       | Date      |        | Obligatoire       |                                  |
| duree_atelier     | duree de l'atelier      | Numerique |        | Obligatoire       |                                  |
| nb_places         | numero de places        | Numerique |        | Obligatoire       |                                  |
| id_competence     | id de la competence     | Serial    |        | PK, Automatique   |                                  |
| nom_competence    | nom de la competence    | Texte     | 50     | Obligatoire       | couture, électricité, menuiserie, informatique, vente, velo |
| id_benevole       | id du benevole          | Integer   |        | PK                |                                  |
| nom_benevole      | nom du benevole         | Texte     |        |                   |                                  |
| prenom_benevole   | prenom du benevole      | Texte     |        |                   |                                  |
| date_afiliation   | date d'afiliation       | Date      |        |                   |                                  |
| id_inscription    | id de l'inscription     | Serial    |        | PK, Automatique   |                                  |
| date_inscription  | date de l'inscription   | Date      |        | Obligatoire       |                                  |
| presence          | presence                | Boolean   |        |                   |       