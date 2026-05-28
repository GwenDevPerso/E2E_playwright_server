# E2E test project server

## What is used ?

- playwright
- docker / docker compose v2
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

on the server launch (faster than ssh)

```bash
docker pull mcr.microsoft.com/playwright:v1.60.0-noble
```


<!-- ### Just 

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
``` -->

### Tailscale

To handle the connection between the tests and local front we can use `https://tailscale.com/`,

Its mostly used to share test report with local machine so we can see it on web

On the local machine & on the server install tailscale `https://tailscale.com/docs/how-to/quickstart`

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


## Testing 

by **ssh**

```bash
ssh {user}}@{ip_server} "cd E2E_playwright_server && BASE_URL={http://ip-local or DEV_URL} yarn e2e"
```

if you want to see the report available in ./playwright-report, launch this container after the build,
in the docker-compose.yml you can find a nginx conf, the web report will be available in http://{tailscale-ip}:8080
You need to have tailscale started

```bash
docker compose up -d report
```