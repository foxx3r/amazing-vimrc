#!/bin/sh -e
set -- 

webcat() {
  if [ -x "`which curl 2>/dev/null`" ]; then
    curl -LsS "$@"
  elif [ -x "`which wget 2>/dev/null`" ]; then
    wget -q -O - "$@"
  elif [ -x "`which lynx 2>/dev/null`" ]; then
    lynx -source "$@"
  fi
}

if [ -r /etc/shells ]; then
  shell="`(grep /zsh /etc/shells || grep /bash /etc/shells || grep /ksh /etc/shells || grep /sh /etc/shells)|head -1`"
else
  shell=/bin/bash
fi

if [ "`id -un`" = "${1-tpope}" ]; then

webcat https://tpope.io/tgz | gzip -dc | tar xf - -C "$HOME"
cat > "$HOME/.ssh/known_hosts" <<ssh_known_hosts
varys,varys.tpope,tpo.pe ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDmPW+EXP5IvUUqWOHA/TMrjHMPGuC4rSAQskxMZjL3g2K62gLgSWQqNUUtNyTzHErV/KmkzwncDTaOg6I+O1jzzShYkXqME1q8b3Wmxy56IIl54R3IP1L2LttYbIMshGSrn36aaQ7Iz7AhcwDE3oavlJAwLYB8aYBeUrs1T+ieaf/wnn+blKhzQr9UzhCTRcsw6xxuRhfyjqoBgZlUufhVhzTwCmxniRL0PL4nyqChVmWndb4z+1dPi8memnxLFjNYttge3G4qVJB8CyP0ZyWWo1ifc4uQJFlXvwyX9nQ4QKey2WP37/D4eO3lUtCdzkzUDqs4uLU4khO/MQiKZ5FJ
robert,robert.tpope,robert.tpope.net,home.tpope.org ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgwCWAz0XQ9FhB0GmnyHZ0nJGaxQwtMZpSJGSfL6vXsefKdJWJpqijY9YNCfWLZJM40i+y9ycdBbYW8ayMPbCv/bAWmbS4kv8m9O0XwDL3fRt/ZjX1e+Iihy5+lLVDS2ayQdCKqW0MbQm1geA7TEUf90IRCQd1LXl9lC+2lvxr/O9ap47
balon,balon.tpope,balon.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0XVeB0kPHaev31yPy4kwMMmHsX1JsIl7NHcswyfV4scq+wuGjKBE/SP56iWJmXTAuFsQPE8DI2EDTpBuZuznW+XnNJaE4h886OLvTnxaG6qE26cJwL/nCgil3twUeZPHTKHdJ4hkEiCcrJHhx9B2lCoWgQTye7AAf8dLnVmpwF1fJ3QSDjLOs1WARnBsf7bKX6u17of6iJVYIsTR4EWY9pUBsXB+Kc58T2ty5QpCVf11cYrEg5XL3t7NhCld9tCYApTPHBISzWFqKTIXMAbLIwfHhRXsdDV045hkrml2qhV+PepPJDKLkxHWaNunVQqHepd/aD/VPPbaSbSWdK44Nw==
walder,walder.tpope,walder.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCthAoKq0K06Zq/svV94A1bY39Dn8cpj0Oz+H1Jn9c6e7NWBODBBzXyXPptmhezNEtjHKNsEVlyKcMLvQZpCt02k4e9Tun+hymTn7MWkyzDOBW0xN80bGu73cXv7aVqyKqeF3gMI8w/NSXeODAu/X+dSpqPJQIipg5f+nxCZxPYGA64W2EJeNIl7Xr2k5yOTkvRzYlhy9e9ket1upjl9thqsDTigXm/4aAXH2ev9d6Rb+O9gsFh2xi0w3MMUmeRo1nXdhReiG6oGL/EU6dTWYDt+aaARWQN68xo3bFcquFE8aR0giwAf2uzQGgu96kkdRV7S6I+gvstQhzTGCj44IpB
aegon,aegon.tpope,aegon.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQKtI4BfdjAvaVMNJNziV8Vb5xFRoZEe4BczpwCEEDtrX/OlP/K7EzYUvJcakQUGHkX5ETOYaj3to+i3OckBLh0JxQlukcz9ozwQLoL2Mus2Oyb2Otz1bpAg1uspnnztet6cc5eEzqDxu0VraI3ZKXARLqkPWhZpbA9CArxU2kuORYJAgKibatXsZw/aEsQ8M7XckDlbheMK0uDWPS9JX2lS79QKW3/uUQe4ur9whHoTjWrj1/bIHRI3/OsYGg/vr41l563vvgwluqdhMojrOOpilbA0Em089WbDuX7+Sd2ItYK0eKBsJM6Is95jHZ3Duh5T8DI6Qn30Vk2GRKwRCh
tyrion,tyrion.tpope,tyrion.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtC9aSbMlK7NHdFxbLhI3rgZu+JLjKtXNKmHM69G/LyCIuH8elEnFDyPfzcC9/MNkQf7YRvK/k6Bs/jHoJ6pBqUDGkLBk2/RmEXTt1/4FKvDKi8q10TO/5wtfdr/PUKGmCck//5KK4Gzl2Rf1RhPr5NsDsTUryDkzHdJWTygh6o1Js7r0q63zicycVySd1PUShzq2MTJmJgJ6tI1tD1GRgyqPlqkTLpVfzvSnVy7HnSqiKhx2h0HFKUO9+/IS0Lj+Sq24ub6cqxw0i+8qRVqCeWmDZEfRZwDp/Fr8/RXzA0Gbj5+jtjRnbCzljA8Dk4Aosq/Hc8i2E+Fy6v0ObowTj root@tyrion
loras,loras.tpope,loras.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCk3P4eiadA8quQVwY5lruF03fRvx3/RKHPugquhwlZ5O9bys+CEeq7GEnAORCwq7KjLM20B08gV3e0yQam+QR/K8trtGn9CXX5+jqys6e0B+UyRL79aFsZo9XbzQUou5MNHIZh9iVHfl/3+r0ObPBRChDQB1eGspdxV0vmQfbAVRFqG4daUyveeMNMcpK+dX01MeGMa1eu0RRyLhNB+0pQqboOqv33nQ4l88ZwmTLHm27ERXLiYVwo1GxrU9WMDkkdMKR6l2nNBujcygU7M1YsbalxxCLLIUzqCJ8w1rHRnqCQ/NdSOZCV3JDwccGFn/H/TCjYYlSo8JAfQx/kDOCr
lancel,lancel.tpope,lancel.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCstoSn/jeUdJ1E56eDzXyo6RkfufkA96K1ZgjAnbzhUAXvoqR0na3P6f/WuSU5jzluAsv+3qMaoeI/Lez5d9Anjw5ikpx2BDJ2nBqhcqE8aMS2SJkvD1P8SCIfSTY6+ZJ+c/Qb+NrU1pDjZmTmk88HudaFTXnxKh9hjpYySPEHRi9yQDtDAhvBCDVfSY6WJ16aPADVx7GZiD4w5CjZYww5xgNwUKr86ZymNVsqQUlKtU0FqQFKkLpz9W6L7Xq9pPKenVWvGUMcVOMUNDkbcvh7URH0QMB5WlDAubfj+Bm4043bej5NsNrICGw5nbfZ82SxIa0J51WbPV8w+YoW/hjn
daenerys,daenerys.tpope,daenerys.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDN18MPfSRP9gPwy4NcEW/Wsa6OSFQ06JSJOa9gx+RIenA6lLOtDpEnNqlsnJU30tcSSC9MSvH36p8J8sJTez6c3gWAUUfhYz6zPxstYB//PGuHgF+etqHYzHgw0RYzkOjU/I1HCWFLinaHSPS0rSNInCkQHwtz2fQZP1LoYyZ5LiXzWLt4gOWisKZCh4xNvcFSsj6BYnGhdhbNvfF2+TlET/CVvGur62sPlAkSMKeEtceEoIyI7E05CaoUpYwXETIJtTrdbvHWx1DxW7V8UfQPsvVcP74r4/+yTyzR7rUarnLQGjl/9MHwz0HtfWSR+yUQ1hbWmB8WV9LwbI7ACjOz
ssh_known_hosts

