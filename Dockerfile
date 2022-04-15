FROM golang:alpine as builder

WORKDIR /go/src/app

COPY . .

ENV CGO_ENABLED=0 

RUN go build -o /app main.go

FROM scratch

COPY --from=builder /app /app

CMD ["/app"]