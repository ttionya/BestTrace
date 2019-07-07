FROM alpine:3.10

LABEL maintainer "ttionya <my@ttionya.com>"

WORKDIR /app/

RUN apk add --no-cache libcurl \
  # Download and Extract
  && cd /tmp/ \
  && wget -c -t3 -T60 "https://cdn.ipip.net/17mon/besttrace4linux.zip" -O "besttrace.zip" \
  && unzip besttrace.zip \
  # Executable
  && mv ./besttrace32 /app/besttrace32 \
  && chmod +x /app/besttrace32 \
  && rm -rf /tmp/*

ENTRYPOINT ["/app/besttrace32", "-g", "cn"]
