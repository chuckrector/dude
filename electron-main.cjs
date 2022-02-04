let ChildProcess = require('child_process');
let Path = require('path');
let Electron = require('electron');
let ElectronServe = require('electron-serve');
let MainWindow;

let ServeURL = ElectronServe({directory: 'build'});

Electron.app.whenReady().then(() =>
{
    let PrimaryDisplay = Electron.screen.getPrimaryDisplay();
    let Size = ~~(PrimaryDisplay.size.width * 0.4);
    MainWindow = new Electron.BrowserWindow(
    {
        width:  Size,
        height: Size,
    });

    if(process.argv.includes('--dev'))
    {
        function Connect()
        {
            ChildProcess.exec('call node_modules/.bin/svelte-kit dev', function MaybeRetry(Error)
            {
                if(('' + Error).includes('already in use'))
                {
                    console.log('Port in use. Retrying...');
                    Connect();
                }
                else if(Error)
                {
                    console.error('Unexpected error.', Error);
                }
            });
        }
        Connect();
        MainWindow.loadURL('http://localhost:3000/');
        MainWindow.webContents.openDevTools();
    }
    else
    {
        ServeURL(MainWindow);
    }
});
