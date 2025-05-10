# nginx_config
These are the config files for websites I run (and some old ones)'

The primary source for this repo is in Bitbucket.\
I am using GitHub as a back up.\
It was added as a remote using:\
`git remote add github git@github.com:timbrownlondon/nginx_config.git`\
Then periodically the GitHub repo is synced manually with:\
`git push --mirror github`

After creating README.md through GitHUB's web interface I did the following to sync local checkout and Bitbucket:\
```
git fetch github
git merge github/master
git push origin
```

