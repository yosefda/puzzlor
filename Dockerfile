FROM golang:1-alpine3.9 AS build
WORKDIR /go/src/project/
COPY ./src/ /go/src/project/
RUN go build -o /bin/project

FROM scratch
COPY --from=build /bin/project /bin/project
ENTRYPOINT ["/bin/project"]
CMD ["--help"]