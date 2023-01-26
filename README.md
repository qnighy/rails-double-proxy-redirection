# Demo app to demonstrate bad redirection behind multiple reverse proxies

## How to run

```
docker compose up
```

Then visit the following pages:

- `http://localhost:8080/home` -- incorrectly redirects to `http://nginx2/`
- `http://localhost:8081/home` -- correctly redirects to `http://localhost:8081/`
