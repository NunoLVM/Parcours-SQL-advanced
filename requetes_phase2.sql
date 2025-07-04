--1. Afficher les scores de chaque joueur pour la session 12, triés par score décroissant.
SELECT j.pseudo, s.score 
FROM score AS s
JOIN joueurs AS j ON s.id_joueur = j.id
WHERE s.id_session = 12
ORDER BY s.score DESC;

--2. Afficher la liste des joueurs n'ayant jamais participé à une session.
SELECT j.pseudo
FROM joueurs AS j
LEFT JOIN scores AS s ON j.id = s.id_joueur
WHERE s.id_joueur IS NULL;

--3. Lister les titres des jeux avec leur genre.
SELECT jeux.titre, genres.nom AS genre
FROM jeux
JOIN genres ON jeux.id_genre = genres.id;

--4. Afficher pour chaque joueur le nombre total de sessions jouées.
SELECT j.pseudo, COUNT(s.id_session) AS total_sessions
FROM joueurs AS j
LEFT JOIN scores AS s ON j.id = s.id_joueur
GROUP BY j.id;

--5. Donner le score moyen obtenu par chaque joueur, avec leur pseudo.
SELECT j.pseudo, AVG(s.score) AS moyenne
FROM joueurs AS j
JOIN scores AS s ON j.id = s.id_joueur
GROUP by j.id;

