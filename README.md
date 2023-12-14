# connect-iq

## Creating a Garmin watch-face 101 [^1]

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

![Screenshot 2023-11-26 024714](https://github.com/AndrewKhassapov/connect-iq/assets/53222142/ef6641dd-2bd2-4006-8368-9f0a3bd3f856)

### 4. Creating your first watch-face 🔨

4.1-A. Generate your **developer key** via command palette (Ctrl + Shift + P or Command + Shift + P) then typing "Generate a Deverloper Key" amd select Monkey C: Generate a Developer Key

![Screenshot 2023-11-26 024554](https://github.com/AndrewKhassapov/connect-iq/assets/53222142/bc510fca-3ff6-4df1-9e97-98a706ee2ef3)

4.1-B.

> [!NOTE]
> If you have a **developer key** then open Extensions, search **Monkey C**, select the Monkey C 'Manage' :gear: > 'Extension Settings', then update the **Monkey C: Developer Path Key** directory

![Screenshot 2023-11-26 025650](https://github.com/AndrewKhassapov/connect-iq/assets/53222142/ed410407-2e04-482d-8982-eabf5c66158e)

4.2. Create a new project via command palette, then typing "New Project" and select Monkey C: New Project

![Screenshot 2023-11-26 025824](https://github.com/AndrewKhassapov/connect-iq/assets/53222142/6316024d-a507-4955-868c-49b7a8987c30)

4.3. Name your project, for example "myWatchface"

![Screenshot 2023-11-26 030114](https://github.com/AndrewKhassapov/connect-iq/assets/53222142/608971f1-01d9-4917-8a1b-9ec4a26ce1e2)

4.4. Select 'Watch Face' > Select 'Simple' > Select your target API. eg. 3.0.0

![image](https://github.com/AndrewKhassapov/connect-iq/assets/53222142/e3e3aa16-9d0b-4beb-99c1-f3f5327853d7)

4.5. Select your watches to target. eg. We will select all.

![Screenshot 2023-11-26 031710](https://github.com/AndrewKhassapov/connect-iq/assets/53222142/ed0474ff-4ec1-4b6b-a0c7-1fb712392d2e)

4.6-A. Select a folder to save to. Visual Studio Code will open the new project.

> [!CAUTION]
> ❌ If the project does not open, including 'monkey.jungle' then move to the next step.
> ⚠️⏩ Otherwise skip the next step

4.6-B.

> [!NOTE]
> In Explorer, open your newly created directory in Visual Studio Code. eg. In 'myWatchFace' directory > Right click > Select Open With Code. Or open the 'monkey.jungle' file in Visual Studio Code

4.7. From the toolbar > Select Run > Run Without Debugging (Ctrl F5 or Command F5)

![Screenshot 2023-11-26 032721](https://github.com/AndrewKhassapov/connect-iq/assets/53222142/635c4c97-7b40-4e6e-a558-eb468f901f87)

4.8. Select Debugger > Monkey C. Then select your test watch. eg. Venu 3.

4.9. Congratulations! You have created and tested your watch-face!🎆[^3]

### 5. Next steps: Developing your first watch-face 💻

5.1. To change watch-face visuals > Update the '/resources/layouts/layout.xml' file.

> [!TIP]
> Most Garmin devices set (x, y) = (0, 0) as the top left corner of the stage.
> With the stage range as **([0, screenWidth], [0, screenHeight])**.
>
> ![image](https://github.com/AndrewKhassapov/connect-iq/assets/53222142/a3f06502-7dbd-4893-9403-f727c63af5f0)

5.2. To add functionality > Update the '/source/\*.mc' files.

> [!TIP]
> Refer to the [Monkey-C programming language reference guide](https://developer.garmin.com/connect-iq/reference-guides/monkey-c-reference/).

### 6. Building your watch-face 🛠️

6.1. In Visual Studio Code > summon the command palette (Ctrl + Shift + P or Command + Shift + P)

6.2. Type 'Build for Device' > select Monkey C: Build for Device

6.3. Select your device. eg Venu 3 > Select a directory to build to. eg. Create a 'build' folder > Select 'build' folder

![image](https://github.com/AndrewKhassapov/connect-iq/assets/53222142/d183617d-265c-4b61-9623-86c550a9c04b)

6.4. In Explorer > Open your 'build' folder > Locate the **.prg** file. eg. myWatchface.prg

6.5. With your Garmin watch > Connect to your device via USB

6.6. Copy your **.prg** watch-face to your Garmin device > 'GARMIN/Apps' folder

6.7. Disconnect your Garmin watch > On your Garmin watch > Select your watch-face

6.8. Congratulations! You have built a fully-functioning Garmin watch-face!🎆🎆🎆

---

> Footnotes:
>
> [^1]: Valid as of December 15, 2023. Using Visual Studio Code as recommended IDE [^2] by Garmin.
> [^2]: I know Visual Studio Code isn't an "Intergrated Development Environment" itself. Let's call it VS Code with Java JDK, Garmin IQ SDK and Monkey-C extension. OS agnostic.
> [^3]: Official documentation available at [Garmin](https://developer.garmin.com/connect-iq/connect-iq-basics/getting-started/).
