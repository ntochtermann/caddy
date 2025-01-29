FROM docker.io/caddy:2.8.4-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/desec \
    --with github.com/mholt/caddy-l4 \
    --with github.com/caddyserver/transform-encoder \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http@main \
    --with github.com/hslatman/caddy-crowdsec-bouncer/layer4@main

FROM docker.io/caddy:2.8.4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
