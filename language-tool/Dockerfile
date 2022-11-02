FROM amazoncorretto:8-alpine3.13-jre

ARG COMMIT=""
ARG COMMIT_SHORT=""
ARG BRANCH=""
ARG TAG=""

LABEL author="Patrick Stöckle <patrick.stoeckle@tum.de>"
LABEL edu.tum.i4.language-tool.server.commit=${COMMIT}
LABEL edu.tum.i4.language-tool.server.commit-short=${COMMIT_SHORT}
LABEL edu.tum.i4.language-tool.server.branch=${BRANCH}
LABEL edu.tum.i4.language-tool.server.tag=${TAG}

ENV COMMIT=${COMMIT}
ENV COMMIT_SHORT=${COMMIT_SHORT}
ENV BRANCH=${BRANCH}
ENV TAG=${TAG}

RUN apk update \
    && apk add hunspell \
    && addgroup -S language-tool-group \
    && adduser -S language-tool-user -G language-tool-group

WORKDIR /home/language-tool-user
USER language-tool-user

RUN wget -q https://languagetool.org/download/LanguageTool-stable.zip \
    && unzip -qq LanguageTool-stable.zip \
    && rm LanguageTool-stable.zip \
    && mv LanguageTool-* languagetool

WORKDIR /home/language-tool-user/languagetool
EXPOSE 8081
CMD ["java", "-Xms128m", "-Xmx1024m", "-cp", "languagetool-server.jar", "org.languagetool.server.HTTPServer", "--allow-origin", "--public", "--languageModel", "/ngrams/"]
