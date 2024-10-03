Copy code
FROM ubuntu:18.04
MAINTAINER Raman Khanna <raman@email>

ENV DEBIAN_FRONTEND=noninteractive

# Create the necessary directories
RUN mkdir /data

# Update package list and install Apache and PHP
RUN apt-get update -y && \
    apt-get install -y apache2 php && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set timezone to UTC
RUN ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

# Set ServerName to suppress the warning
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Change the port to 8080
RUN sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf

# Change ownership of the log directory
RUN chown -R www-data:www-data /var/log/apache2

# Create a simple HTML page
RUN echo "Raman Deals in DevOps and Cloud" > /var/www/html/index.html

# Expose port 8080
EXPOSE 8080

# Switch to non-root user
USER www-data

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
