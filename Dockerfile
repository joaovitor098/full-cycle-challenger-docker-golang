FROM golang:1.16-alpine AS builder

WORKDIR /app

COPY . .

RUN go build full-cycle.go

FROM scratch

WORKDIR /bin

COPY --from=builder /app .

ENTRYPOINT ["./full-cycle"]
