# Demo app to demonstrate bad redirection/CSRF validation behind multiple reverse proxies

## How to run

```
docker compose up
```

Then visit the following pages:

- Redirection demo
  - `http://localhost:8080/home` -- incorrectly redirects to `http://nginx2/`
  - `http://localhost:8081/home` -- correctly redirects to `http://localhost:8081/`
- CSRF protection demo
  - `http://localhost:8080/posts/new` -- the submission is incorrectly rejected
  - `http://localhost:8081/posts/new` -- the submission is accepted

## What is happening

This repository implements a widely-deployed use of X-Forwarded-Host (that is, to push the value of the `Host` header each time the request is reverse-proxied).

However, in this configuration, if there are multiple proxies in-between, the current version of Ruby on Rails picks the hostname in an unconsistent way; that is, the host of the penultimate server in the reverse-proxy chain. This leads to the following inconveniences:

- Invalid redirection, though this one can be dealt by configuring the proxy server to rewrite back the redirection (`proxy_redirect` in nginx).
- Invalid CSRF validation. This one is hard to fix in the proxy server.
