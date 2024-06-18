server {
    server_name speakapi.lol; #Your domain name

    location / {
        proxy_pass http://127.0.0.1:8080; #Your local ip, 127.0.0.1 is localhost, 8080 is port where is run your app
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
