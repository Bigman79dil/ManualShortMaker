Made by: Bigman79dil



What you need



FFmpeg (installed and added to your system Path)



Install



Open PowerShell as an Administrator, paste the following command, and press 'Enter'. It will check your system and only install the software you are missing:



```powershell

\# Install missing system tools via Winget

if (!(Get-Command ffmpeg -ErrorAction SilentlyContinue)) { echo "Installing FFmpeg..."; winget install Gyan.FFmpeg --silent }

```



Instructions



1\. Put your long video inside the folder and name it `input.mp4`.

2\. edit the start file name to what you want e.g. \[(hr)00)(min)12)(sec)56] - start 

3\. edit the end file name to what you want e.g. \[(hr)00)(min)13)(sec)14] - end

4\. Double click run.bat 2 time to start it (wont take long)

5\. Check the `output` folder for your finished `short\_form.mp4` video.

6\. Double-click `clear.bat` whenever you want to delete the clip and reset.



