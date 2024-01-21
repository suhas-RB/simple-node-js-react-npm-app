FROM node:14 as build
WORKDIR /usr/src/app
COPY ./ ./nodeapi/
RUN cd nodeapi&& npm install

FROM node:14
WORKDIR /usr/src/app
COPY --from=build /usr/src/app/nodeapi/ ./
EXPOSE 5000
CMD ["/bin/sh","-c","npm start"]


