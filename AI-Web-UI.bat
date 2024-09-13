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
if exist Bootstrap_Assets goto Launch
echo ---------------------------------------------------------------
echo Downloading Bootstrap_Assets for faster initial audio loading!
git lfs install
git clone https://github.com/BenevolenceMessiah/Bootstrap_Assets.git Bootstrap_Assets
cd Bootstrap_Assets
git pull
cd ..

:: Play background music from Bootstrap_Assets
:Launch
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
if exist Audio_Assets goto Launch2
echo ---------------------------------------------------------------
echo Downloading initial dependencies...
echo If you want to stop the audio during the initial dependencies install or at any time, you can run 'stop_audio.bat' in either the 'Bootstrap_Assets' or 'Audio_Assets'
git lfs install
git clone https://github.com/BenevolenceMessiah/Audio_Assets.git Audio_Assets
cd Audio_Assets
git pull
cd ..

:Launch2
echo ---------------------------------------------------------------
if not exist models mkdir models 

    echo As-salamu alaikum;
    echo Creating 'models' directory if one does not exist.
    echo ---------------------------------------------------------------
    echo                               Notes:
    echo Note 1: press 'ctrl+c' at any time to exit the script/stop a download.
    echo Note 2: you can open another instance of this .bat to facilitate simultaneous model downloads.
    echo Note 3: If something screws up at any point in time durong installation, usage, after a 
    echo         particularly goofy Windows update, or post-modifiaction of any files, just delete 
    echo         the corresponding 'venv' folder and run option I) again.
    echo Note 4: To stop the background audio, select option S). Alternatively, you can run the
    echo         'stop_audio.bat' script in the 'Audio_Assets' folder if you want to turn the audio off
    echo         at any time or ptherwise forget to turn it off via the option in the Main Menu.
    echo Note 5: There is a standalone console launcher in the Audio_Assets folder as well rather than
    echo         navigating around to switch songs or stop the music.
    echo Note 6: This program assumes you have Python 3.10.6 and Git installed!!! 
    echo         https://www.python.org/ftp/python/3.10.6/python-3.10.6-amd64.exe
    echo         https://github.com/git-for-windows/git/releases/download/v2.46.0.windows.1/Git-2.46.0-64-bit.exe
    echo         - If you don't have one or either of these installed, either paste these URLs into your browser or,
    echo           even easier, use option 'B' from the following Main Menu. In any case, with Python, make sure to
    echo           set PATH.
    echo ---------------------------------------------------------------
timeout /t -1    
goto Menu1


:Menu1
echo ---------------------------------------------------------------
echo            Please choose from the following options:          
echo ---------------------------------------------------------------
echo X) Install/reinstall/fix Python and Git. (Only do this if you don't have these installed
echo    or in the event you encounter errors related to Python or Git.)
echo A) Download text generation AI models
echo B) Download image generation AI models
echo C) Exit
echo I) Install AI_Web_UI requirements
echo U) Update all downloaded models, repos, and dependencies
echo L) Launch...
echo S) Stop Audio
echo M) Switch Music
echo Z) Switch Music (Standalone CMD Window)
echo ---------------------------------------------------------------

set /P option=Enter your choice:
if %option% == X goto Python/GitInstall
if %option% == A goto Menu2
if %option% == B goto Menu3
if %option% == C goto End
if %option% == I goto Installer
if %option% == U goto Updater
if %option% == L goto Menu4
if %option% == S goto StopAudio
if %option% == M goto SwitchMusic
if %option% == Z goto LaunchStandaloneMusic

:Python/GitInstall
echo ---------------------------------------------------------------
echo As-salamu alaykum!!
echo What do you need to install?
echo ---------------------------------------------------------------
echo 9) Install Git.
echo 10) Install Python 3.10. (Make sure to enable PATH)!
echo M) Main Menu
echo R) Restart the .bat file (do this after installing either or both of these).
echo C) Exit
echo ---------------------------------------------------------------

set /P option=Enter your choice:
if %option% == 9 goto GitInstall
if %option% == 10 goto PythonInstall
if %option% == R goto RestartCMD
if %option% == M goto Menu1
if %option% == C goto End

:GitInstall
echo Installing Git...
echo ---------------------------------------------------------------
cd /d %~dp0
call curl "https://github.com/git-for-windows/git/releases/download/v2.46.0.windows.1/Git-2.46.0-64-bit.exe" -o Git-2.46.0-64-bit.exe
start call Git-2.46.0-64-bit.exe
goto Python/GitInstall

