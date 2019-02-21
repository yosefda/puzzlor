FROM golang:1-alpine3.9 AS build
RUN apk add --update alpine-sdk cmake linux-headers
RUN go get -u -d gocv.io/x/gocv
RUN cd $GOPATH/src/gocv.io/x/gocv && make install
WORKDIR /go/src/project/
COPY ./src/ /go/src/project/
RUN go build -o /bin/project

FROM scratch
COPY --from=build /bin/project /bin/project
ENTRYPOINT ["/bin/project"]
CMD ["--help"]