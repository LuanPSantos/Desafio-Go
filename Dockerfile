FROM golang:1.17.2-alpine3.14 AS Builder

WORKDIR /go/src/app

COPY . .

RUN go build main.go

# ----------------------

FROM scratch

WORKDIR /go

COPY --from=Builder /go/src/app/main .

ENTRYPOINT [ "./main" ]


