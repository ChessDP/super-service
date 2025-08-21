# Deploy.ps1

# build test project -- no longer needed as we are using Docker to build
# dotnet build

# run the tests -- this too
# dotnet test --no-build --verbosity normal

# define the Docker image name
$imageName = "super-service-test"

# build the Docker image
docker build -t chessdp/$imageName .

# run the Docker container
docker run --rm chessdp/$imageName

# get the exit code
$exitCode = $LASTEXITCODE

# prettify output where if the exit code is not zero, it indicates that tests failed
if ($exitCode -ne 0) {
    $Host.UI.WriteErrorLine("Tests failed with exit code $exitCode")
    exit $exitCode
} else {
    $Host.UI.WriteErrorLine("All tests passed.")
    exit 0
}