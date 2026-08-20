-- Active: 1786989654109@@localhost@5434@LaRemise
CREATE TYPE type_depot AS ENUM ('boutique', 'domicile');
CREATE TYPE categorie AS ENUM ('mobilier', 'electromenager', 'livres', 'vaisselle', 'textile', 'jouets', 'bricolage');
CREATE TYPE etat_article AS ENUM ('bon état', 'à réparer', 'hors service');
CREATE TYPE statut AS ENUM ('reparation', 'rayon', 'recyclage');
CREATE TYPE resultat AS ENUM ('reussie', 'echouee');
CREATE TYPE nom_competence AS ENUM ('couture', 'electricite', 'menuiserie', 'informatique', 'vente', 'velo');

ALTER TYPE statut RENAME TO statut_article;
ALTER TYPE nom_competence RENAME TO competence_enum;
ALTER TYPE statut_article ADD VALUE 'arrive';
ALTER TYPE statut_article ADD VALUE 'vendu';

ALTER TABLE competence
ALTER COLUMN nom_competence
TYPE competence_enum
USING nom_competence::competence_enum;

CREATE TABLE donateur (
  id_donateur SERIAL PRIMARY KEY,
  nom_donateur VARCHAR(50) NOT NULL,
  prenom_donateur VARCHAR(50) NOT NULL,
  telephone TEXT NOT NULL,
  statut_adhesion BOOLEAN
);
CREATE TABLE adherent (
  id_adherent SERIAL PRIMARY KEY,
  nom_adherent VARCHAR(50) NOT NULL,
  prenom_adherent VARCHAR(50) NOT NULL,
  date_affiliation DATE NOT NULL
);
CREATE TABLE benevole (
  id_benevole SERIAL PRIMARY KEY,
  nom_benevole VARCHAR(50) NOT NULL,
  prenom_benevole VARCHAR(50) NOT NULL,
  date_affiliation DATE NOT NULL
);
CREATE TABLE competence (
  id_competence SERIAL PRIMARY KEY,
  nom_competence VARCHAR(50) NOT NULL
);
CREATE TABLE depot (
  id_depot SERIAL PRIMARY KEY,
  id_donateur INTEGER NOT NULL,
  type_depot type_depot NOT NULL,
  date_depot DATE NOT NULL,
  FOREIGN KEY (id_donateur) REFERENCES donateur(id_donateur)
);
CREATE TABLE vente (
  id_vente SERIAL PRIMARY KEY,
  date_vente DATE NOT NULL,
  mode_paiement VARCHAR(15) NOT NULL,
  id_adherent INTEGER NOT NULL,
  FOREIGN KEY (id_adherent) REFERENCES adherent(id_adherent)
);
CREATE TABLE ateliers (
  id_atelier SERIAL PRIMARY KEY,
  nom_atelier VARCHAR(120) NOT NULL,
  date_atelier DATE NOT NULL,
  duree_atelier NUMERIC NOT NULL,
  nb_places NUMERIC NOT NULL,
  id_benevole INTEGER NOT NULL,
  FOREIGN KEY (id_benevole) REFERENCES benevole(id_benevole)
);
CREATE TABLE benevole_competence (
  id_benevole INTEGER NOT NULL,
  id_competence INTEGER NOT NULL,
  PRIMARY KEY (id_benevole, id_competence),
  FOREIGN KEY (id_benevole) REFERENCES benevole(id_benevole),
  FOREIGN KEY (id_competence) REFERENCES competence(id_competence)
);
CREATE TABLE article (
  id_article SERIAL PRIMARY KEY,
  nom_article VARCHAR(150) NOT NULL,
  categorie categorie NOT NULL,
  etat_article etat_article NOT NULL,
  statut statut_article NOT NULL,
  poids_article INTEGER NOT NULL,
  prix_article INTEGER,
  id_depot INTEGER NOT NULL,
  id_vente INTEGER,
  FOREIGN KEY (id_depot) REFERENCES depot(id_depot),
  FOREIGN KEY (id_vente) REFERENCES vente(id_vente)
);
CREATE TABLE inscription (
  id_inscription SERIAL PRIMARY KEY,
  date_inscription DATE NOT NULL,
  presence BOOLEAN,
  id_atelier INTEGER NOT NULL,
  id_adherent INTEGER NOT NULL,
  FOREIGN KEY (id_atelier) REFERENCES ateliers(id_atelier),
  FOREIGN KEY (id_adherent) REFERENCES adherent(id_adherent)
);
CREATE TABLE reparation (
  id_reparation SERIAL PRIMARY KEY,
  date_entree DATE NOT NULL,
  date_sortie DATE,
  resultat resultat NOT NULL,
  recyclage BOOLEAN,
  id_article INTEGER NOT NULL,
  id_benevole INTEGER NOT NULL,
  FOREIGN KEY (id_article) REFERENCES article(id_article),
  FOREIGN KEY (id_benevole) REFERENCES benevole(id_benevole)
);