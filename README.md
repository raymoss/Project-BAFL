# Project-BAFL
Ball follower robot using MATLAB

**DESCRIPTION**:

In this project , we are building a footballer robot whos motive is to find a red ball in green background and put the ball inside the goalpost.
The hardware consists of a bot base with stepper motors, Arduino board with Adafruit MotorDriver shield and a webcam. We have connected the arduino board and the webcam to a laptop running MATLAB program.
The project uses ImageProcessing toolkit in MATLAB to identify the ball in the background. For this purpose , the rgb image is first converted to binary image and then various filters are applied to it to get a noise free image.
Later on , the image is divided into various regions of interest using regionprops and centroid of each region is calculated.Then the bot is rotated so that it is inline with the ball and then made to move towards it.

