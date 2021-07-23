FROM golang:1.16 AS builder

WORKDIR /go/src/app
COPY . .

RUN GOOS=linux go build

FROM scratch

COPY --from=builder /go/src/app/ .

CMD [ "./desafiofc" ]