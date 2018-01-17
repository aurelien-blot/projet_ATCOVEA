INSERT INTO `acheteur` (`nom_acheteur`, `prenom_acheteur`,`mail_acheteur`) VALUES
('Do', 'John','DoJohn@gmail.com'),('Wayne', 'John','WayneJohn@gmail.com'),('Rambo', 'John','RamboJohn@gmail.com'),('Rio', 'Bravo','RioBravo@gmail.com'),('Rale','Alain','RaleAlain@gmail.com');

INSERT INTO `interet` (`libelle_interet`) VALUES
('important'),('très important'),('stratégique');

INSERT INTO `groupe_droit` (`nom_groupe_droit`) VALUES
('Admin'),('CollaborateurA'),('CollaborateurB');

INSERT INTO `droit` (`nom_droit`) VALUES
('Supprimer'),('Editer'),('Ajouter');

INSERT INTO `tables` (`nom_tables`) VALUES
('demande'),('reponse'),('developpeur');

INSERT INTO `attribution_droit` (`id_droit`,`id_groupe_droit`,`id_nom_table`) VALUES
(1,1,1),(1,2,3),(3,3,3);

INSERT INTO `user` (`identifiant_user`,`password_user`,`token_user`, `id_attribution `) VALUES
('administrateur', 'password','12465dfdsdf',1),('user1', 'password1','2165qsezfds',2),('user2', 'password2','qsdqs5646qsfq',3);

INSERT INTO `statut` (`libelle_statut`) VALUES
('repondu'),('traitement'),('gagne'),('perdu');

INSERT INTO `interlocuteur_technique` (`nom_interloc_technique`, `prenom_interloc_technique`, `mail_interloc_technique`, `tel_interloc_technique`) VALUES
('Lannier', 'robert','lannier@gmail.com', '0243567844'),('breton', 'laurent', 'breton@hgmail.com', '0244665588'),
('graton', 'jean', 'graton@hgmail.com', '0244665588'),('bijoux', 'gerard', 'bijoux@hgmail.com', '0244665588'),('roti', 'paul', 'roti@hgmail.com', '0244555588');

INSERT INTO `interlocuteur_technique_cgi` (`nom_interloc_technique_cgi`, `prenom_interloc_technique_cgi`, `mail_interloc_technique_cgi`, `tel_interloc_technique_cgi`) VALUES
('Lannier', 'robert','lannier@gmail.com', '0243567844'),('breton', 'laurent', 'breton@hgmail.com', '0244665588'),
('graton', 'jean', 'graton@hgmail.com', '0244665588'),('bijoux', 'gerard', 'bijoux@hgmail.com', '0244665588'),('roti', 'paul', 'roti@hgmail.com', '0244555588');

INSERT INTO `developpeur` (`nom_developpeur`, `prenom_developpeur`, `competences_developpeur`, `mail_developpeur`, `cv`) VALUES
('LEROY', 'Stéphane', 'HTML\r\nJS\r\nCSS', 'stephane@leroy.fr'),('GROS', 'Jean', 'JS', 'jean@gros.fr'),
('BROUTE', 'Jean', 'JS', 'jean@broute.fr'),('SATONS', 'louise', 'Java', 'louise@satons.fr'),('LONS', 'MARIE', 'Java', 'marie@lons.fr');

INSERT INTO `demande` (`code_affaire_demande`,`intitule_demande`, `libelle_demande`, `date_debut_demande`, `date_fin_demande`, `contexte_demande`, `details_prestation_demande`, `zone_geographique`, `id_interloc_technique`, `id_statut`,`id_interet`, `id_acheteur`) VALUES
('123ABC', 'Modification de la fonction 1',`AT-5164-458A-Test`, '2017-11-22', '2017-11-30', 'contexte 1', 'détails demande 1', 'Le Mans', 2, 1, 1, 1),
('GEL426', 'demande 2',`AB-5964-168B-Test`, '2017-11-23', '2017-11-28', 'contexte demande 2', 'détails 2', 'Nantes', 2, 2, 2, 3),
('4FFZLD456', 'Libellé demande 3',`IT-165983-45F-Test`, '2017-11-25', '2017-11-28', 'contexte demande', 'détails prestation demande','Rennes', 1, 1, 2, 1),
('5T886', 'Libellé demande 4',`KL-831-45869J-Test`, '2017-11-28', '2017-12-03', 'contexte demande', 'détails prestation demande','Orleans', 2, 2, 3, 2),
('5ZLD886', 'Libellé demande 5',`AA-23659-45698PM-Test`, '2017-11-18', '2017-12-13', 'contexte demande5', 'détails prestation demande','Orleans', 3, 3, 2, 4);

INSERT INTO `reponse` (`sous_traitant_reponse`, `nb_jours`, `taux_journalier`, `date_debut`, `date_fin`, `id_demande`,`id_interloc_technique_cgi`,`id_developpeur`,`id_type_profil`) VALUES
(0, 12, 200, '2017-11-26', '2017-11-30', 1,1,1,1),(1, 8, 150, '2017-11-22', '2017-11-30', 2,2,2,2),
(0, 2, 250, '2017-11-26', '2017-11-28', 3,1,2,3),(0, 6, 250, '2017-11-28', '2017-12-01', 4,1,2,3),(0, 12, 250, '2017-11-13', '2017-12-11',5,2,3,3);

INSERT INTO `retenir` (`id_reponse`, `id_developpeur`) VALUES
(1, 1),(2, 1),(3, 2),(4, 3),(5,3);

INSERT INTO `type_profil` ( `nom_type_profil`) VALUES
(metier),(debutant),(senior),(technique);


