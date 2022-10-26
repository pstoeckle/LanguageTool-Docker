FROM amazoncorretto:8-alpine3.13-jre

ARG COMMIT_SHORT=""
ARG BRANCH=""
ARG TAG=""

LABEL author="Patrick Stöckle <patrick.stoeckle@tum.de>"
LABEL edu.tum.i4.language-tool-server.commit=${COMMIT}
LABEL edu.tum.i4.language-tool-server.commit-short=${COMMIT_SHORT}
LABEL edu.tum.i4.language-tool-server.branch=${BRANCH}
LABEL edu.tum.i4.language-tool-server.tag=${TAG}

ENV COMMIT=${COMMIT}
ENV COMMIT_SHORT=${COMMIT_SHORT}
ENV BRANCH=${BRANCH}
ENV TAG=${TAG}

RUN apk update \
    && addgroup -S language-tool-group \
    && adduser -S language-tool-user -G language-tool-group

WORKDIR /home/language-tool-user
USER language-tool-user

COPY --chown=language-tool-user LanguageTool-5.9 languagetool

WORKDIR /home/language-tool-user/languagetool

CMD ["java", "-cp", "languagetool-server.jar", "org.languagetool.server.HTTPServer", "--port 8081", "--allow-origin"]
