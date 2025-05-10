# nginx_config
These are the nginx config files for the websites I run.

The primary source for this repo is in Bitbucket.
I added Github as a backup.
```
git remote add github git@github.com:timbrownlondon/nginx_config.git
```
Then periodically the GitHub repo is synced manually.
```
git push --mirror github
```
After creating a README.md through GitHub's web interface I did the following to sync to my local checkout and to Bitbucket.
```
git fetch github
git merge github/master
git push origin
```
