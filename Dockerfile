FROM denismakogon/gocv-alpine:4.0.1-buildstage as build-stage
RUN go get -u -d gocv.io/x/gocv
WORKDIR /go/src/puzzlor/
COPY ./src/ /go/src/puzzlor/
RUN go build -o /bin/puzzlor
ENTRYPOINT ["/bin/puzzlor"]