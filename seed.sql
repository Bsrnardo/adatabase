INSERT INTO competence (nom_competence) 
VALUES 
  ('couture'),
  ('electricite'),
  ('menuiserie'),
  ('informatique'),
  ('vente'),
  ('velo');


COPY donateur (nom_donateur, prenom_donateur, telephone, statut_adhesion)
FROM '/tmp/csv/donateur.csv'
DELIMITER ','
CSV HEADER;

COPY adherent (nom_adherent, prenom_adherent, date_affiliation)
FROM '/tmp/csv/adherent.csv'
DELIMITER ','
CSV HEADER;

COPY benevole (nom_benevole, prenom_benevole, date_affiliation)
FROM '/tmp/csv/benevole.csv'
DELIMITER ','
CSV HEADER;

COPY depot (id_donateur, type_depot, date_depot)
FROM '/tmp/csv/depot.csv'
DELIMITER ','
CSV HEADER;

COPY vente (date_vente, mode_paiement, id_adherent)
FROM '/tmp/csv/vente.csv'
DELIMITER ','
CSV HEADER;

COPY ateliers (nom_atelier, date_atelier, duree_atelier, nb_places, id_benevole)
FROM '/tmp/csv/ateliers.csv'
DELIMITER ','
CSV HEADER;

COPY benevole_competence (id_benevole, id_competence)
FROM '/tmp/csv/benevole_competence.csv'
DELIMITER ','
CSV HEADER;

COPY article (nom_article, categorie, etat_article, statut, poids_article, prix_article, id_depot, id_vente)
FROM '/tmp/csv/article.csv'
DELIMITER ','
CSV HEADER;

COPY inscription (date_inscription, presence, id_atelier, id_adherent)
FROM '/tmp/csv/inscription.csv'
DELIMITER ','
CSV HEADER;

COPY reparation (date_entree, date_sortie, resultat, recyclage, id_article, id_benevole)
FROM '/tmp/csv/reparation.csv'
DELIMITER ','
CSV HEADER;