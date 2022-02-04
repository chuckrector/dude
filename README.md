# Dude

Dude is an example of how to create a Windows installer for Electron apps with NSIS.  This one happens to use [SvelteKit](https://kit.svelte.dev/).  It displays a splash screen immediately, plays a sound effect, decompresses the Electron app, then launches it.

## Usage

_*Note:* You need [Node.js 16](https://nodejs.org/dist/v16.13.2/node-v16.13.2-x64.msi) or higher installed and its executables should be in your path._

Run `first_time.bat` and it will execute the following:

* `npm install` (downloads all the `node_modules` nonsense)
* `build.bat` (creates the production build)
* `make_dist.bat` (create the installer)
* `dude_install.exe` (run the installer, launch the app)

_*Note:* The installer plays a brief sound effect._

"Dude" and "Uninstall Dude" shortcuts will be added to the Start Menu.  It will always install into `%LOCALAPPDATA%\Dude`.  Uninstalling will remove both shortcuts and delete the local app data folder.

Other available scripts:

* `clean.bat` deletes the output of `build.bat` and `make_dist.bat`.
* `clean_all.bat` runs `clean.bat` and deletes the `node_modules` folder.
* `run.bat` launches the development server `https://localhost:3000` in a new browser window.
* `rune.bat` launches Electron with the production build.
* `runed.bat` launches the development server `https://localhost:3000` in the Electron app.
* `make_package.bat` is used by `make_dist.bat`.  It runs `electron-packager` to create a distributable folder.  It contains Electron and the production build.
* `make_zip.bat` is used by `make_dist.bat`.  It runs 7-Zip to compress the distributable folder, as prep for inclusion in the installer.
* `make_installer.bat` is used by `make_dist.bat`.  It runs NSIS to create the installer.