:PythonInstall
echo Installing Python 3.10...
echo ---------------------------------------------------------------
cd /d %~dp0
call curl "https://www.python.org/ftp/python/3.10.6/python-3.10.6-amd64.exe" -o python-3.10.6-amd64.exe
start call python-3.10.6-amd64.exe
goto Python/GitInstall

:RestartCMD
echo Restarting...
echo Deleting installer .exe files if they exist...
echo ---------------------------------------------------------------
if exist Git-2.46.0-64-bit.exe del Git-2.46.0-64-bit.exe
if exist python-3.10.6-amd64.exe del python-3.10.6-amd64.exe
start call AI-Web-UI.bat
exit

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
echo ---------------------------------------------------------------
echo What do you want to launch?
echo (Everything is assigned to it's own port so you shouldn't have any problems running
echo anything simultaneously - supposing your machine has the capacity to do that).
echo ---------------------------------------------------------------
echo               Generative Text/Multimodal Web UI's:
echo 1) Launch Text Generation WebUI (A Gradio web UI for Large Language Models.)
echo B) Launch torchchat (Via Streamlit web app.)
echo ---------------------------------------------------------------
echo                   Generative Image Web UI's:
echo 2) Launch Image Generation WebUI (A web interface for Stable Diffusion, implemented
echo    using Gradio library.)
echo 3) Launch LivePortrait (Efficient portrait animation with stitching and retargeting 
echo    control.)
echo 4) Launch ComfyUI (This UI will let you design and execute advanced stable diffusion 
echo    pipelines using a graph/nodes/flowchart based interface.)
echo ---------------------------------------------------------------
echo             Training/Finetuning/Extraction/Converting:
echo 5) Launch Supermergekit (All-in-one integrated and standalone mergekit, Supermerger,
echo    unsloth, RVC client, and associated training, extraction, and finetuning tools.)
echo 6) Launch mergekit remotley via Google Colab Notebook.
echo 7) Launch mergekit remotley via HuggingFace Spaces.
echo 8) Launch gguf-my-repo remotely via HuggingFace Spaces (Tool that 
echo    allows for the search and GGUF conversion of any Transformers model on Huggingface.)
echo 9) Launch unsloth remotely via Google Colab Notebook.
echo ---------------------------------------------------------------
echo                           AI Agents:
echo 10) Launch AutoGPT (a powerful tool that lets you create and run intelligent
echo     agents. These agents can perform various tasks automatically, making your 
echo     life easier.)
echo 11) Launch AgentK (The autoagentic AGI. AgentK is a self-evolving AGI made
echo     of agents that collaborate, and build new agents as needed, in order 
echo     to complete tasks for a user.)
echo 12) Launch self-hosted-ai-starter-kit (an open, docker compose template that
echo     quickly bootstraps a fully featured Local AI and Low Code development
echo     environment.)
echo 13) Launch LeRobot (State-of-the-art AI for real-world robotics.)
echo 14) Launch gptme (Interact with an LLM assistant directly in your terminal and/or web
echo     UI in a Chat-style interface. With tools so the assistant can run shell commands, execute
echo     code, read/write files, and more, enabling them to assist in all kinds of
echo     development and terminal-based work.)
echo ---------------------------------------------------------------
echo                    Datasets/Scrapers/Crawlers:
echo 15) Launch Firecrawler 
echo 16) Launch ScrapeMaster
echo 17) Launch ???
echo ---------------------------------------------------------------
echo                             Extra:
echo 18) Launch Distrubted Llama (split the workload of LLMs across multiple devices and
echo     achieve a significant speedup. Distributed Llama allows you to run huge LLMs in-house.
echo     The project uses TCP sockets to synchronize the state. You can easily configure your AI
echo     cluster by using a home router.)
echo 100) Launch Everything!
echo C) Exit
echo M) Main Menu
echo U) Update all downloaded models
echo Z) Switch Music (Standalone CMD Window)
echo ---------------------------------------------------------------

set /P option=Enter your choice: 

