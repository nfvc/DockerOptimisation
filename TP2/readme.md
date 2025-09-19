# TP Optimisation Docker
### Optimisations Dockerfile

#### Repository github : https://github.com/nfvc/DockerOptimisation

## V1

### Modifications effectuées :

1. **Adoption d'une image de base optimisée** : Transition de `node:18` vers `node:18-alpine`
   - Diminution significative de la taille d'image de ~900MB à ~170MB

2. **Optimisation du cache des dépendances** : Copie isolée des fichiers `package*.json`
   - Accélération du processus de build grâce au système de cache Docker
   - Prévention de la réinstallation des dépendances lors des modifications du code source

3. **Implémentation d'un utilisateur dédié** : Mise en place d'un utilisateur non-root
   - Renforcement de la sécurité en évitant l'exécution avec les privilèges root

4. **Architecture multi-stage** : Distinction entre les phases de build et d'exécution
   - Réduction supplémentaire de la taille finale de l'image

### Comparaison avant/après :
- **Taille** (de Node.js): ~900MB → ~170MB (-80%)
- **Cache** : Absent → Cache des dépendances optimisé

Premier Build :
Building 28.5s (13/13) FINISHED

Deuxième après la branch OptimisationDockerFile:
Building 12.3s (11/11) FINISHED

Taille des images :
- dockeropti  v1 : 1.73GB
- dockeropti  v2 : 574MB


Taille des images :
- dockeropti  v1 : 1.73GB
- dockeropti  v2 : 574MB

## V2

### Changements apportés :

1. **Migration vers Node.js 22-alpine** : Passage de Node.js 18 à la version 22 LTS
   - Mise à jour vers la dernière version stable et supportée

2. **Suppression des dépendances de build** : Retrait de `build-base` et `ca-certificates`
   - Élimination des outils de compilation non nécessaires en production

3. **Optimisation de l'installation npm** : Utilisation de `npm ci --only=production`
   - Installation uniquement des dépendances de production
   - Processus d'installation plus rapide et déterministe

4. **Simplification de la structure** : Réduction du nombre de layers Docker
   - Suppression des optimisations de sécurité non prioritaires
   - Focus sur la réduction de taille uniquement

5. **Utilisation de l'utilisateur node natif** : Exploitation de l'utilisateur pré-configuré
   - Évite la création d'utilisateurs personnalisés

### Avant/Après :
- **Taille** : 574MB → 271MB 
- **Temps de build** : 12.3s → 5.6s

### Résultats V2 :
- **Temps de build** : 5.6s (11/11) FINISHED
- **Taille finale** : 271MB

## V3

### Changements apportés :

1. **Suppression de MongoDB** : Retrait de la dépendance `mongodb@6.19.0`
   - Élimination d'une dépendance non utilisée de 25-35MB
   - Simplification du package.json avec uniquement Express

### Avant/Après :
- **Taille** : 271MB → 254MB
- **Temps de build** : 5.6s → 5.4s

### Résultats V3 :
- **Temps de build** : 5.4s (11/11) FINISHED
- **Taille finale** : 254MB
- **Optimisation** : Suppression des dépendances non utilisées

### Package.json final optimisé :
```json
{
  "dependencies": {
    "express": "^4.21.2"