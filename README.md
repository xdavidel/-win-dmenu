# win-dmenu

Dynamic menu for Windows - inspired by the [suckless](https://suckless.org/) [dmenu](https://tools.suckless.org/dmenu/).
This project is a form from [JerwuQu](https://github.com/JerwuQu/wlines)

### Usage

Menu entries are passed to dmenu through stdin. After the user has made a choice, the result is sent out through stdout.

Running `(echo hello & echo world & echo !) | dmenu` would for example bring up a menu like this: 

 ![Showing a menu of three items](images/menu_example.png)

The user can filter by writing in the textbox:

 ![A user filter said menu](images/filter_example.png)

The menu style and behavior can be customized through command-line arguments. Run `dmenu -h` for a list of these.

dmenu by itself doesn't do much. The power comes through using scripts that talk to it. suckless has [a list of examples of scripts that can be used with dmenu](https://tools.suckless.org/dmenu/scripts/). 

[Dave Davenport's](https://github.com/DaveDavenport) [rofi](https://github.com/DaveDavenport/rofi) (an alternative to dmenu) also has [such a list](https://github.com/DaveDavenport/rofi/wiki/User-scripts).

### System requirements

dmenu has been tested and works on unmodified Windows XP (32-bit) and Windows 10 (64-bit). As such, it should work on anything in-between as well.

### Build steps

1. Download the [Mingw Compiler](https://osdn.net/projects/mingw/releases/), installing it and adding to PATH. It is also possile (and recommanded) to use the [scoop](https://scoop.sh/) package manager : `scoop install gcc make`
2. Make sure `gcc.exe` and `make` is in your PATH.
3. Clone this repo (`git clone https://gitlab.com/xdavidel/win-dmenu.git`)
4. Run `make` 

### Build with TCC

The Tiny C Compiler can produce smaller size apps and compiles faster most of the time.

1. Download the [Tiny C Compiler](http://download.savannah.gnu.org/releases/tinycc/tcc-0.9.27-win32-bin.zip) and add the [WinApi headers](https://download.savannah.gnu.org/releases/tinycc/winapi-full-for-0.9.27.zip).
2. Patch `tcc/lib/gdi32.def` to also include `SetDCPenColor` and `SetDCBrushColor`. 
3. Make sure `tcc.exe` is in your PATH.
4. Clone this repo (`git clone https://githlab.com/xdavidel/win-dmenu.git`)
5. Run `maketcc.bat` 

### Credits

* [tcc](https://bellard.org/tcc/) - by [Fabrice Bellard](https://bellard.org/)

* [stretchy_buffer.h](https://github.com/nothings/stb/blob/master/stretchy_buffer.h) - by [Sean Barrett](https://github.com/nothings)
  
* [wlines](https://github.com/JerwuQu/wlines) - by [JerwuQu](https://github.com/JerwuQu)

### Contributing

All issues and PRs related to fixing bugs or other strange behavior are welcome. 

### License

This project is licensed under the GNU General Public License v3.0. See LICENSE for more details.