if %option% == 1 goto option19
if %option% == 2 goto option20
if %option% == 3 goto option21
if %option% == 100 goto option22
if %option% == 4 goto option23
if %option% == 5 goto option24
if %option% == 6 goto option25
if %option% == 7 goto option26
if %option% == 8 goto option27
if %option% == 9 goto option28
if %option% == 10 goto option29
if %option% == 11 goto option30
if %option% == 12 goto option31
if %option% == 13 goto option32
if %option% == 14 goto option33
if %option% == 15 goto option34
if %option% == 16 goto option35
if %option% == 17 goto option36
if %option% == 18 goto option37
if %option% == C goto end
if %option% == M goto Menu1
if %option% == U goto Updater
if %option% == Z goto LaunchStandaloneMusic

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
cd ComfyUI
start call Run_ComfyUI.bat
cd ..
cd Supermergekit
start call run_Supermergekit.bat
cd ..
cd AutoGPT
start call Run_AutoGPT.bat
cd ..
cd AgentK
start call Run_AgentK.bat
cd ..
cd self-hosted-ai-starter-kit
start call self-hosted-ai-starter-kit.bat
cd ..
cd lerobot
start call Run_lerobot.bat
cd ..
goto Menu1

:option23
echo Launching ComfyUI!
echo ---------------------------------------------------------------
cd ComfyUI
start call Run_ComfyUI.bat
cd ..
goto Menu1

:option24
echo Launching Supermergekit!
echo ---------------------------------------------------------------
cd Supermergekit
start call run_Supermergekit.bat
cd ..
goto Menu1

:option25
echo Launching mergekit remotley via Google Colab Notebook.
echo ---------------------------------------------------------------
start start https://colab.research.google.com/drive/1TcXuBLbGMsuDazv5eEuVc7rgXVNKsJ__
goto Menu1

:option26
echo Running mergekit-gui via HuggingFace
echo ---------------------------------------------------------------
start start https://huggingface.co/spaces/arcee-ai/mergekit-gui
goto Menu1

:option27
echo Launching gguf-my repo
echo ---------------------------------------------------------------
start start https://huggingface.co/spaces/BenevolenceMessiah/gguf-my-repo-2
goto Menu1

:option28
echo Launching unsloth
echo ---------------------------------------------------------------
start start https://colab.research.google.com/drive/1Ys44kVvmeZtnICzWz0xgpRnrIOjZAuxp?usp=sharing
goto Menu1

:option29
echo Launching AutoGPT
echo ---------------------------------------------------------------
cd AutoGPT
start call Run_AutoGPT.bat
cd ..
goto Menu1

:option30
echo Launching AgentK
echo ---------------------------------------------------------------
cd AgentK
start call Run_AgentK.bat
cd ..
goto Menu1

:option31
echo Launching self-hosted-ai-starter-kit
echo ---------------------------------------------------------------
cd self-hosted-ai-starter-kit
start call elf-hosted-ai-starter-kit.bat
cd ..
goto Menu1

:option32
echo Launching LeRobot
echo ---------------------------------------------------------------
cd lerobot
start call Run_lerobot.bat
cd ..
goto Menu1

:option33
echo Launching gptme
echo ---------------------------------------------------------------
cd gptme
start call Run_gptme.bat
cd ..
goto Menu1

:option34
echo Launching Distributed Llama
echo ---------------------------------------------------------------
cd distributed-llama
start call Run_distributed-llama.bat
cd ..
goto Menu1

:LaunchStandaloneMusic
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
::echo Creating virtual environment for text generation AI...
::if not exist venv (
::    py -3.10 -m venv venv_text_generation
::) else (
::    echo Existing venv detected. Activating.
::)

::echo Activating virtual environment
::call venv_text_generation\Scripts\activate

:: Download Text Generation Dependencies
echo Downloading Text Generation dependencies...
echo                   Text Generation WebUI: 
echo (A Gradio web UI for Large Language Models.)
echo ---------------------------------------------------------------
echo 1) Continue Installation
echo 2) Skip Installation
set /P option=Enter your choice:
if %option% == 1 goto Continue1
if %option% == 2 goto Skip1
:Continue1
git clone https://github.com/BenevolenceMessiah/text-generation-webui.git Text_Generation
cd Text_Generation
git pull
:: set PYTHON=
:: set GIT=
:: set VENV_DIR= .venv_Text_Generation
:: set COMMANDLINE_ARGS=
start call deploy_full_windows.bat
cd ..
echo ---------------------------------------------------------------

:: Create and activate a Python virtual environment for Stable Diffusion
::echo Creating virtual environment for image generation AI...
::if not exist venv (
::    python -m venv venv_image_generation
::) else (
::    echo Existing venv detected. Activating.
::)

::echo Activating virtual environment
::call venv_stable_diffusion\Scripts\activate

