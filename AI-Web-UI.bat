@echo off
setlocal

:::  ________  _______   ________   _______   ___      ___ ________  ___       _______   ________   ________  _______      
::: |\   __  \|\  ___ \ |\   ___  \|\  ___ \ |\  \    /  /|\   __  \|\  \     |\  ___ \ |\   ___  \|\   ____\|\  ___ \     
::: \ \  \|\ /\ \   __/|\ \  \\ \  \ \   __/|\ \  \  /  / | \  \|\  \ \  \    \ \   __/|\ \  \\ \  \ \  \___|\ \   __/|    
:::  \ \   __  \ \  \_|/_\ \  \\ \  \ \  \_|/_\ \  \/  / / \ \  \\\  \ \  \    \ \  \_|/_\ \  \\ \  \ \  \    \ \  \_|/__  
:::   \ \  \|\  \ \  \_|\ \ \  \\ \  \ \  \_|\ \ \    / /   \ \  \\\  \ \  \____\ \  \_|\ \ \  \\ \  \ \  \____\ \  \_|\ \ 
:::    \ \_______\ \_______\ \__\\ \__\ \_______\ \__/ /     \ \_______\ \_______\ \_______\ \__\\ \__\ \_______\ \_______\
:::     \|_______|\|_______|\|__| \|__|\|_______|\|__|/       \|_______|\|_______|\|_______|\|__| \|__|\|_______|\|_______|
::: 
:::  _____ ______   _______   ________   ________  ___  ________  ___  ___     
::: |\   _ \  _   \|\  ___ \ |\   ____\ |\   ____\|\  \|\   __  \|\  \|\  \    
::: \ \  \\\__\ \  \ \   __/|\ \  \___|_\ \  \___|\ \  \ \  \|\  \ \  \\\  \   
:::  \ \  \\|__| \  \ \  \_|/_\ \_____  \\ \_____  \ \  \ \   __  \ \   __  \  
:::   \ \  \    \ \  \ \  \_|\ \|____|\  \\|____|\  \ \  \ \  \ \  \ \  \ \  \ 
:::    \ \__\    \ \__\ \_______\____\_\  \ ____\_\  \ \__\ \__\ \__\ \__\ \__\
:::     \|__|     \|__|\|_______|\_________\\_________\|__|\|__|\|__|\|__|\|__|
:::                             \|_________\|_________|
:::  ________  ___                 ___       __   _______   ________                 ___  ___  ___     
::: |\   __  \|\  \               |\  \     |\  \|\  ___ \ |\   __  \               |\  \|\  \|\  \    
::: \ \  \|\  \ \  \  ____________\ \  \    \ \  \ \   __/|\ \  \|\ /_  ____________\ \  \\\  \ \  \   
:::  \ \   __  \ \  \|\____________\ \  \  __\ \  \ \  \_|/_\ \   __  \|\____________\ \  \\\  \ \  \  
:::   \ \  \ \  \ \  \|____________|\ \  \|\__\_\  \ \  \_|\ \ \  \|\  \|____________|\ \  \\\  \ \  \ 
:::    \ \__\ \__\ \__\              \ \____________\ \_______\ \_______\              \ \_______\ \__\
:::     \|__|\|__|\|__|               \|____________|\|_______|\|_______|               \|_______|\|__|

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

timeout /t 3

:: Install Bootstrap_Assets for faster initial audio loading.
echo ---------------------------------------------------------------
echo Downloading Bootstrap_Assets for faster initial audio loading!
git lfs install
git clone https://github.com/BenevolenceMessiah/Bootstrap_Assets.git Bootstrap_Assets
cd Bootstrap_Assets
git pull
cd ..

:: Play background music from Bootstrap_Assets
echo ---------------------------------------------------------------
cd Bootstrap_Assets
set "file=Benevolence Messiah - Amethyst Pocket (Part I).flac"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..

