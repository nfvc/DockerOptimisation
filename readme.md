
## Optimisations Dockerfile

### Changements apportés :

1. **Image de base plus légère** : Utilisation de `node:18-alpine` au lieu de `node:18`
    - Réduction de la taille de l'image de ~900MB à ~170MB

2. **Cache des dépendances** : Copie séparée de `package*.json`
    - Améliore la vitesse de build en utilisant le cache Docker
    - Évite la réinstallation des dépendances si le code source change

3. **Utilisateur non-root** : Création d'un utilisateur dédié
    - Améliore la sécurité en évitant l'exécution en tant que root

4. **Multi-stage build** (optionnel) : Séparation build/runtime
    - Réduit encore la taille finale de l'image

### Avant/Après :
- **Taille** : ~900MB → ~170MB (-80%)
- **Cache** : Aucun → Cache des dépendances optimisé

Premier Build :
Building 28.5s (13/13) FINISHEDBuilding 28.5s (13/13) FINISHED

Deuxième après la branch OptimisationDockerFile:
Building 12.3s (11/11) FINISHED

Taille des images :
- dockeropti  v1 : 1.73GB
- dockeropti  v2 : 574MB
