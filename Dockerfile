# Use Maven with JDK 17 for the build stage
FROM maven:3.6.3-openjdk-17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven POM file and source code
COPY pom.xml ./ 
COPY src ./src

# Build the application, skipping tests
RUN mvn clean package -DskipTests

# Use a lightweight Java 17 runtime for the final image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=build /app/target/emp_backend-1.0.0-SNAPSHOT.jar app.jar

# Expose the port your application listens on
EXPOSE 5000

# Define the command to run the application
CMD ["java", "-jar", "app.jar"]
