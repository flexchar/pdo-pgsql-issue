
# Serve pgsql container
container_id=$(docker run --rm -e POSTGRES_PASSWORD=password -e POSTGRES_DB=testdb -p 5430:5432 -d postgres:16-alpine)

# Build images
echo "\n🔨 Building images...\n"
docker build --target working-case -t php-pdo-test-3.18 .
docker build --target broken-case -t php-pdo-test-3.19 .

# Test images
echo "\n🔬 Testing working-case:"
docker run --rm php-pdo-test-3.18
echo "\n"
echo "\n🔬 Testing broken-case:"
docker run --rm php-pdo-test-3.19

# Clean up
echo "\n🧹 Cleaning up...\n"
docker rmi php-pdo-test-3.18 
docker rmi php-pdo-test-3.19
docker stop $container_id
