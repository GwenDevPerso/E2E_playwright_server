set shell := ["bash", "-cu"]

IMAGE := "my-app-e2e"
BASE_URL := env("BASE_URL")
PROJECT_PATH := "/opt/e2e"

build:
    docker build -t {{IMAGE}} .

test:
    docker run --rm \
        -e BASE_URL={{BASE_URL}} \
        -v {{PROJECT_PATH}}/playwright-report:/app/playwright-report \
        -v {{PROJECT_PATH}}/test-results:/app/test-results \
        {{IMAGE}}