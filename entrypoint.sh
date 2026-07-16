#!/bin/bash
DOCKERMOX_DIR="/usr/lib/dockermox"
PASSFILE="$DOCKERMOX_DIR/.dockpass"
STARTFILE="$DOCKERMOX_DIR/startup.txt"
mkdir -p "$DOCKERMOX_DIR"
generate_password() {
    tr -dc 'A-Za-z0-9!@#$%*' < /dev/urandom | head -c 16
}
if [ ! -f "$STARTFILE" ]; then
    PASSWORD=$(generate_password)
    echo "root:${PASSWORD}" | chpasswd
    echo "$PASSWORD" > "$PASSFILE"
    echo "1" > "$STARTFILE"
    echo "Password generated and saved to $PASSFILE"
elif [ "$(cat "$STARTFILE")" -lt 4 ]; then
    COUNT=$(cat "$STARTFILE")
    COUNT=$((COUNT + 1))
    echo "$COUNT" > "$STARTFILE"
    if [ "$COUNT" -ge 4 ]; then
        PASSWORD=$(cat "$PASSFILE")
        sha256sum <<< "$PASSWORD" | awk '{print $1}' > "$PASSFILE"
        echo "5" > "$STARTFILE"
        echo "Password file has been hashed."
    fi
else
    echo "Password was due to security reasons hashed after 3 startups of the container."
fi
exec /sbin/init
