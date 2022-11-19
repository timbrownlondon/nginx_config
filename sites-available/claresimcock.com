server {
  server_name  claresimcock.com www.claresimcock.com;
  access_log   /var/log/nginx/claresimcock.com.access.log;
  error_log    /var/log/nginx/claresimcock.com.error.log;

  autoindex on;

  location ~ /\.git {
    return 404;
  }

  location /  {

    ssi  on;
    root /var/www/claresimcock;
    expires 5m;
  }

  location ~ \.(jpg|png)$ {
    root /var/www/claresimcock;
    expires 7d;
  }


    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/claresimcock.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/claresimcock.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot


}
server {
    if ($host = www.claresimcock.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = claresimcock.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


  listen 80;
  server_name  claresimcock.com www.claresimcock.com;
    return 404; # managed by Certbot
}
