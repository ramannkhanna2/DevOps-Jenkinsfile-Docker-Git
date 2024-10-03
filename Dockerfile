FROM ubuntu:20.04

# Update package lists
RUN apt-get update -y 

# Install Apache2
RUN apt-get install -y apache2 

# Copy the index.html file into the web server's document root
COPY ./index.html /var/www/html/index.html 

# Expose port 80
EXPOSE 80 

# Set the working directory
WORKDIR /var/www/html 

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
