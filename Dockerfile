FROM ruby:2.3.4-alpine

COPY src/ .

RUN ["bundle", "install"]

EXPOSE 3000/tcp

CMD ["bin/rails", "server"]