exec "$HOME/.local/bin/tpope" setup default cron

elif [ "`id -u`" = 0 ]; then

user="${1-tpope}"
PATH="$PATH:/usr/sbin:/sbin:/usr/bin:/bin"

cd /

has() {
  [ -x "`which $1 2>/dev/null`" ]
}

pkginstall() {
  if has apt-get; then
    apt-get install -qq "$@"
  elif has yum; then
    yum install -qy "$@"
  elif has opkg; then
    opkg install "$@"
  elif has emerge; then
    emerge "$@"
  elif has pacman; then
    pacman -Sy "$@"
  elif has urpmi; then
    urpmi -q "$@"
  elif has yast; then
    yast --install "$@"
  elif has pkg_add; then
    # if [ -z "$PKG_PATH" ]; then
    #   PKG_PATH=http://ftp.openbsd.org/pub/OpenBSD/`uname -r`/packages/`machine -a`/
    # fi
    for pkg in "$@"; do
      pkg_add "$pkg--"
    done
  else
    echo "I don't know how to install $*"
  fi </dev/tty
}

if ! id $user >/dev/null 2>&1 && ! grep $user /etc/passwd >/dev/null; then
  echo "Adding user '$user'."
  useradd -m -s $shell -c 'Tim Pope' $user
  passwd -d $user >/dev/null 2>&1 || passwd $user