:: Install The initial audio assets for background music and soundbytes and update them.
echo ---------------------------------------------------------------
echo Downloading initial dependencies...
echo If you want to stop the audio during the initial dependencies install or at any time, you can run 'stop_audio.bat' in either the 'Bootstrap_Assets' or 'Audio_Assets'
git lfs install
git clone https://github.com/BenevolenceMessiah/Audio_Assets.git Audio_Assets
cd Audio_Assets
git pull
cd ..

echo ---------------------------------------------------------------
if not exist models mkdir models 

    echo As-salamu alaikum;
    echo Creating 'models' directory if one does not exist.
    echo Note 1: press 'ctrl+c' at any time to exit the script/stop a download.
    echo Note 2: you can open another instance of this .bat to facilitate simultaneous model downloads.
    echo Note 3: If something screws up at any point in time durong installation, usage, after a particularly goofy Windows update, or post-modifiaction of any files, just delete the corresponding 'venv' folder and run option I) again.
    echo Note 4: To stop the background audio, select option S). Alternatively, you can run the 'stop_audio.bat' script in the 'Audio_Assets' folder if you want to turn the audio off at any time or ptherwise forget to turn it off via the option in the Main Menu.
    echo Note 5: There is a standalone console launcher in the Audio_Assets folder as well rather than navigating around to switch songs or stop the music.
    echo Note 6: This program assumes you have Python 3.10.6 and Git installed!!! 
    echo https://www.python.org/ftp/python/3.10.6/python-3.10.6-amd64.exe
    echo https://github.com/git-for-windows/git/releases/download/v2.46.0.windows.1/Git-2.46.0-64-bit.exe
echo ---------------------------------------------------------------

:Menu1
echo Please choose from the following options:
echo ---------------------------------------------------------------
echo A) Download text generation AI models
echo B) Download image generation AI models
echo C) Exit
echo I) Install AI_Web_UI requirements
echo U) Update all downloaded models and dependencies
echo L) Launch...
echo S) Stop Audio
echo M) Switch Music
echo Z) Switch Music (Standalone CMD Window)
echo ---------------------------------------------------------------

set /P option=Enter your choice:
if %option% == A goto Menu2
if %option% == B goto Menu3
if %option% == C goto End
if %option% == I goto Installer
if %option% == U goto Updater
if %option% == L goto Menu4
if %option% == S goto StopAudio
if %option% == M goto SwitchMusic
if %option% == Z goto LaunchStandaloneMusic

:Menu2
echo Please choose from the following options:
echo ---------------------------------------------------------------
echo 1. Download Replete-Coder-Llama3-8B-Q8_0-GGUF
echo 2. Download Llama-3-Instruct-8B-SPPO-Iter3-Q8_0-GGUF
echo 3. Download gemma-2-9b-it-Q8_0-GGUF
echo 4. Download mpt-7b-storywriter-Q8_0-GGUF
echo 5. Download dolphin-2.6-mistral-7b-dpo-laser-Q8_0-GGUF
echo 6. Download internlm2_5-7b-chat-Q8_0-GGUF
echo 7. Launch gguf-my-repo (Tool that allows for the search and GGUF conversion of any Transformers model on HuggingFace).
echo C) Exit
echo M) Main Menu
echo U) Update all downloaded models
echo ---------------------------------------------------------------

set /P option=Enter your choice: 

if %option% == 1 goto option1
if %option% == 2 goto option2
if %option% == 3 goto option3
if %option% == 4 goto option4
if %option% == 5 goto option5
if %option% == 6 goto option6
if %option% == 7 goto option7
if %option% == C goto end
if %option% == M goto Menu1
if %option% == U goto Updater

:option1
echo Downloading Replete-Coder-Llama3-8B-Q8_0-GGUF
echo ---------------------------------------------------------------
cd models
git lfs install
git clone https://huggingface.co/BenevolenceMessiah/Replete-Coder-Llama3-8B-Q8_0-GGUF
cd ..
echo ---------------------------------------------------------------
:: Play background music from Audio_Assets
cd Audio_Assets
set "file=NEW D2.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
goto Menu1

