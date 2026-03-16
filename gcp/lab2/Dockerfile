FROM golang:1.26-alpine AS builder

COPY main.go /app/
WORKDIR /app
RUN go build main.go

FROM scratch
COPY --from=builder /app/main /app/main
ENV PORT=8080
CMD ["/app/main"]