fi

[ -f /etc/sudoers ] || yes | pkginstall sudo

# if [ -f /etc/sudoers ] && ! grep "^$user" /etc/sudoers >/dev/null; then
#   echo 'Adding to sudoers.'
#   echo "$user ALL=(ALL) ALL" >> /etc/sudoers
#   echo "Defaults:$user env_keep += \"HOME VISUAL\"" >> /etc/sudoers
# fi

for group in staff users adm src dip dialout floppy cdrom video audio camera plugdev input lpadmin netdev sudo; do
  case "`getent group $group 2>/dev/null || grep ^$group: /etc/group`" in
    '') ;;
    *$user*) ;;
    *)
      if usermod -aG $group $user 2>/dev/null || usermod -G $group $user; then
        echo "Adding to group '$group'."
      fi
      ;;
  esac
done

home="`su $user -c 'echo "$HOME"'`"
if [ ! -d "$home" ]; then
  echo "Warning: couldn't find a home in \"$home\"."
elif [ ! -x "$home/.local/bin/tpope" ]; then
  echo "Downloading dot files."
  webcat https://tpope.io/tgz | gzip -dc | su $user -c 'tar xf - -C "$HOME"'
  su $user -c '"$HOME/.local/bin/tpope" setup default cron'
  su $user -c 'cat > "$HOME/.ssh/known_hosts"' <<ssh_known_hosts
