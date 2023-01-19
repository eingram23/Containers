# Filename: Dockerfile
FROM arm32v7/ubuntu:18.04
ARG BUILD_DATE
LABEL org.label-schema.build-date=$BUILD_DATE

ENV API_USER=upsmon \
    DESCRIPTION=UPS \
    DRIVER=usbhid-ups \
    GROUP=nut \
    NAME=ups \
    POLLINTERVAL= \
    PORT=auto \
    SDORDER= \
    SECRET=nut-upsd-password \
    SERIAL= \
    SERVER=master \
    USER=nut \
    VENDORID= \
    DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

RUN apt update
RUN apt install '^libssl1.0.[0-9]$' libunwind8 wget nut ssmtp -y
RUN wget https://github.com/PowerShell/PowerShell/releases/download/v7.3.1/powershell-7.3.1-linux-arm32.tar.gz \
    && mkdir /powershell \
    && tar -xvf ./powershell-7.3.1-linux-arm32.tar.gz -C /powershell
RUN /powershell/pwsh -Command 'Set-PSRepository -Name PSGallery -InstallationPolicy Trusted' \
    && /powershell/pwsh -Command 'Install-Module VMware.PowerCLI -Confirm:$False' \
    && /powershell/pwsh -Command 'Set-PowerCLIConfiguration -ParticipateInCeip $False -Confirm:$False' \
    && /powershell/pwsh -Command 'Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$False'

WORKDIR /etc/nut
COPY upsmon.conf upssched.conf nut.conf ./
WORKDIR /etc/ssmtp
COPY ssmtp.conf ./

EXPOSE 3493
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]