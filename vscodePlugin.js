```javascript
const vscode = require('vscode');
const path = require('path');
const fs = require('fs');

function activate(context) {
    let disposable = vscode.commands.registerCommand('extension.createSyntheticGoldToken', function () {
        const terminal = vscode.window.createTerminal(`Synthetic Gold Token Terminal`);

        terminal.sendText(`cd ${vscode.workspace.rootPath}`);
        terminal.sendText(`npm install`);
        terminal.sendText(`npm start`);
        terminal.show();

        vscode.window.showInformationMessage('Synthetic Gold Token is being created...');
    });

    context.subscriptions.push(disposable);

    let disposable2 = vscode.commands.registerCommand('extension.deploySyntheticGoldToken', function () {
        const terminal = vscode.window.createTerminal(`Synthetic Gold Token Deployment Terminal`);

        terminal.sendText(`cd ${vscode.workspace.rootPath}`);
        terminal.sendText(`docker build -t synthetic-gold-token .`);
        terminal.sendText(`kubectl apply -f kubernetes.yaml`);
        terminal.show();

        vscode.window.showInformationMessage('Synthetic Gold Token is being deployed...');
    });

    context.subscriptions.push(disposable2);
}

function deactivate() {}

module.exports = {
    activate,
    deactivate
}
```