varys,varys.tpope,tpo.pe ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDmPW+EXP5IvUUqWOHA/TMrjHMPGuC4rSAQskxMZjL3g2K62gLgSWQqNUUtNyTzHErV/KmkzwncDTaOg6I+O1jzzShYkXqME1q8b3Wmxy56IIl54R3IP1L2LttYbIMshGSrn36aaQ7Iz7AhcwDE3oavlJAwLYB8aYBeUrs1T+ieaf/wnn+blKhzQr9UzhCTRcsw6xxuRhfyjqoBgZlUufhVhzTwCmxniRL0PL4nyqChVmWndb4z+1dPi8memnxLFjNYttge3G4qVJB8CyP0ZyWWo1ifc4uQJFlXvwyX9nQ4QKey2WP37/D4eO3lUtCdzkzUDqs4uLU4khO/MQiKZ5FJ
robert,robert.tpope,robert.tpope.net,home.tpope.org ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgwCWAz0XQ9FhB0GmnyHZ0nJGaxQwtMZpSJGSfL6vXsefKdJWJpqijY9YNCfWLZJM40i+y9ycdBbYW8ayMPbCv/bAWmbS4kv8m9O0XwDL3fRt/ZjX1e+Iihy5+lLVDS2ayQdCKqW0MbQm1geA7TEUf90IRCQd1LXl9lC+2lvxr/O9ap47
balon,balon.tpope,balon.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0XVeB0kPHaev31yPy4kwMMmHsX1JsIl7NHcswyfV4scq+wuGjKBE/SP56iWJmXTAuFsQPE8DI2EDTpBuZuznW+XnNJaE4h886OLvTnxaG6qE26cJwL/nCgil3twUeZPHTKHdJ4hkEiCcrJHhx9B2lCoWgQTye7AAf8dLnVmpwF1fJ3QSDjLOs1WARnBsf7bKX6u17of6iJVYIsTR4EWY9pUBsXB+Kc58T2ty5QpCVf11cYrEg5XL3t7NhCld9tCYApTPHBISzWFqKTIXMAbLIwfHhRXsdDV045hkrml2qhV+PepPJDKLkxHWaNunVQqHepd/aD/VPPbaSbSWdK44Nw==
walder,walder.tpope,walder.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCthAoKq0K06Zq/svV94A1bY39Dn8cpj0Oz+H1Jn9c6e7NWBODBBzXyXPptmhezNEtjHKNsEVlyKcMLvQZpCt02k4e9Tun+hymTn7MWkyzDOBW0xN80bGu73cXv7aVqyKqeF3gMI8w/NSXeODAu/X+dSpqPJQIipg5f+nxCZxPYGA64W2EJeNIl7Xr2k5yOTkvRzYlhy9e9ket1upjl9thqsDTigXm/4aAXH2ev9d6Rb+O9gsFh2xi0w3MMUmeRo1nXdhReiG6oGL/EU6dTWYDt+aaARWQN68xo3bFcquFE8aR0giwAf2uzQGgu96kkdRV7S6I+gvstQhzTGCj44IpB
aegon,aegon.tpope,aegon.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQKtI4BfdjAvaVMNJNziV8Vb5xFRoZEe4BczpwCEEDtrX/OlP/K7EzYUvJcakQUGHkX5ETOYaj3to+i3OckBLh0JxQlukcz9ozwQLoL2Mus2Oyb2Otz1bpAg1uspnnztet6cc5eEzqDxu0VraI3ZKXARLqkPWhZpbA9CArxU2kuORYJAgKibatXsZw/aEsQ8M7XckDlbheMK0uDWPS9JX2lS79QKW3/uUQe4ur9whHoTjWrj1/bIHRI3/OsYGg/vr41l563vvgwluqdhMojrOOpilbA0Em089WbDuX7+Sd2ItYK0eKBsJM6Is95jHZ3Duh5T8DI6Qn30Vk2GRKwRCh
tyrion,tyrion.tpope,tyrion.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtC9aSbMlK7NHdFxbLhI3rgZu+JLjKtXNKmHM69G/LyCIuH8elEnFDyPfzcC9/MNkQf7YRvK/k6Bs/jHoJ6pBqUDGkLBk2/RmEXTt1/4FKvDKi8q10TO/5wtfdr/PUKGmCck//5KK4Gzl2Rf1RhPr5NsDsTUryDkzHdJWTygh6o1Js7r0q63zicycVySd1PUShzq2MTJmJgJ6tI1tD1GRgyqPlqkTLpVfzvSnVy7HnSqiKhx2h0HFKUO9+/IS0Lj+Sq24ub6cqxw0i+8qRVqCeWmDZEfRZwDp/Fr8/RXzA0Gbj5+jtjRnbCzljA8Dk4Aosq/Hc8i2E+Fy6v0ObowTj root@tyrion
loras,loras.tpope,loras.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCk3P4eiadA8quQVwY5lruF03fRvx3/RKHPugquhwlZ5O9bys+CEeq7GEnAORCwq7KjLM20B08gV3e0yQam+QR/K8trtGn9CXX5+jqys6e0B+UyRL79aFsZo9XbzQUou5MNHIZh9iVHfl/3+r0ObPBRChDQB1eGspdxV0vmQfbAVRFqG4daUyveeMNMcpK+dX01MeGMa1eu0RRyLhNB+0pQqboOqv33nQ4l88ZwmTLHm27ERXLiYVwo1GxrU9WMDkkdMKR6l2nNBujcygU7M1YsbalxxCLLIUzqCJ8w1rHRnqCQ/NdSOZCV3JDwccGFn/H/TCjYYlSo8JAfQx/kDOCr
lancel,lancel.tpope,lancel.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCstoSn/jeUdJ1E56eDzXyo6RkfufkA96K1ZgjAnbzhUAXvoqR0na3P6f/WuSU5jzluAsv+3qMaoeI/Lez5d9Anjw5ikpx2BDJ2nBqhcqE8aMS2SJkvD1P8SCIfSTY6+ZJ+c/Qb+NrU1pDjZmTmk88HudaFTXnxKh9hjpYySPEHRi9yQDtDAhvBCDVfSY6WJ16aPADVx7GZiD4w5CjZYww5xgNwUKr86ZymNVsqQUlKtU0FqQFKkLpz9W6L7Xq9pPKenVWvGUMcVOMUNDkbcvh7URH0QMB5WlDAubfj+Bm4043bej5NsNrICGw5nbfZ82SxIa0J51WbPV8w+YoW/hjn
daenerys,daenerys.tpope,daenerys.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDN18MPfSRP9gPwy4NcEW/Wsa6OSFQ06JSJOa9gx+RIenA6lLOtDpEnNqlsnJU30tcSSC9MSvH36p8J8sJTez6c3gWAUUfhYz6zPxstYB//PGuHgF+etqHYzHgw0RYzkOjU/I1HCWFLinaHSPS0rSNInCkQHwtz2fQZP1LoYyZ5LiXzWLt4gOWisKZCh4xNvcFSsj6BYnGhdhbNvfF2+TlET/CVvGur62sPlAkSMKeEtceEoIyI7E05CaoUpYwXETIJtTrdbvHWx1DxW7V8UfQPsvVcP74r4/+yTyzR7rUarnLQGjl/9MHwz0HtfWSR+yUQ1hbWmB8WV9LwbI7ACjOz
ssh_known_hosts

