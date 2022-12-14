FROM docker:git as build
COPY . /git
RUN echo "<h1>" > /index.html
RUN git -C /git rev-parse --short HEAD >> /index.html
RUN echo "</h1>" >> /index.html


FROM nginx:alpine
COPY --from=build /index.html /usr/share/nginx/html
