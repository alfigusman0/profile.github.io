# Situs statis (GitHub Pages) disajikan oleh nginx non-root pada port 8080.
FROM nginxinc/nginx-unprivileged:1.30-alpine@sha256:f5116ed4606f3eb015dd4a8e28cb9b351476dc0ad4bc6e9f93b19cec130cdf03

COPY --chown=nginx:nginx index.html CNAME /usr/share/nginx/html/
COPY --chown=nginx:nginx dist/ /usr/share/nginx/html/dist/

USER nginx
EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1:8080/ || exit 1