fi

for cmd in screen; do
  if ! has $cmd; then
    packages="$packages $cmd"
  fi
done
[ -z "$packages" ] || yes | pkginstall $packages


else

home=${HOME%/.tpope}
HOME=$HOME/.tpope
SHELL=$shell
export HOME PATH SHELL
rm -rf /tmp/tpope
mkdir -p "$HOME"

ln -sf "$home" "$HOME/home"

if [ ! -f "$HOME/.sandbox" ]; then
  touch "$HOME/.sandbox"
  webcat https://tpope.io/tgz|gzip -dc|tar xf - -C "$HOME"
  cp "$home/.ssh/id"* "$HOME/.ssh" 2>/dev/null || true
  cat > "$HOME/.ssh/known_hosts" <<ssh_known_hosts
varys,varys.tpope,tpo.pe ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDmPW+EXP5IvUUqWOHA/TMrjHMPGuC4rSAQskxMZjL3g2K62gLgSWQqNUUtNyTzHErV/KmkzwncDTaOg6I+O1jzzShYkXqME1q8b3Wmxy56IIl54R3IP1L2LttYbIMshGSrn36aaQ7Iz7AhcwDE3oavlJAwLYB8aYBeUrs1T+ieaf/wnn+blKhzQr9UzhCTRcsw6xxuRhfyjqoBgZlUufhVhzTwCmxniRL0PL4nyqChVmWndb4z+1dPi8memnxLFjNYttge3G4qVJB8CyP0ZyWWo1ifc4uQJFlXvwyX9nQ4QKey2WP37/D4eO3lUtCdzkzUDqs4uLU4khO/MQiKZ5FJ
robert,robert.tpope,robert.tpope.net,home.tpope.org ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgwCWAz0XQ9FhB0GmnyHZ0nJGaxQwtMZpSJGSfL6vXsefKdJWJpqijY9YNCfWLZJM40i+y9ycdBbYW8ayMPbCv/bAWmbS4kv8m9O0XwDL3fRt/ZjX1e+Iihy5+lLVDS2ayQdCKqW0MbQm1geA7TEUf90IRCQd1LXl9lC+2lvxr/O9ap47
balon,balon.tpope,balon.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0XVeB0kPHaev31yPy4kwMMmHsX1JsIl7NHcswyfV4scq+wuGjKBE/SP56iWJmXTAuFsQPE8DI2EDTpBuZuznW+XnNJaE4h886OLvTnxaG6qE26cJwL/nCgil3twUeZPHTKHdJ4hkEiCcrJHhx9B2lCoWgQTye7AAf8dLnVmpwF1fJ3QSDjLOs1WARnBsf7bKX6u17of6iJVYIsTR4EWY9pUBsXB+Kc58T2ty5QpCVf11cYrEg5XL3t7NhCld9tCYApTPHBISzWFqKTIXMAbLIwfHhRXsdDV045hkrml2qhV+PepPJDKLkxHWaNunVQqHepd/aD/VPPbaSbSWdK44Nw==
walder,walder.tpope,walder.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCthAoKq0K06Zq/svV94A1bY39Dn8cpj0Oz+H1Jn9c6e7NWBODBBzXyXPptmhezNEtjHKNsEVlyKcMLvQZpCt02k4e9Tun+hymTn7MWkyzDOBW0xN80bGu73cXv7aVqyKqeF3gMI8w/NSXeODAu/X+dSpqPJQIipg5f+nxCZxPYGA64W2EJeNIl7Xr2k5yOTkvRzYlhy9e9ket1upjl9thqsDTigXm/4aAXH2ev9d6Rb+O9gsFh2xi0w3MMUmeRo1nXdhReiG6oGL/EU6dTWYDt+aaARWQN68xo3bFcquFE8aR0giwAf2uzQGgu96kkdRV7S6I+gvstQhzTGCj44IpB
aegon,aegon.tpope,aegon.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQKtI4BfdjAvaVMNJNziV8Vb5xFRoZEe4BczpwCEEDtrX/OlP/K7EzYUvJcakQUGHkX5ETOYaj3to+i3OckBLh0JxQlukcz9ozwQLoL2Mus2Oyb2Otz1bpAg1uspnnztet6cc5eEzqDxu0VraI3ZKXARLqkPWhZpbA9CArxU2kuORYJAgKibatXsZw/aEsQ8M7XckDlbheMK0uDWPS9JX2lS79QKW3/uUQe4ur9whHoTjWrj1/bIHRI3/OsYGg/vr41l563vvgwluqdhMojrOOpilbA0Em089WbDuX7+Sd2ItYK0eKBsJM6Is95jHZ3Duh5T8DI6Qn30Vk2GRKwRCh
tyrion,tyrion.tpope,tyrion.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtC9aSbMlK7NHdFxbLhI3rgZu+JLjKtXNKmHM69G/LyCIuH8elEnFDyPfzcC9/MNkQf7YRvK/k6Bs/jHoJ6pBqUDGkLBk2/RmEXTt1/4FKvDKi8q10TO/5wtfdr/PUKGmCck//5KK4Gzl2Rf1RhPr5NsDsTUryDkzHdJWTygh6o1Js7r0q63zicycVySd1PUShzq2MTJmJgJ6tI1tD1GRgyqPlqkTLpVfzvSnVy7HnSqiKhx2h0HFKUO9+/IS0Lj+Sq24ub6cqxw0i+8qRVqCeWmDZEfRZwDp/Fr8/RXzA0Gbj5+jtjRnbCzljA8Dk4Aosq/Hc8i2E+Fy6v0ObowTj root@tyrion
loras,loras.tpope,loras.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCk3P4eiadA8quQVwY5lruF03fRvx3/RKHPugquhwlZ5O9bys+CEeq7GEnAORCwq7KjLM20B08gV3e0yQam+QR/K8trtGn9CXX5+jqys6e0B+UyRL79aFsZo9XbzQUou5MNHIZh9iVHfl/3+r0ObPBRChDQB1eGspdxV0vmQfbAVRFqG4daUyveeMNMcpK+dX01MeGMa1eu0RRyLhNB+0pQqboOqv33nQ4l88ZwmTLHm27ERXLiYVwo1GxrU9WMDkkdMKR6l2nNBujcygU7M1YsbalxxCLLIUzqCJ8w1rHRnqCQ/NdSOZCV3JDwccGFn/H/TCjYYlSo8JAfQx/kDOCr
lancel,lancel.tpope,lancel.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCstoSn/jeUdJ1E56eDzXyo6RkfufkA96K1ZgjAnbzhUAXvoqR0na3P6f/WuSU5jzluAsv+3qMaoeI/Lez5d9Anjw5ikpx2BDJ2nBqhcqE8aMS2SJkvD1P8SCIfSTY6+ZJ+c/Qb+NrU1pDjZmTmk88HudaFTXnxKh9hjpYySPEHRi9yQDtDAhvBCDVfSY6WJ16aPADVx7GZiD4w5CjZYww5xgNwUKr86ZymNVsqQUlKtU0FqQFKkLpz9W6L7Xq9pPKenVWvGUMcVOMUNDkbcvh7URH0QMB5WlDAubfj+Bm4043bej5NsNrICGw5nbfZ82SxIa0J51WbPV8w+YoW/hjn
daenerys,daenerys.tpope,daenerys.tpope.net ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDN18MPfSRP9gPwy4NcEW/Wsa6OSFQ06JSJOa9gx+RIenA6lLOtDpEnNqlsnJU30tcSSC9MSvH36p8J8sJTez6c3gWAUUfhYz6zPxstYB//PGuHgF+etqHYzHgw0RYzkOjU/I1HCWFLinaHSPS0rSNInCkQHwtz2fQZP1LoYyZ5LiXzWLt4gOWisKZCh4xNvcFSsj6BYnGhdhbNvfF2+TlET/CVvGur62sPlAkSMKeEtceEoIyI7E05CaoUpYwXETIJtTrdbvHWx1DxW7V8UfQPsvVcP74r4/+yTyzR7rUarnLQGjl/9MHwz0HtfWSR+yUQ1hbWmB8WV9LwbI7ACjOz
ssh_known_hosts

  "$HOME/.local/bin/tpope" setup sandbox >/dev/null
