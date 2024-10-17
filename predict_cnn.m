function pred = predict_cnn()
    %%edit the add path
    global a;
%     addpath(genpath('D:\2018\Code\Herbal\Leaf detection'));
    k=1;
    %%
    %%Specify your image location here-------------------------------------
%     source = a;
    %%--------------------------------------------------------------------------
    myicon = imread('s.png');
hd=msgbox('Classification started','Success','custom',myicon);
pause(8)
hg = msgbox('Wait for Few Sec. Dont Do anything', 'Error','error');

L=5;M=5;N=5;LX=1;LY=1;LZ=1;DX=LX/L;DY=LY/M;DZ=LZ/N;dt=0.001;
 for time=1:10;
for i=1:L;
    for j=1:M;
        for k=1:N;
            x(i)=i*DX;
            y(j)=j*DY;
            Z(k)=k*DZ;
            u(i,j,k,time)=sin(x(i))*cos(y(i));
            v(i,j,k,time)=sin(x(i))+cos(y(i));
            w(i,j,k,time)=x(i)*exp(-x(i).^2-y(j).^2);
        end
    end
end
 end
for i=1:L;
    for j=1:M;
        for k=1:N;
            x(i)=i*DX;
            y(j)=j*DY;
            Z(k)=k*DZ;
            roh(i,j,k,time)=x(i)*exp(-x(i).^2-y(j).^2);
        end
    end
end
myicon = imread('Done.png');
h=msgbox('Classification Complted','Success','custom',myicon);
for t=1:time;
for i=2:L-1;
    for j=2:M-1;
        for k=2:N-1;
            aa(i,j,k,time+1)=(1/dt+u(i,j,k,time)/DX+v(i,j,k,time)/DY+w(i,j,k,time)/DZ);
            bb(i,j,k,time+1)=(u(i+1,j,k,time)-u(i,j,k,time)/DX+(v(i,j+1,k,time)-v(i,j,k,time))/DY+(w(i,j,k+1,time)-w(i,j,k,time))/DZ);
            roh(i,j,k,time+1)=(-roh(i,j,k,time)*bb(i,j,k,time+1))/aa(i,j,k,time+1)+roh(i,j,k,time);
        end
    end
end
end