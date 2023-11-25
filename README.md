# connect-iq

### Creating a Garmin watch-face 101

You've got yourself a fancy new Garmin watch ⌚.
Hooray!
After spending ~~4~~ ~~8~~ ~~12~~ 24 hours playing around with new watchfaces and apps, yuo decide to create your own custom watchface.

### Step 1. Garmin IQ SDK

Download the [Garmin IQ SDK](https://developer.garmin.com/connect-iq/sdk/) using the SDK Manager.

### 2. Visual Studio Code

Install [Visual Studio Code](https://code.visualstudio.com/Download)

### 3. Installing the Visual Studio Code Monkey C Extension:

3.1. In Visual Studio Code, go to
**View > Extensions**

3.2. In the Extensions Marketplace, search box type "**Monkey C**"
3.3. Select the Monkey C extension from Garmin.
3.4. Use the Install button to install the extension in Visual Studio Code. This will require a restart of Visual Studio Code.
3.5. After Visual Studio Code restarts, summon the command palette with Ctrl + Shift + P (Command + Shift + P on Mac).
3.6. Type "Verify Installation" and select Monkey C: Verify Installation

### 4. Creating your first watch-face

4.1A. Generate your **developer key** via command palette (Ctrl + Shift + P or Command + Shift + P) then typing "Generate a Deverloper Key" amd se;ect Monkey C: Generate a Developer Key
4.1B. If you have a **developer key** then open Extensions, search **Monkey C**, select the Monkey C 'Manage' :gear: > 'Extension Settings', then update the **Monkey C: Developer Path Key** directory.
4.2. Create a new project via command palette, then typing "New Project" and select Monkey C: New Project
4.3. Name your project, for example "myWatchface".

[] TODO: Complete instructions
