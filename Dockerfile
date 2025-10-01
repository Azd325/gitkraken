FROM archlinux:base-devel

# Install tools required by update.sh and keep the image lean
RUN pacman -Sy --noconfirm git curl jq namcap pacman-contrib \
    && pacman -Scc --noconfirm

# Create an unprivileged user because makepkg refuses to run as root
RUN useradd -m builder \
    && echo 'builder ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && install -d -o builder -g builder /work

USER builder
WORKDIR /work

HEALTHCHECK --interval=1m --timeout=10s --start-period=5s --retries=3 CMD pacman -Syy --noconfirm >/dev/null 2>&1 || exit 1
