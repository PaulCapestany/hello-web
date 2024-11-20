# Use a minimal base image for Go
FROM golang:1.23-alpine AS builder

# Set up dependencies
WORKDIR /app
COPY . .

# Build the Go application
RUN go build -o hello-web main.go

# Use a lightweight container for the final image
FROM alpine:latest
COPY --from=builder /app/hello-web /hello-web

# Expose the port
EXPOSE 8080

# Run the application
ENTRYPOINT ["/hello-web"]