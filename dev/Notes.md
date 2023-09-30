# Notes

To build FVWM3 on Fedora
## Depends for compiling FVWM3 for Fedora:
```bash
sudo dnf install libevent-devel libX11-devel libXrandr-devel libXt-devel libXft-devel asciidoctor fontconfig-devel ncurses-devel libpng-devel readline-devel  libSM-devel libXcursor-devel libXpm-devel xterm xdaliclock xscreensaver conky feh xwd
```

## Quick start compile and install fvwm3:
```bash
git clone 'https://github.com/fvwmorg/fvwm3'
cd fvwm3
./autogen.sh 
./configure --enable-mandoc
make
sudo make install
```

