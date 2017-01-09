%Initialization code
vid=videoinput('winvideo',1);
set(vid,'FramesPerTrigger',1)
triggerconfig(vid,'manual')
bot=arduino();
shield=addon(a,'Adafruit/MotorShieldV2');
smL=stepper(shield,1,200,'RPM',10);
smR=stepper(shield,2,200,'RPM',10);
%10 steps rotation causes bot to move by 5 degree
while(1)
   img=getsnapshot(vid);
   %imshow(img)
   y=detect_ball(img);
   if y==0
       move(smL,10)
       pause(0.5)
       continue
   else
       % ball is detected
       stats=regionprops(y,'centroid');
       ballx=stats.Centroid(1);
       bally=stats.Centroid(2);
       %calculate angle 
       botx=720;
       boty=640; %We are considering the coordinate of bot as the middle of 
       vectorA=[(botx-ballx),(boty-bally),5];
       vectorB=[(botx-360),(boty-640),5];
       angle=atan2d(norm(cross(vectorA,vectorB)),dot(vectorA,vectorB));
       if angle>=5
           move(smR,10)
           pause(1)
       elseif angle<=-5
           move(smL,10)
           pause(1)
       else 
           move(smR,10)
           move(smL,10)
           pause(1)
       end    
       disVector=[ballx bally;0 640];
       distance=dis(disVector);
       if distance>=5
           continue
       else
           break
       end
   end     
end

