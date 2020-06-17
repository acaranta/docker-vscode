FROM jlesage/baseimage-gui:ubuntu-18.04

RUN apt-get update && apt-get install -y wget libnss3 libgtk-3-0 libxss1 libasound2 gnupg2
RUN useradd --shell /sbin/nologin --home /app --uid 1000  -G users appuser
RUN mkdir /app && chown appuser -Rfv /app
RUN echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" >/etc/apt/sources.list.d/vscode.list && \
     wget -q -O - "http://packages.microsoft.com/keys/microsoft.asc" | apt-key add - && \
     apt-get update && apt-get install -y code

ADD vscode.png /app/vscode.png
RUN APP_ICON_URL=file:///app//vscode.png && install_app_icon.sh "$APP_ICON_URL"
ENV APP_NAME="Visual Studio Code"

ADD startapp.sh /startapp.sh
#USER appuser
#RUN echo $USER
WORKDIR /app