:option2
echo Downloading Llama-3-Instruct-8B-SPPO-Iter3-Q8_0-GGUF
echo ---------------------------------------------------------------
cd models
git lfs install
git clone https://huggingface.co/BenevolenceMessiah/Llama-3-Instruct-8B-SPPO-Iter3-Q8_0-GGUF
cd ..
echo ---------------------------------------------------------------
:: Play background music from Audio_Assets
cd Audio_Assets
set "file=NEW D2.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
goto Menu1

:option3
echo Downloading gemma-2-9b-it-Q8_0-GGUF
echo ---------------------------------------------------------------
cd models
git lfs install
git clone https://huggingface.co/BenevolenceMessiah/gemma-2-9b-it-Q8_0-GGUF
cd ..
echo ---------------------------------------------------------------
:: Play background music from Audio_Assets
cd Audio_Assets
set "file=NEW D2.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
goto Menu1

:option4
echo Downloading mpt-7b-storywriter-Q8_0-GGUF
echo ---------------------------------------------------------------
echo Use your HuggingFace username as the username and paste your Github Download Access Token as the password.
cd models
git lfs install
git clone https://huggingface.co/BenevolenceMessiah/mpt-7b-storywriter-Q8_0-GGUF
cd ..
echo ---------------------------------------------------------------
:: Play background music from Audio_Assets
cd Audio_Assets
set "file=NEW D2.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
goto Menu1

:option5
echo Downloading dolphin-2.6-mistral-7b-dpo-laser-Q8_0-GGUF
echo Use your HuggingFace username as the username and paste your Github Download Access Token as the password.
echo ---------------------------------------------------------------
cd models
git lfs install
git clone https://huggingface.co/BenevolenceMessiah/dolphin-2.6-mistral-7b-dpo-laser-Q8_0-GGUF
cd ..
echo ---------------------------------------------------------------
:: Play background music from Audio_Assets
cd Audio_Assets
set "file=NEW D2.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
goto Menu1

:option6
echo Downloading internlm2_5-7b-chat-Q8_0-GGUF 
echo ---------------------------------------------------------------
cd models
git lfs install
git clone https://huggingface.co/BenevolenceMessiah/internlm2_5-7b-chat-Q8_0-GGUF
cd ..
echo ---------------------------------------------------------------
:: Play background music from Audio_Assets
cd Audio_Assets
set "file=NEW D2.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
goto Menu1

:option7
echo Lauching gguf-my-repo (once the browser launches, you can safely close the auxillary cmd window that pops up.)
echo ---------------------------------------------------------------
@echo off

start start https://huggingface.co/spaces/BenevolenceMessiah/gguf-my-repo-2
goto Menu1

:Menu3
echo Please choose from the following options:
echo ---------------------------------------------------------------
echo 1. Download ThePhotographer
echo 2. Download DreamPlace_ArchiGEN
echo 3. Download ATouchOfColor_ATC (LoRA)
echo 4. Download Brutalis (LoRA)
echo C) Exit
echo M) Main Menu
echo U) Update all downloaded models

set /P option=Enter your choice: 

if %option% == 1 goto option8
if %option% == 2 goto option9
if %option% == 3 goto option10
if %option% == 4 goto option11
if %option% == C goto end
if %option% == M goto Menu1
if %option% == U goto Updater

:option8
echo Downloading ThePhotographer
echo ---------------------------------------------------------------
cd models
if not exist Stable-diffusion mkdir Stable-diffusion
cd Stable-diffusion
git lfs install
git clone https://huggingface.co/Human23/ThePhotographer
cd ..
cd ..
echo ---------------------------------------------------------------
:: Play background music from Audio_Assets
cd Audio_Assets
set "file=Blackmoore.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
goto Menu1

:option9
echo Downloading DreamPlace_ArchiGEN
echo ---------------------------------------------------------------
cd models
if not exist Stable-diffusion mkdir Stable-diffusion
cd Stable-diffusion
git lfs install
git clone https://huggingface.co/Human23/DreamPlace_ArchiGEN
cd ..
cd ..
echo ---------------------------------------------------------------
:: Play background music from Audio_Assets
cd Audio_Assets
set "file=Blackmoore.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
goto Menu1

