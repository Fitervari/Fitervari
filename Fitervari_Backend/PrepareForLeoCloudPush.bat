CALL cd FitervariBackend
CALL ./mvnw clean
CALL ./mvnw package
CALL docker build -f src/main/docker/Dockerfile.jvm -t quarkus/fitervari_backend .
CALL docker tag quarkus/fitervari_backend registry.cloud.htl-leonding.ac.at/m.rausch-schott/fitervari-backend
PAUSE