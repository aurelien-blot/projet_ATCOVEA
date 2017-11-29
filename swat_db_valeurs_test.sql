INSERT INTO `acheteur` (`nom_acheteur`, `prenom_acheteur`) VALUES
('Do', 'John'),('Wayne', 'John'),('Rambo', 'John'),('Rio', 'Bravo'),('Rale','Alain');

INSERT INTO `interet` (`libelle_interet`) VALUES
('important'),('très important'),('stratégique');

INSERT INTO `groupe_droit` (`nom_groupe_droit`,`creer`, `editer`, `supprimer`, `repondre`, `consulter`) VALUES
('Admin', 1, 1, 1, 1, 1),('CollaborateurA', 0, 1, 1, 1, 1),('CollaborateurB', 0, 0, 0, 0, 1);

INSERT INTO `user` (`identifiant_user`,`password_user`, `id_droit`) VALUES
('administrateur', 'password',1),('user1', 'password1',2),('user2', 'password2',3);

INSERT INTO `statut` (`libelle_statut`) VALUES
('repondu'),('traitement'),('gagne'),('perdu');

INSERT INTO `interlocuteur_technique` (`nom_interloc_technique`, `prenom_interloc_technique`, `mail_interloc_technique`, `tel_interloc_technique`) VALUES
('Lannier', 'robert','lannier@gmail.com', '0243567844'),('breton', 'laurent', 'breton@hgmail.com', '0244665588'),
('graton', 'jean', 'graton@hgmail.com', '0244665588'),('bijoux', 'gerard', 'bijoux@hgmail.com', '0244665588'),('roti', 'paul', 'roti@hgmail.com', '0244555588');

INSERT INTO `developpeur` (`nom_developpeur`, `prenom_developpeur`, `competences_developpeur`, `cv`) VALUES
('LEROY', 'Stéphane', 'HTML\r\nJS\r\nCSS', 'http://www.google.fr'),('GROS', 'Jean', 'JS', 'http://www.elec-auto.com'),
('BROUTE', 'Jean', 'JS', 'http://www.elec-auto.com'),('SATONS', 'louise', 'Java', 'http://www.elec-auto.com'),('LONS', 'MARIE', 'Java', 'http://www.elec-auto.com');

INSERT INTO `demande` (`code_affaire_demande`, `libelle_demande`, `date_debut_demande`, `date_fin_demande`, `contexte_demande`, `details_prestation_demande`, `zone_geographique`, `id_interloc_technique`, `id_statut`,`id_interet`, `id_acheteur`) VALUES
('123ABC', 'Modification de la fonction 1', '2017-11-22', '2017-11-30', 'contexte 1', 'détails demande 1', 'Le Mans', 2, 1, 1, 1),
('GEL426', 'demande 2', '2017-11-23', '2017-11-28', 'contexte demande 2', 'détails 2', 'Nantes', 2, 2, 2, 3),
('4FFZLD456', 'Libellé demande 3', '2017-11-25', '2017-11-28', 'contexte demande', 'détails prestation demande','Rennes', 1, 1, 2, 1),
('5T886', 'Libellé demande 4', '2017-11-28', '2017-12-03', 'contexte demande', 'détails prestation demande','Orleans', 2, 2, 3, 2),
('5ZLD886', 'Libellé demande 5', '2017-11-18', '2017-12-13', 'contexte demande5', 'détails prestation demande','Orleans', 3, 3, 2, 4);

INSERT INTO `reponse` (`sous_traitant_reponse`, `nb_jours`, `taux_journalier`, `date_debut`, `date_fin`, `id_demande`) VALUES
(0, 12, 200, '2017-11-26', '2017-11-30', 1),(1, 8, 150, '2017-11-22', '2017-11-30', 2),
(0, 2, 250, '2017-11-26', '2017-11-28', 3),(0, 6, 250, '2017-11-28', '2017-12-01', 4),(0, 12, 250, '2017-11-13', '2017-12-11',5);

INSERT INTO `retenir` (`id_reponse`, `id_developpeur`) VALUES
(1, 1),(2, 1),(3, 2),(4, 3),(5,3);


