FROM archlinux:base-devel

# pacman's download sandbox cannot install its seccomp filter under amd64 emulation
RUN sed -i 's/^#DisableSandboxSyscalls/DisableSandboxSyscalls/' /etc/pacman.conf

# Install tools required by update.sh and keep the image lean
RUN pacman -Syu --noconfirm git curl jq namcap pacman-contrib \
    && pacman -Scc --noconfirm

# Create an unprivileged user because makepkg refuses to run as root. The UID
# must match the owner of the bind-mounted checkout so update.sh can write to it.
ARG UID=1000
RUN useradd -l -m -u "${UID}" builder \
    && echo 'builder ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && install -d -o builder -g builder /work

USER builder
WORKDIR /work

HEALTHCHECK NONE
