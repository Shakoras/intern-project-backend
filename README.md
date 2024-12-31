# Project Name
Internship application backend 
## Overview

This project is a Spring Boot and Angular application that utilizes Docker for deployment. This README explains the environment variables used in the Jenkins pipeline and their purposes for the backend.

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

- `db_url_devproject`
    - Description: JDBC URL for the PostgreSQL database.
    - Example: "jdbc:mysql://localhost:3306/springdb?createDatabaseIfNotExist=true"

- `db_username_devproject`
    - Description: Username for the mysql database.
    - Example: "zaoueli"

- `db_password_devproject`
    - Description: Password for the mysql database.
    - Example: "your_password"

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
      
### Deployment Properties

These variables are used for pushing `Docker Images` to `Dockerhub` and deploying the application to `Microsoft Azure`:

- **`DOCKERHUB_REPO`**
    - **Description**: DockerHub repository to which the Docker image is pushed.
    - **Example**: `"shakoras/springbootapp-devopsproject:latest"`

- **`MYSQL_DATABASE`**
    - **Description**: Name of the MySQL database.
    - **Example**: `"springdb"`

- **`MYSQL_CONTAINER`**
    - **Description**: Name of the MySQL container.
    - **Example**: `"db-devopsproject"`

- **`APP_CONTAINER`**
    - **Description**: Name of the Spring Boot application container.
    - **Example**: `"springbootapp-devopsproject"`

- **`RESOURCE_GROUP`**
    - **Description**: Azure resource group for the project.
    - **Example**: `"DevopsProjectRg"`

- **`AKS_CLUSTER`**
    - **Description**: Azure Kubernetes Service (AKS) cluster name.
    - **Example**: `"DevopsProjectAKSCluster"`

## Notes

**Spotless Check**: The project includes the Spotless plugin in the pom.xml file for code formatting. This helps enforce pre-commit checks to ensure code quality and consistency.

**JaCoCo**: The JaCoCo plugin is also added to pom.xml for code coverage. It works with SonarQube to provide detailed reports on code coverage during the analysis stage.

**Docker Compose**: The dup_d variable starts containers in detached mode, freeing up the terminal for other tasks.

**Terraform**: Ensure Terraform is installed and configured to manage Azure resources.

**Kubernetes**: Verify kubectl is configured to interact with the AKS cluster.

## Usage

To run the Jenkins pipeline, ensure the environment variables are correctly set in the Jenkins job configuration. Each variable plays a role in the build and deployment process:

1. **Checkout**: The code is pulled from the specified Git repository.
2. **Install Dependencies**: Maven compiles the project.
3. **Run Tests**: Maven runs the unit tests.
4. **Build Application**: Maven packages the application as a JAR file.
5. **SonarQube Analysis**: Code quality checks are performed using SonarQube.
6. **Deploy JAR to Nexus**: The built JAR file is uploaded to the Nexus repository.
7. **Building Docker Images**: Docker images are built using the specified `dbuild` command.
8. **Provision Resources with Terraform**: Uses Terraform to set up resources in Azure.
9. **Deploy to Ubuntu VM**: The Docker containers are started using the `dup_d` command in detached mode (`-d` option starts the containers in the background, allowing your terminal to be free for other tasks).
10. **Deploy to Microsoft Azure**: Deploys the application to Azure Kubernetes Service (AKS).
11. **Run Prometheus**: Starts the Prometheus container for monitoring.
12. **Run Grafana**: Starts the Grafana container for visualization.


## Conclusion

This README provides an overview of the environment variables used in this project. For any questions or issues, please reach out to the project maintainers.