:option10
echo Downloading ATouchOfColor_ATC
echo ---------------------------------------------------------------
cd models
if not exist Lora mkdir Lora
cd Lora
git lfs install
git clone https://huggingface.co/Human23/ATouchOfColor_ATC
cd ..
cd ..
echo ---------------------------------------------------------------
:: Play background music from Audio_Assets
cd Audio_Assets
set "file=Blackmoore.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
goto Menu1

:option11
echo Downloading Brutalis
echo ---------------------------------------------------------------
cd models
if not exist Lora mkdir Lora
cd Lora
git lfs install
git clone https://huggingface.co/Human23/Brutalis
cd ..
cd ..
echo ---------------------------------------------------------------
:: Play background music from Audio_Assets
cd Audio_Assets
set "file=Blackmoore.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
goto Menu1

:Menu4
echo What do you want to launch?
echo (Everything is assigned to it's own port so you shouldn't have any problems running anything simultaneously - supposing your machine has the capacity to do that).
echo ---------------------------------------------------------------
echo 1. Launch Text Generation WebUI
echo 2. Launch Image Generation WebUI
echo 3. Launch LivePortrait
echo 4. Launch Everything!
echo C) Exit
echo M) Main Menu
echo U) Update all downloaded models

set /P option=Enter your choice: 

if %option% == 1 goto option19
if %option% == 2 goto option20
if %option% == 3 goto option21
if %option% == 4 goto option22
if %option% == C goto end
if %option% == M goto Menu1
if %option% == U goto Updater

:option19
echo Launching Text Generation WebUI!
echo ---------------------------------------------------------------
cd Text_Generation
start call start_windows.bat
cd ..
goto Menu1

:option20
echo Launching Image Generation WebUI!
echo ---------------------------------------------------------------
cd Stable_Diffusion
start call update.bat
start call run.bat
cd ..
goto Menu1

:option21
echo Launching LivePortrait WebUI!
echo ---------------------------------------------------------------
cd LivePortrait
start call run_windows.bat
cd ..
goto Menu1

:option22
echo Launching Everything!
echo ---------------------------------------------------------------
cd Text_Generation
start call start_windows.bat
cd ..
cd Stable_Diffusion
start call update.bat
start call run.bat
cd ..
cd LivePortrait
start call run_windows.bat
cd ..
goto Menu1

:OptionZ
echo Launching Standalone CMD console for music curation.
echo ---------------------------------------------------------------
cd Audio_Assets
start call launch_in_standalone_console.bat
cd ..
go to Menu1

:Updater
echo Updating all models!
ls | xargs -I{} git -C {} pull
echo ---------------------------------------------------------------
goto Menu1

