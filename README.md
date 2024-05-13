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

## How to generate an image

You can also directly create an image with the provided Dockerfile  
To do it, you can simply launch this command:

```bash
docker build -t gh-actions .
```

To create a new container with the good REPO name and with a token (previously generated).  
You can use this command:

```bash
docker run [-d] -e REPO='<github-user/repo-name>' -e TOKEN='<token>' --name container-name gh-actions
```

## How to generate an API token

See the [following link](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#keeping-your-personal-access-tokens-secure)