

-- Quelle catégorie se vend le mieux ? Laquelle rapporte le plus ?
SELECT 
    categorie,
    COUNT(*) AS ventes
FROM article
WHERE id_vente IS NOT NULL
GROUP BY categorie
ORDER BY ventes DESC;
SELECT 
    categorie,
    SUM(prix_article) AS chiffre
FROM article
WHERE id_vente IS NOT NULL
GROUP BY categorie
ORDER BY chiffre DESC;

-- Combien d'heures de bénévolat ont été consacrées à la réparation cette année ?
SELECT 
    SUM((date_sortie - date_entree) * 24) AS heures
FROM reparation
WHERE date_entree BETWEEN '2024-01-01' AND '2024-12-31';



-- Quel poids total avons-nous détourné de la déchetterie (tout ce qui n'est pas recyclé) ?
SELECT 
    ROUND(SUM(poids_article)) / 1000.0 AS poids_kg
FROM article
WHERE id_article NOT IN (
    SELECT id_article FROM reparation WHERE recyclage = true
);

-- Quels bénévoles ont la compétence « électricité »
SELECT 
    benevole.nom_benevole,
    benevole.prenom_benevole
FROM benevole
JOIN benevole_competence ON benevole.id_benevole = benevole_competence.id_benevole
JOIN competence ON benevole_competence.id_competence = competence.id_competence
WHERE competence.nom_competence = 'electricite';