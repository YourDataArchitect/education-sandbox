FROM quay.io/astronomer/astro-runtime:8.2.0

ENV AIRFLOW__CORE__ALLOWED_DESERIALIZATION_CLASSES = airflow\.* astro\.*

# Install Astro CLI manually
USER root          # switch to root so apt-get works
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sSL https://install.astronomer.io | bash

# Optional: switch back to the original user
USER astro
