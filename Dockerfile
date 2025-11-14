# ---- Build Stage ----
    FROM maven:3.9.5-eclipse-temurin-17 AS build
    WORKDIR /app
    
    # Copy toàn bộ code vào container
    COPY . .
    
    # Build Spring Boot (bỏ qua test cho nhanh)
    RUN mvn -q -e -DskipTests clean package
    
    # ---- Run Stage ----
    FROM eclipse-temurin:17-jdk
    WORKDIR /app
    
    # Copy file JAR đã build sang image cuối
    COPY --from=build /app/target/*.jar app.jar
    
    # Expose port 8080
    EXPOSE 8080
    
    # Chạy ứng dụng
    CMD ["java", "-jar", "app.jar"]
    