:: Download Stable Diffusion Dependencies
:Skip1
echo Downloading Stable Diffusion dependencies...
echo                 Image Generation WebUI:
echo (A web interface for Stable Diffusion, implemented
echo using Gradio library.)
echo ---------------------------------------------------------------
echo 1) Continue Installation
echo 2) Skip Installation
set /P option=Enter your choice:
if %option% == 1 goto Continue2
if %option% == 2 goto Skip2
:Continue2
git clone https://github.com/BenevolenceMessiah/stable-diffusion-webui.git Image_Generation
cd Image_Generation
git pull
set PYTHON= py -3.10
set GIT=
set VENV_DIR= .venv
set COMMANDLINE_ARGS= --reinstall-xformers
start call webui.bat
cd ..
echo ---------------------------------------------------------------

:Skip2
:: Download LivePortrait Dependencies
echo Downloading LivePortrait dependencies...
echo                      LivePortrait:
echo (Efficient portrait animation with stitching and retargeting 
echo control.)
echo ---------------------------------------------------------------
echo 1) Continue Installation
echo 2) Skip Installation
set /P option=Enter your choice:
if %option% == 1 goto Continue3
if %option% == 2 goto Skip3
:Continue3
git clone https://github.com/BenevolenceMessiah/LivePortrait.git
:: set VENV_DIR= .venv_LivePortrait
cd LivePortrait
start call run_LivePortrait.bat
git pull
cd ..
echo ---------------------------------------------------------------

:Skip3
:: Download ComfyUI Dependencies
echo Downloading ComfyUI dependencies...
echo                          ComfyUI:
echo (This UI will let you design and execute advanced stable diffusion 
echo pipelines using a graph/nodes/flowchart based interface.)
echo ---------------------------------------------------------------
echo 1) Continue Installation
echo 2) Skip Installation
set /P option=Enter your choice:
if %option% == 1 goto Continue4
if %option% == 2 goto Skip4
:Continue4
git clone https://github.com/BenevolenceMessiah/ComfyUI.git
:: set VENV_DIR= .venv_ComfyUI
cd ComfyUI
git pull
start call Run-ComfyUI.bat
cd ..
echo ---------------------------------------------------------------

:Skip4
:: Download Supermergekit Dependencies
echo Downloading Supermergekit dependencies...
echo                       Supermergekit:
echo (All-in-one integrated and standalone mergekit, Supermerger, unsloth, 
echo RVC client, and associated training, extraction, and finetuning tools.)
echo !!                               !!
echo !!(Highly Recommended to Install)!!
echo !!                               !!
echo ---------------------------------------------------------------
echo 1) Continue Installation
echo 2) Skip Installation
set /P option=Enter your choice:
if %option% == 1 goto Continue5
if %option% == 2 goto Skip5
:Continue5
git clone https://github.com/BenevolenceMessiah/Supermergekit.git
cd Supermergekit
git pull
start call run_Supermergekit.bat
cd ..
echo ---------------------------------------------------------------

:Skip5
:: Download AutoGPT Dependencies
echo Downloading AutoGPT dependencies...
echo                          AutoGPT:
echo (A powerful tool that lets you create and run intelligent
echo agents. These agents can perform various tasks automatically, making your 
echo life easier.)
echo ---------------------------------------------------------------
echo 1) Continue Installation
echo 2) Skip Installation
set /P option=Enter your choice:
if %option% == 1 goto Continue6
if %option% == 2 goto Skip6
:Continue6
git clone https://github.com/BenevolenceMessiah/AutoGPT.git
cd AutoGPT
git pull
start call Run_AutoGPT.bat
cd ..
echo ---------------------------------------------------------------

:Skip6
:: Download AgentK Dependencies
echo Downloading AgentK dependencies...
echo                            AgentK:
echo (The autoagentic AGI. AgentK is a self-evolving AGI made
echo of agents that collaborate, and build new agents as needed, in order 
echo to complete tasks for a user.)
echo ---------------------------------------------------------------
echo 1) Continue Installation
echo 2) Skip Installation
set /P option=Enter your choice:
if %option% == 1 goto Continue7
if %option% == 2 goto Skip7
:Continue7
git clone https://github.com/BenevolenceMessiah/AgentK.git
cd AgentK
git pull
start call Run_AgentK.bat
cd ..
echo ---------------------------------------------------------------

