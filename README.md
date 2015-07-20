# Taxi Watch

Taxi Watch is the base for the taxi-watch website.

It is a web based application using *CakePHP* as base.

License: Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License, see file LICENSE.

## Git-Repository

The project uses *git* as means of version management.
It uses *github* for providing the git server.

The repository structure and working process is based on thoughts about a successful git branching model, described in http://nvie.com/posts/a-successful-git-branching-model/

This means, there are always these three branches:

1. `master` - contains released versions
2. `develop` - development branch, synchronizing the feature, release, and hotfix branches
3. `feature-work` - main branch in which I work/develop

Additionally the following branches may be created:

- `feature-*` - for writing a special feature
- `release-*` - releasing a new version, merging all features between `develop` and `master`
- `hotfix-*` - hotfixes for fast error correction

