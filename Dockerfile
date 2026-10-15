# ===================================================================
# Multi-stage Dockerfile for Tamil Nadu Cultural Heritage Platform
# Optimized for cloud deployment (Render, Railway, Fly.io, etc.)
# ===================================================================

# -------------------------------------------------------------------
# Stage 1: Build the Application with Maven & JDK 21
# -------------------------------------------------------------------
FROM maven:3.9.6-eclipse-temurin-21-alpine AS builder
WORKDIR /workspace

# Pre-fetch dependencies to leverage Docker layer caching
COPY pom.xml .
RUN mvn dependency:go-offline -B || true

# Copy full source and compile production JAR
COPY src ./src
RUN mvn clean package -DskipTests

# -------------------------------------------------------------------
# Stage 2: Minimal, Secure JRE 21 Runtime Environment
# -------------------------------------------------------------------
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Run as non-root user for cloud security best practices
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Copy executable jar from builder stage
COPY --from=builder /workspace/target/*.jar app.jar

# Configure default port (overridden automatically by Render's $PORT)
ENV PORT=8080
EXPOSE 8080

# Run with container-aware JVM flags
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-Dserver.port=${PORT}", "-jar", "app.jar"]