fi

cat > "$HOME/.local/bin/shell" <<-EOF
#!/bin/sh
cd '$PWD'
exec env HOME="$HOME" SHELL="$SHELL" "$SHELL" "\$@"
EOF
chmod +x "$HOME/.local/bin/shell"

mkdir -p "$home/.local/bin"
[ -e "$home/.local/bin/tpopen" ] || ln -s "$HOME/.local/bin/tpopen" "$home/.local/bin/tpopen"
# proxy=$home/.local/bin/tpope
# if [ ! -r "$proxy" -o "`wc -l < $proxy`" -lt 20 ]; then
#   cat > "$proxy" <<-EOF
# #!/bin/sh
# exec env HOME="$HOME" SHELL="$SHELL" "$HOME/.local/bin/tpope" "\$@"
# EOF
#   chmod +x "$proxy"
# fi

. "$HOME/.profile" >/dev/null

if [ screen = "$1" -o "$#" -eq 0 ] && ! type screen >/dev/null 2>&1; then
  echo "warning: screen not installed" >&2
  exec $SHELL
elif [ "$#" -gt 0 ]; then
  exec "$@"
elif [ -z "$STY" -a -z "$TMUX" ]; then
  exec env SHELL="$HOME/.local/bin/shell" screen -xRR tpope
else
  exec $SHELL
fi <&1

fi
