set shell := ["bash", "-cu"]

SERVER := "gwen@192.168.64.3"
REMOTE_DIR := "E2E_playwright_server"
LOCAL_PORT := "5009"

test-dev:
    ssh {{SERVER}} "cd {{REMOTE_DIR}} && BASE_URL=https://dev.expert.smartbiotic.ai yarn e2e"

test-local:
    LOCAL_IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null); \
    echo "Using LOCAL_IP=$LOCAL_IP"; \
    ssh {{SERVER}} "cd {{REMOTE_DIR}} && BASE_URL=http://$LOCAL_IP:{{LOCAL_PORT}} yarn e2e"

show-report:
    ssh {{SERVER}} "cd {{REMOTE_DIR}} && yarn report"