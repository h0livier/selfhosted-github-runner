# Github Action self-hosted runner

This project has for purpose to let you run a self-hosted github actions runner inside a container.  
It only requires 2 informations:  
- The repository name it has to listen for action
- An API github token to generate the runner token (usefull only on config)

Here is the .env file structure
```
REPO=<github-user/repo-name>
TOKEN=<github-api-token>
```

## How to generate an API token

See the [following link](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#keeping-your-personal-access-tokens-secure)