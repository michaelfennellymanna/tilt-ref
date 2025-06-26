# Start from an official Gradle image to build the app
FROM gradle:7.6.1-jdk17-alpine AS build

# Set working directory inside container
WORKDIR /app

# Copy only relevant files
COPY build.gradle .
COPY settings.gradle .
COPY gradle ./gradle
COPY gradlew .
COPY src ./src

# Grant execute permission to gradlew (just in case)
RUN chmod +x gradlew

# Build the application (should produce a fat JAR if configured)
RUN ./gradlew clean build

# Use a lightweight JDK image for running the app
FROM openjdk:17-jdk-alpine

# Copy the JAR from the build container (adjust path if needed)
COPY --from=build /app/build/libs/*.jar /app/app.jar

# Expose the API port
EXPOSE 

# Command to run the Java application
ENTRYPOINT [java, -jar, /app/app.jar]

