clc
clear all
close all


% inp=input('ENTER IMAGE :');

imgg=imread('test1.jpg');

aa=imgg;

[m n c]=size(aa);

if c==3
b=rgb2gray(aa);
else
b=aa;
end

im =b;


figure,
imshow(aa)
title('input ')

matlabroot='C:\Users\ACTIVE GALAXY\Downloads\upload (2)'

DatasetPath = fullfile(matlabroot,'fundusdeeplearning','Dataset1');
Data = imageDatastore(DatasetPath, ...
        'IncludeSubfolders',true,'LabelSource','foldernames');
     
CountLabel = Data.countEachLabel;

trainData=Data;

%% Define the Network Layers
% Define the convolutional neural network architecture. 
layers = [imageInputLayer([336 448 3])
          convolution2dLayer(5,20)
          reluLayer
          maxPooling2dLayer(2,'Stride',2)
          convolution2dLayer(5,20)
          reluLayer
          maxPooling2dLayer(2,'Stride',2)
          fullyConnectedLayer(2)
          softmaxLayer
          classificationLayer()];
options = trainingOptions('sgdm','MaxEpochs',15, ...
	'InitialLearnRate',0.0001);  

convnet = trainNetwork(trainData,layers,options);

%% Classify the Images in the Test Data and Compute Accuracy
% Run the trained network on the test set that was not used to train the
% network and predict the image labels (digits).
img =imgg;
img=imresize(img,[336 448]);
size(img)
outt = classify(convnet,img);


 tf1=[]
for  ii=1:2
    st=int2str(ii)
tf = ismember(outt,st);

tf1=[tf1 tf];

end

out=find(tf1==1);

ss=sprintf('THE CLASS IS  : %2f ',round((out)));


if out==1
    msgbox('NORMAL')
    elseif out==2
    msgbox('AB NORMAL') 
end
    
 
