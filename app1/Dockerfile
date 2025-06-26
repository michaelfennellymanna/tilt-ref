# Multi-stage build for Java/Spring Boot application
FROM gradle:8.14.2-jdk21-alpine AS build

# Set working directory inside container
WORKDIR /app

# Copy Gradle wrapper and build files first (for better caching)
COPY gradlew .
COPY gradlew.bat .
COPY gradle ./gradle
COPY build.gradle .
COPY settings.gradle .

# Grant execute permission to gradlew
RUN chmod +x gradlew

# Download dependencies first (this layer will be cached if build files don't change)
RUN ./gradlew dependencies --no-daemon

# Copy source code
COPY src ./src

# Build the application
RUN ./gradlew clean build -x test --no-daemon

# Runtime stage - use lightweight JDK image
FROM eclipse-temurin:21-jdk-alpine

# Set working directory
WORKDIR /app

# Copy the JAR from the build stage
COPY --from=build /app/build/libs/*.jar app.jar

# Add Spring Boot DevTools support for hot reload in development
ENV SPRING_DEVTOOLS_RESTART_ENABLED=true

# Expose the API port (use default 8080 if API_SERVER_PORT not set)
EXPOSE ${API_SERVER_PORT:-8080}

# Command to run the Java application (FIXED SYNTAX)
CMD ["java", "-Dserver.port=8080", "-jar", "app.jar"]