# E2E test project server

## What is used ?

- playwright
- just
- docker
- typescript
- tailscale

## Install

### Playwright 

On your local machine, create a new project and launch `https://playwright.dev/docs/intro#installing-playwright`

```bash
yarn create playwright
```

for the **playwright.config.ts** we set the BASE_URL variable in .env.{env that we want}, so we can execute the test on dev and localhost environnement

### Docker 

On you local machine you need to have docker installed, same for the server
`https://docs.docker.com/engine/install/ubuntu/`

We are using **mcr.microsoft.com/playwright:v1.60.0-jammy** image from playwright for the browser stability

### Just 

Just is use to execute commands 

```bash
curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/bin
```

```bash
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

then you can launch 

```bash
just test-dev 
```

```bash
just test-local
```

### Tailscale

To handle the connection between the tests and local front we can use `https://tailscale.com/`, its a VPN that make us using the same network so we dont have to modify the BASE_URL for the server

On the local machine

MAC
```bash
brew install --cask tailscale
````

Linux
```bash
brew install --cask tailscale
```

Same for the server

then lauch 

```bash
sudo tailscale up
```

then tailscale will print `https://login.tailscale.com/...` that you will open in your navigator

Check the connection, you should see 2 ip 

```bash
tailscale status
```

launch the front 

```bash
yarn start --host 0.0.0.0
```

then set the to the .env.local

```bash
BASE_URL= http://{local-machine-ip}:5009
```
# E2E_playwright_server
