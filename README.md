# C_Clark_algo

## Première partie
Cette partie comporte trois sous-parties avec différents thèmes. Le passage d'un thème vers l'autre se fait via l'appui sur la touche correspondant à la première de son nom.
Les thèmes choisis sont les suivants :

### Cube (c)
Visualisation d'un cube en 3D composé de plusieurs petits cubes.
- Rotation continue autour des 3 axes : X, Y, Z
- Perspective modulable via mouvements du curseur sur l'axe X
- Aspect modulable par clic 

### Fireworks (f)
Simulation de feux d'artifice via un système simple de particules 
- Feux d'artifices de deux formes différentes (simple, cœur)
- Apparition des feux d'artifices selon une fréquence modulable via des sliders (fréquence globale et fréquence d'explosion en forme de cœur)

### Space Tour (s)
Simulation d'une découverte d'un astronaute dans l'espace en survolant une planète dans l'espace étoilé
- Couleur de la planète paramétrable via un ColorWheel 
- Astronaute mobile via les flèches du clavier



## Deuxième partie
### Implémentation de l'algorithme de Catmull-Clark
  
L'algorithme de subdivision de Catmull-Clark affine la géométrie des surfaces 3D en subdivisant itérativement les faces pour créer des surfaces plus lisses et détaillées.

Notre implémentation offre les options suivantes :

- Choix de la forme géométrique à traiter : cube (par défaut), pentagone ou une autre forme géométrique spécifique.
- Visualisation des modifications dans la géométrie après chaque subdivision avec une rotation continue autour de l'axe Y.
- Affichage des points de contrôle :
    - Points de face : rouge
    - Points de bord : vert
    - Points du barycentre : rose
- Agrandissement de la forme à l'aide d'un slider.
- Personnalisation de la couleur de remplissage via un sélecteur de couleur.
- Changement du mode d'affichage (surfaces / lignes).

## Références 
- Processing  https://processing.org/
- Algorithme Catmull-Clark https://en.wikipedia.org/wiki/Catmull%E2%80%93Clark_subdivision_surface
- Librairies nécessaires : 
	- ControlP5 https://www.sojamo.de/libraries/controlP5/
	- Peasycam https://mrfeinberg.com/peasycam/ 












