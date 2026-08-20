-- 01 Combien d'objets avons-nous reçus le mois dernier, et quel poids total ?
SELECT 
    COUNT(a.id_article) AS nombre_articles,
    ROUND(SUM(a.poids_article)) / 1000.0 AS poids_total_kg
FROM article a
INNER JOIN depot d ON a.id_depot = d.id_depot
WHERE d.date_depot BETWEEN '2024-02-01' AND '2024-02-29';

-- 02 Quels objets sont actuellement en rayon, et depuis combien de temps ?
SELECT
    nom_article,
    statut,
    (CURRENT_DATE - d.date_depot) AS temps_rayon_jours
FROM
    article a
JOIN depot d ON a.id_depot = d.id_depot
WHERE
    statut = 'rayon';

-- 03 Quelle catégorie se vend le mieux ? Laquelle rapporte le plus ?
SELECT 
    categorie,
    COUNT(*) AS ventes
FROM article
WHERE id_vente IS NOT NULL
GROUP BY categorie
ORDER BY ventes DESC;

-- 03 Laquelle rapporte le plus ?
SELECT 
    categorie,
    SUM(prix_article) AS chiffre
FROM article
WHERE id_vente IS NOT NULL
GROUP BY categorie
ORDER BY chiffre DESC;

-- 04 Combien d'heures de bénévolat ont été consacrées à la réparation cette année ?
SELECT 
    SUM((date_sortie - date_entree) * 8) AS heures
FROM reparation
WHERE date_entree BETWEEN '2024-01-01' AND '2024-12-31';

-- 07 Quel poids total avons-nous détourné de la déchetterie (tout ce qui n'est pas recyclé) ?
SELECT 
    ROUND(SUM(poids_article)) / 1000.0 AS poids_kg
FROM article
WHERE id_article NOT IN (
    SELECT id_article FROM reparation WHERE recyclage = true
);

-- 09 Quels bénévoles ont la compétence « électricité »
SELECT 
    benevole.nom_benevole,
    benevole.prenom_benevole
FROM benevole
JOIN benevole_competence ON benevole.id_benevole = benevole_competence.id_benevole
JOIN competence ON benevole_competence.id_competence = competence.id_competence
WHERE competence.nom_competence = 'electricite';

-- 05 Quel est le taux de réussite des réparations, par bénévole
SELECT
    b.nom_benevole,
    b.prenom_benevole,
    COUNT(*) AS total_reparations,
    SUM(CASE WHEN r.resultat = 'reussie' THEN 1 ELSE 0 END) AS reussies,
    SUM(CASE WHEN r.resultat = 'echouee' THEN 1 ELSE 0 END) AS echouees,
    ROUND(
        SUM(CASE WHEN r.resultat = 'reussie' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)
    ) AS taux_reussite
FROM reparation r
JOIN benevole b ON r.id_benevole = b.id_benevole
GROUP BY b.id_benevole, b.nom_benevole, b.prenom_benevole
ORDER BY total_reparations DESC;

-- Quels objets sont en rayon depuis plus de six mois et devraient être sortis ?
SELECT
    nom_article,
    statut,
    (CURRENT_DATE - d.date_depot) AS article_en_rayon
FROM
    article a
JOIN depot d ON a.id_depot = d.id_depot
WHERE
    statut = 'rayon';