:SwitchMusic
echo Select a new song!
echo ---------------------------------------------------------------
echo 1. Benevolence Messiah - Amethyst Pocket (Part I)
echo 2. Blackmoore - ?
echo 3. Soundscape Oblivion - Lunar Voyagers
echo 4. Ganja Lunar - Autumn Depression
echo 5. HARI - ?
echo 6. Blackmoore5050 and Benevolence Messiah - Hill Tops (Benevolence Messiah Remix)
echo 7. ?
echo S) Stop Audio
echo C) Exit
echo M) Main Menu
set /P option=Enter your choice:
if %option% == 1 goto option12
if %option% == 2 goto option13
if %option% == 3 goto option14
if %option% == 4 goto option15
if %option% == 5 goto option16
if %option% == 6 goto option17
if %option% == 7 goto option18
if %option% == S goto StopAudio
if %option% == C goto end
if %option% == M goto Menu1
:option12
cd Audio_Assets
Taskkill  /F /IM wscript.exe
set "file=Benevolence Messiah - Amethyst Pocket (Part I).flac"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
echo ---------------------------------------------------------------
goto SwitchMusic
:option13
cd Audio_Assets
Taskkill  /F /IM wscript.exe
set "file=Benevolence Messiah - Amethyst Pocket (Part I).flac"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
echo ---------------------------------------------------------------
goto SwitchMusic
:option14
cd Audio_Assets
Taskkill  /F /IM wscript.exe
set "file=Soundscape Oblivion - Lunar Voyagers.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
echo ---------------------------------------------------------------
goto SwitchMusic
:option15
cd Audio_Assets
Taskkill  /F /IM wscript.exe
set "file=Ganja Lunar - Autumn Depression.flac"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
echo ---------------------------------------------------------------
goto SwitchMusic
:option16
cd Audio_Assets
Taskkill  /F /IM wscript.exe
set "file=Benevolence Messiah - Amethyst Pocket (Part I).flac"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
echo ---------------------------------------------------------------
goto SwitchMusic
:option17
cd Audio_Assets
Taskkill  /F /IM wscript.exe
set "file=Blackmoore5050 and Benevolence Messiah - Hill Tops (Benvolence Messiah Remix).flac"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
echo ---------------------------------------------------------------
goto SwitchMusic
:option18
cd Audio_Assets
Taskkill  /F /IM wscript.exe
set "file=Blackmoore5050 and Benevolence Messiah - Hill Tops (Benvolence Messiah Remix).flac"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
echo ---------------------------------------------------------------
goto SwitchMusic

:StopAudio
echo stopping my music :(
Taskkill  /F /IM wscript.exe
echo ---------------------------------------------------------------  
goto Menu1

:Installer
echo This next portion of the script will install the 'AI_Web_UI.'
echo That is a fancy and somewhat bold attempt of mine to mash all this stuff together into one installer.
echo ---------------------------------------------------------------
pause

:: Create and activate a Python virtual environment for Text Generation AI
echo Creating virtual environment for text generation AI...
if not exist venv (
    py -3.10.6 -m venv venv_text_generation
) else (
    echo Existing venv detected. Activating.
)

echo Activating virtual environment
call venv_text_generation\Scripts\activate

:: Download Text Generation Dependencies
echo Downloading Text Generation dependencies...
git clone https://github.com/BenevolenceMessiah/text-generation-webui.git Text_Generation
cd Text_Generation
set PYTHON=
set GIT=
set VENV_DIR= venv_text_generation
set COMMANDLINE_ARGS=
start call deploy_full_windows.bat
cd ..
echo ---------------------------------------------------------------

:: Create and activate a Python virtual environment for Stable Diffusion
echo Creating virtual environment for image generation AI...
if not exist venv (
    python -m venv venv_image_generation
) else (
    echo Existing venv detected. Activating.
)

echo Activating virtual environment
call venv_stable_diffusion\Scripts\activate

:: Download Stable Diffusion Dependencies
echo Downloading Stable Diffusion dependencies...
git clone https://github.com/BenevolenceMessiah/stable-diffusion-webui.git Image_Generation
cd Image_Generation
set PYTHON= py -3.10
set GIT=
set VENV_DIR= venv_image_generation
set COMMANDLINE_ARGS=
start call webui.bat
cd ..

:: Download LivePortrait Dependencies
echo Downloading LivePortrait dependencies...
git clone https://github.com/BenevolenceMessiah/LivePortrait.git
cd LivePortrait
start call Run-ComfyUI.bat
cd ..

:: Download ComfyUI Dependencies
echo Downloading ComfyUI dependencies...
git clone https://github.com/BenevolenceMessiah/ComfyUI.git
cd ComfyUI
start call run_LivePortrait.bat
cd ..

:: Download Supermergekit Dependencies
echo Downloading Supermergekit dependencies...
git clone https://github.com/BenevolenceMessiah/Supermergekit.git
cd Supermergekit
start call run_Supermergekit.bat
cd ..
goto Menu1

pause

:: Install requirements from requirements.txt
echo ---------------------------------------------------------------
echo Installing python requirements from requirements.txt
pip install -r requirements.txt

:End 
echo ---------------------------------------------------------------
echo As-salamu alaykum!!
echo ---------------------------------------------------------------
pause