:Skip7
:: Download self-hosted-ai-starter-kit Dependencies
echo Downloading self-hosted-ai-starter-kit dependencies...
echo                 self-hosted-ai-starter-kit:
echo (An open, docker compose template that quickly bootstraps a fully featured
echo Local AI and Low Code development environment.)
echo ---------------------------------------------------------------
echo 1) Continue Installation
echo 2) Skip Installation
set /P option=Enter your choice:
if %option% == 1 goto Continue8
if %option% == 2 goto Skip8
:Continue8
git clone https://github.com/BenevolenceMessiah/self-hosted-ai-starter-kit.git
cd self-hosted-ai-starter-kit
git pull
start call Run_self-hosted-ai-starter-kit.bat
cd ..
echo ---------------------------------------------------------------

:Skip8
:: Download LeRobot Dependencies
echo Downloading LeRobot dependencies...
echo                             LeRobot:
echo (State-of-the-art AI for real-world robotics.)
echo ---------------------------------------------------------------
echo 1) Continue Installation
echo 2) Skip Installation
set /P option=Enter your choice:
if %option% == 1 goto Continue9
if %option% == 2 goto Skip9
:Continue9
git clone https://github.com/BenevolenceMessiah/lerobot.git
cd lerobot
git pull
start call Run_lerobot.bat
cd ..
echo ---------------------------------------------------------------

:Skip9
:: Download gptme Dependencies
echo Downloading gptme dependencies...
echo                           gptme:
echo (Interact with an LLM assistant directly in your terminal and/or web
echo UI in a Chat-style interface. With tools so the assistant can run shell commands, execute
echo code, read/write files, and more, enabling them to assist in all kinds of
echo development and terminal-based work.)
echo ---------------------------------------------------------------
echo 1) Continue Installation
echo 2) Skip Installation
set /P option=Enter your choice:
if %option% == 1 goto Continue10
if %option% == 2 goto Skip10
:Continue10
git clone https://github.com/BenevolenceMessiah/gptme.git
cd gptme
git pull
start call Run_gptme.bat
cd ..
echo ---------------------------------------------------------------


:Skip10
:: Download Distributed Llama Dependencies
echo Downloading Distributed Llama dependencies...
echo                     Distributed Llama:
echo (Split the workload of LLMs across multiple devices and
echo achieve a significant speedup. Distributed Llama allows you to run huge LLMs in-house.
echo The project uses TCP sockets to synchronize the state. You can easily configure your AI
echo cluster by using a home router.)
echo ---------------------------------------------------------------
echo 1) Continue Installation
echo 2) Skip Installation
set /P option=Enter your choice:
if %option% == 1 goto Continue11
if %option% == 2 goto Skip11
:Continue11
git clone https://github.com/BenevolenceMessiah/distributed-llama.git
cd distributed-llama
git pull
start call Run_distributed-llama.bat
cd ..
echo ---------------------------------------------------------------

:Skip11
:: Download torchchat Dependencies
echo Downloading torchchat dependencies...
echo                     torchchat:
echo a small codebase showcasing the ability to run large language models (LLMs)
echo seamlessly. With torchchat, you can run LLMs using Python, within your own 
echo (C/C++) application (desktop or server) and on iOS and Android.
echo ---------------------------------------------------------------
echo 1) Continue Installation
echo 2) Skip Installation
set /P option=Enter your choice:
if %option% == 1 goto Continue12
if %option% == 2 goto Skip12
:Continue12
git clone https://github.com/BenevolenceMessiah/torchchat.git
cd torchchat
git pull
start call Run_torchchat.bat
cd ..
echo ---------------------------------------------------------------

:Skip12
:: Download CogVideo-Toolkit Dependencies
echo Downloading CogVideo-Toolkit dependencies...
echo                     CogVideo-Toolkit:
echo CogVideoX is an open-source version of the video generation model originating
echo from QingYing. This Toolkit utilizes the various python modules for CLI and 
echo Gradio inferences using either a 2b or 5b parameter model.
echo ---------------------------------------------------------------
echo 1) Continue Installation
echo 2) Skip Installation
set /P option=Enter your choice:
if %option% == 1 goto Continue13
if %option% == 2 goto Skip13
:Continue13
git clone https://github.com/BenevolenceMessiah/CogVideo-Toolkit.git
cd CogVideo-Toolkit
git pull
start call Run_CogVideo-Toolkit.bat
cd ..
echo ---------------------------------------------------------------

echo Base installations completed!
echo All selected installer files launched!
echo ---------------------------------------------------------------
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
