# Tiltfile for Java/Spring Boot application with Gradle

# Load docker-compose.yml and start all services
docker_compose('./docker-compose.yml')

# Build app1 image with optimized live update for Java/Gradle
# Use the actual Docker Compose service name
docker_build('tilt-template-app1', './app1',
  dockerfile='./app1/Dockerfile',
  live_update=[
    # Sync source code changes
    sync('./app1/src', '/app/src'),
    
    # Sync build files (only the ones that exist)
    sync('./app1/build.gradle', '/app/build.gradle'),
    # sync('./app1/build.gradle.kts', '/app/build.gradle.kts'),  # Uncomment if you use Kotlin DSL
    # sync('./app1/settings.gradle', '/app/settings.gradle'),    # Uncomment if you have this
    
    # Sync Gradle wrapper files
    sync('./app1/gradlew', '/app/gradlew'),
    sync('./app1/gradlew.bat', '/app/gradlew.bat'),
    sync('./app1/gradle/', '/app/gradle/'),
    
    # Rebuild when source changes (for Spring Boot DevTools support)
    run('./gradlew build -x test', 
        trigger=['./app1/src/main/java', './app1/src/main/resources']),
    
    # Restart the application after rebuild
    restart_container()
  ]
)

# Define resources from docker-compose services
# Use the actual service names from your docker-compose.yml
dc_resource('app1')  # This refers to the service name in docker-compose.yml
dc_resource('db')    # Add other services as they appear in your compose file

# Add other services from your docker-compose.yml as needed:
# dc_resource('redis')
# dc_resource('nginx')

print("Tilt configuration loaded successfully!")
print("Java/Spring Boot app with Gradle build configured")
print("Your services will be available in the Tilt UI at http://localhost:10350")