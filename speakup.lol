server {
    server_name speakup.lol; #Your domain name

    root /var/www/forum/alied-testing-angular-ui/browser; #location for index.html
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }
}
