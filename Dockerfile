# Use the official PostgreSQL image as the base image
FROM postgres:15

# Set environment variables for PostgreSQL
ENV POSTGRES_USER=test_user
ENV POSTGRES_PASSWORD=test_password
ENV POSTGRES_DB=postgres

# Expose the default PostgreSQL port
EXPOSE 5432

# Add any custom initialization scripts (optional)
# COPY ./init.sql /docker-entrypoint-initdb.d/

# The official PostgreSQL image automatically starts the database