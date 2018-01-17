## Le projet est articulé avec les serveurs suivants : 

- Glassfish 	: 	Web Service REST
- MySQL 		:	Base de données
- JSP			:	Serveur web

Environnement de dev : 
- Netbeans 8.2 (JDK 8)
- WAMP Server 3.1.0 64bit (MySQL 5.7.19)


Attention : le serveur Glassfish doit être modifié pour générer des ressources JSON, (note : le XML est utilisé par défaut) il semblerait qu'il y ait un BUG dans une librairie 
(cf : https://stackoverflow.com/questions/33722764/glassfish-error-when-producing-json )
Lorsque le .jar "org.eclipse.persistence.moxy.jar" est remplacé, la génération de ressources en JSON est fonctionnelle.

Les serveurs MySQL et JSP n'ont rien de spécifique.

## Flow

Le but de la solution est de consommer le Service REST en javascript (jQuery.ajax); le service REST générant des ressources JSON représentant l'état de la base de données.
Le serveur JSP n'est utilisé que pour héberger les pages web et code javascript; on n'accède pas à la base de données en Java.

Une fois les serveurs en place, la solution sera développée exclusivement en html + js 
(ce choix a été déterminé d'après les compétences initiales des différents membres du groupe)
