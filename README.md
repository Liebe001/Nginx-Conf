# SpeakUp-Nginx

## Introduction
This project demonstrates how to deploy a web application using Nginx as a reverse proxy on an AWS EC2 instance. The guide also includes instructions on how to secure your site with SSL using Certbot.

## Prerequisites
- An AWS account with access to EC2
- A domain name pointing to your EC2 instance
- Basic knowledge of AWS, SSH, and command-line operations

## Setup

### Step 1: Launch an EC2 Instance
1. Log in to your AWS account and navigate to the EC2 Dashboard.
2. Click on "Launch Instance" and follow the instructions to create a new instance.
3. Choose an Amazon Machine Image (AMI) such as Ubuntu.
4. Select an instance type (e.g., t2.micro).
5. Configure the instance details and add storage as needed.
6. Add tags and configure security groups to allow HTTP (port 80) and HTTPS (port 443) traffic.
7. Review and launch the instance. Make sure to download the key pair (.pem file) for SSH access.

### Step 2: Connect to Your EC2 Instance
1. Open a terminal and connect to your instance using SSH:
    ```sh
    ssh -i /path/to/your-key.pem ubuntu@your-ec2-public-ip
    ```

### Step 3: Install Nginx
1. Update your package list and install Nginx:
    ```sh
    sudo apt update
    sudo apt install nginx
    ```

2. Start and enable Nginx:
    ```sh
    sudo systemctl start nginx
    sudo systemctl enable nginx
    ```

### Step 4: Configure Nginx
1. Create a configuration file for your site:
    ```sh
    sudo nano /etc/nginx/sites-available/yourdomain.com
    ```

2. Add the configuration from source:
   
    - speakapi.lol - for back (Spring boot actually)
    - speakup.lol - for front (static) (Angular actually)

4. Enable the configuration by creating a symlink:
    ```sh
    sudo ln -s /etc/nginx/sites-available/yourdomain.com /etc/nginx/sites-enabled/
    ```

5. Test the configuration and reload Nginx:
    ```sh
    sudo nginx -t
    sudo systemctl reload nginx
    ```

### Step 5: Install Certbot and Obtain an SSL Certificate
1. Install Certbot:
    ```sh
    sudo apt install certbot python3-certbot-nginx
    ```

2. Obtain an SSL certificate:
    ```sh
    sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
    ```

3. Follow the prompts to complete the installation and certificate issuance.

4. Certbot will automatically update your Nginx configuration to use SSL. Verify the changes:
    ```sh
    sudo nano /etc/nginx/sites-available/yourdomain.com
    ```

5. Reload Nginx to apply the changes:
    ```sh
    sudo systemctl reload nginx
    ```

### Step 6: Automatic Renewal of SSL Certificate
1. Certbot automatically sets up a cron job for certificate renewal. To verify, you can list the cron jobs:
    ```sh
    sudo crontab -l
    ```

2. To test the renewal process, you can run:
    ```sh
    sudo certbot renew --dry-run
    ```

## Conclusion
You have successfully deployed a web application using Nginx on AWS EC2 and secured it with SSL using Certbot. Your site should now be accessible via HTTPS.

## Additional Resources
- [Nginx Documentation](https://nginx.org/en/docs/)
- [Certbot Documentation](https://certbot.eff.org/docs/)
- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)
