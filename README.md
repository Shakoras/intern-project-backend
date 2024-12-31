# Project Name
Internship application backend 
## Overview

This project is a Spring Boot application that utilizes Docker for deployment. This README explains the environment variables used in the Jenkins pipeline and their purposes.

## Environment Variables

The following environment variables are defined for use in the Jenkins pipeline:

### General Variables

- **`registryCredentials`**
    - **Description**: Credentials ID for Nexus repository.
    - **Example**: `"nexus"`

- **`mavenRepositoryUrl`**
    - **Description**: URL of the Maven snapshots repository in Nexus.
    - **Example**: `"http://192.168.201.143:8081/repository/maven-snapshots"`

- **`artifactId`**
    - **Description**: The ID of the artifact being built.
    - **Example**: `"interProject"`

- **`version`**
    - **Description**: The current version of the artifact.
    - **Example**: `"0.0.1-SNAPSHOT"`

### Database and Application Properties

The following environment variables are used to configure the database connection and email service in `application.properties`:

- `db_url`
    - Description: JDBC URL for the PostgreSQL database.
    - Example: "jdbc:postgresql://localhost:1234/backend"

- `db_username`
    - Description: Username for the PostgreSQL database.
    - Example: "postgres"

- `db_password`
    - Description: Password for the PostgreSQL database.
    - Example: "your_password"

- `spring.mail.username`
    - Description: Gmail account used for sending emails.
    - Example: "your_email@gmail.com"

- `spring.mail.password`
    - Description: Application-specific password for Gmail.
    - Example: "your_generated_password"

These variables are used in the `application.properties` file.

### Docker Compose Variables

- **`dbuild`**
    - **Description**: Command to build Docker images using Docker Compose.
    - **Example**: `"docker-compose build"`

- **`dup`**
    - **Description**: Command to start the Docker containers in detached mode.
    - **Example**: `"docker-compose up"`

- **`dup_d`**
    - **Description**: Command to start the Docker containers in detached mode.
    - **Example**: `"docker-compose up -d"`

- **`ddown`**
    - **Description**: Command to stop and remove the Docker containers.
    - **Example**: `"docker-compose down"` (optional, if used)

## Usage

To run the Jenkins pipeline, ensure the environment variables are correctly set in the Jenkins job configuration. Each variable plays a role in the build and deployment process:

1. **Checkout**: The code is pulled from the specified Git repository.
2. **Install Dependencies**: Maven compiles the project.
3. **Run Tests**: Maven runs the unit tests.
4. **Build Application**: Maven packages the application as a JAR file.
5. **SonarQube Analysis**: Code quality checks are performed using SonarQube.
6. **Deploy JAR to Nexus**: The built JAR file is uploaded to the Nexus repository.
7. **Building Docker Images**: Docker images are built using the specified `dbuild` command.
8. **Deploy to Ubuntu VM**: The Docker containers are started using the `dup_d` command in detached mode (`-d` option starts the containers in the background, allowing your terminal to be free for other tasks).

## Conclusion

This README provides an overview of the environment variables used in this project. For any questions or issues, please reach out to the project maintainers.
