# Use the official Golang image from the Docker Hub
FROM golang:1.22

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Install the Air tool for live reload during development
RUN go install github.com/air-verse/air@latest

#Install gqlen
RUN go install github.com/99designs/gqlgen@latest

# Expose port 8080 to the outside world
EXPOSE 3000

# Command to run the Go application with live reload
CMD ["air"]