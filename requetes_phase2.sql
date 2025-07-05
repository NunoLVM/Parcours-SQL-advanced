--1. Afficher les scores de chaque joueur pour la session 12, triés par score décroissant.
SELECT j.pseudo, s.score 
FROM scores AS s
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
SELECT j.pseudo, ROUND(AVG(s.score),0) AS moyenne
FROM joueurs AS j
JOIN scores AS s ON j.id = s.id_joueur
GROUP by j.id;

--6. Lister les joueurs ayant obtenu un score supérieur à 1400 au moins une fois, avec la date et le jeu.
SELECT j.pseudo, s.score, d.date_session, jeux.titre
FROM scores AS s
JOIN joueurs AS j ON s.id_joueur = j.id
JOIN sessions AS d ON s.id_session = d.id
JOIN jeux ON d.id_jeu = jeux.id
WHERE s.score > 1400;

--7. Afficher les membres de chaque équipe, avec le nom de l'équipe, le pseudo et le pays.
SELECT e.nom AS equipe, j.pseudo, j.pays
FROM membres_equipes AS me
JOIN equipes AS e ON me.id_equipe = e.id
JOIN joueurs AS j ON me.id_joueur = j.id
ORDER BY e.nom

--8. Afficher les jeux ayant eu plus de 3 sessions différentes.
SELECT jeux.titre, COUNT(s.id) AS total_sessions
FROM jeux
JOIN sessions AS s ON jeux.id = s.id_jeu
GROUP BY jeux.id
HAVING total_sessions > 3;

--9. Donner pour chaque session le jeu joué, la date et le nombre de joueurs présents.
SELECT jeux.titre, sd.date_session, COUNT(sc.id_joueur) AS joueurs_present
FROM sessions AS sd
JOIN jeux ON sd.id_jeu = jeux.id
LEFT JOIN scores AS sc ON sd.id = sc.id_session
GROUP BY sd.id;

--10. Afficher les scores moyens par jeu, triés du plus fort au plus faible.
SELECT jeux.titre, ROUND(AVG(sc.score),0) AS moyenne_score
FROM jeux
JOIN sessions AS sd ON jeux.id = sd.id_jeu
JOIN scores AS sc ON sd.id = sc.id_session
GROUP BY jeux.id
ORDER BY moyenne_score DESC;