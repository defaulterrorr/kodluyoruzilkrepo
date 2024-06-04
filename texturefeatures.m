texturefeatures.m
function dokular = texturefeatures(img)

fonksiyonlar=cell(1,4,14);
sonfonks=zeros(1,2,14);

epsilon=10^-6;



I=rgb2gray(img);
offsets = [0 1; -1 1;-1 0;-1 -1];a=[0 0 0 0];
P=cell(size(a));f1=cell(size(a));f2=cell(size(a));f3=cell(size(a));f4=cell(size(a));
f5=f4;f6=f5;f7=f6;f8=f7;f9=f8;f10=f9;f11=f10;f12=f11;f13=f12;f14=f13;
 GLCMSS=cell(1,4);
 glcmsss = graycomatrix(I,'NumLevels',16,'Offset',offsets);

 Ng=16;tempsums=a;

   for i=1:4
       GLCMSS{i}=glcmsss(:,:,i);
       
       
       f1{i}=0;f2{i}=0;f3{i}=0;f4{i}=0;
   end
   
   for k=1:4
       tempsums(k)=sum(sum(GLCMSS{k}));
       tempGLCMS=GLCMSS{k};tempP=GLCMSS{k};
   for i=1:Ng
       for j=1:Ng
          tempP(i,j)=(tempGLCMS(i,j)/tempsums(k));
       end
   end
              P{k}=tempP;
   end
   
       
   for k=1:4
           tempP=P{k};f1{k}=0;
       for i=1:Ng
           for j=1:Ng
               sumP=(tempP(i,j))^2;
               f1{k}=f1{k}+sumP;
           end
       end
   end
      



   for k=1:4
       tempP=P{k};f2{k}=0;
   for n=1:Ng-1
       
       for i=1:Ng
           for j=1:Ng
              if abs(i-j)==n
                 sumP= (tempP(i,j))*n^2;
               f2{k}=f2{k}+sumP;
              end
               
           end
       end
    
   end
   end

tempEx=0;tempEy=0; tempEx2=0;tempEy2=0; Exs=a;Eys=a;Exs2=a;Eys2=a;
varxx=a;varyy=a; stdxx=a;stdyy=a;
 for k=1:4
    tempP=P{k};
    for i=1:Ng
    tempPhorizontal=tempP(i,:);
    tempPvertical=tempP(:,i);
    sumtempPhorizontal=sum(tempPhorizontal);
    sumtempPvertical=sum(tempPvertical);
    tempsumtempPhorizontal=(i-1)*sumtempPhorizontal;tempsumtempPhorizontal2=((i-1).^2)*sumtempPhorizontal;
    tempsumtempPvertical=(i-1)*sumtempPvertical;tempsumtempPvertical2=((i-1).^2)*sumtempPvertical;
     tempEx=tempsumtempPhorizontal+tempEx;tempEx2=tempsumtempPhorizontal2+tempEx2;
     tempEy=tempsumtempPvertical+tempEy;tempEy2=tempsumtempPvertical2+tempEy2;
    end
    Exs(k)=tempEx; Exs2(k)=tempEx2;
    Eys(k)=tempEy; Eys2(k)=tempEy2;
    varxx(k)=Exs2(k)-(Exs(k)).^2;
    varyy(k)=Eys2(k)-(Eys(k)).^2;
    stdxx(k)=sqrt(varxx(k));
    stdyy(k)=sqrt(varyy(k));
    tempEx=0;tempEy=0;tempEx2=0;tempEy2=0;
    
     E(k)=mean([mean(Exs(k)) mean(Eys(k))]);
     
 end
   mux=mean(Exs);muy=mean(Eys);
     
 
 for k=1:4
     tempP=P{k};f3{k}=0;
     for i=1:Ng
         for j=1:Ng
             tempf3=((i*j)*tempP(i,j));
             f3{k}=tempf3+f3{k};
         end
     end
      f3{k}=((f3{k})-mux*muy)/(stdxx(k).*stdyy(k));
 end
 
 
 for k=1:4 
     tempP=P{k};f4{k}=0;f5{k}=0;
     for i=1:Ng
         for j=1:Ng
            tempf4=((i-E(k))^2)*tempP(i,j);
            tempf5=(1/(1+(i-j)^2))*tempP(i,j);
            f4{k}=f4{k}+tempf4;
            f5{k}=f5{k}+tempf5;
         end
     end
 end
 tempPxplusy=zeros(1,2*Ng);tempPxminusy=zeros(1,Ng);
   Pxplusy=cell(1,4);Pxminusy=cell(1,4);
 
 for t=1:4 
    tempP=P{t}; Pxplusy{t}=0;Pxminusy{t}=0;
  
     for i=1:Ng
         for j=1:Ng
               for k=2:2*Ng
     if (i+j)==k
         tempxy=tempP(i,j);
         tempPxplusy(k)=tempPxplusy(k)+tempxy;
     end
             if abs(i-j)==k-2
                 tempxy=tempP(i,j);
                 tempPxminusy(k-1)=tempPxminusy(k-1)+tempxy;
             end
               end
         
         end 
    end
    Pxplusy{t}=tempPxplusy;
    Pxminusy{t}=tempPxminusy;
    tempPxplusy=zeros(1,2*Ng);tempPxminusy=zeros(1,Ng);
 end
 
 for k=1:4
     tempxy=Pxplusy{k};f6{k}=0;
 for i=2:2*Ng
     sumtempxy=i*tempxy(i);
     f6{k}=f6{k}+sumtempxy;
 end
 end
 
 for k=1:4
     tempxy=Pxplusy{k};f8{k}=0;
     for i=2:2*Ng

         sumptempxy=tempxy(i)*log10(tempxy(i)+epsilon);
         f8{k}=f8{k}+sumptempxy;
          
     end
     f8{k}=f8{k}*(-1);
 end
 
 for k=1:4
     tempxy=Pxplusy{k};f7{k}=0;tempf8=f8{k};
     for i=2:2*Ng
         sumptempxy=((i-tempf8)^2)*tempxy(i);
         f7{k}=f7{k}+sumptempxy;
     end
 end
 

 for k=1:4
     tempP=P{k};f9{k}=0;
     for i=1:Ng
         for j=1:Ng

                 sumP=tempP(i,j)*log10(tempP(i,j)+epsilon);
             f9{k}=f9{k}+sumP;
             
         end
     end
     f9{k}=f9{k}*(-1);
 end
  
 for k=1:4
     tempxy=Pxminusy{k};f10{k}=0;
     f10{k}=var(tempxy);
 end

  
  for k=1:4
     tempxy=Pxminusy{k};f11{k}=0;
     for i=1:Ng

             sumP=tempxy(i)*log10(tempxy(i)+epsilon);
         f11{k}=f11{k}+sumP;
         
     end
     f11{k}=f11{k}*(-1);
  end
  tempPx=zeros(1,Ng);Px=cell(1,4);sumtempPx=0;
  for k=1:4
      tempP=P{k};
  for i=1:Ng
  for j=1:Ng
      sumP=tempP(i,j);
      sumtempPx=sumtempPx+sumP;
  end
     tempPx(i)=sumtempPx;
     sumtempPx=0;
  end
  Px{k}=tempPx;
  end
  
  tempPy=zeros(1,Ng);Py=cell(1,4);sumtempPy=0;
  for k=1:4
      tempP=P{k};
  for j=1:Ng
  for i=1:Ng
      sumP=tempP(i,j);
      sumtempPy=sumtempPy+sumP;
  end
     tempPy(j)=sumtempPy;
     sumtempPy=0;
  end
  Py{k}=tempPy;
  end
  HXY=cell(1,4);HX=HXY;HY=HX;HXY1=HX;HXY2=HX;
 HXorHYmax=HX;
for k=1:4
     tempPx=Px{k};tempPy=Py{k};HX{k}=0;HY{k}=0;
     tempP=P{k};HXY1{k}=0;HXY2{k}=0;
     for i=1:Ng

         sumPx=tempPx(i)*log10(tempPx(i)+epsilon); 
         HX{k}=HX{k}+sumPx;

              sumPy=tempPy(i)*log10(tempPy(i)+epsilon);
              HY{k}=HY{k}+sumPy;
        
         
         for j=1:Ng

         tempHXY1=tempP(i,j)*log10(tempPx(i)*tempPy(j)+epsilon);
         tempHXY2=(tempPx(i)*tempPy(j))*log10((tempPx(i)*tempPy(j))+epsilon);
         HXY1{k}=HXY1{k}+tempHXY1;
         HXY2{k}=HXY2{k}+tempHXY2;
             
             
         end
    
     end 
     HX{k}=HX{k}*(-1);HY{k}=HY{k}*(-1);
     HXY{k}=f9{k};
     HXY1{k}=HXY1{k}*(-1);
     HXY2{k}=HXY2{k}*(-1);
end

  for k=1:4
      tempHX=HX{k};tempHY=HY{k};
      HXorHYmax{k}=max([tempHX tempHY]);
      f12{k}=((HXY{k}-HXY1{k})/HXorHYmax{k});
      
      f13{k}=(1-exp((-2)*(HXY2{k}-HXY{k})))^(1/2);
  end
  Q=zeros(16,16);
  for k=1:4
     tempPx=Px{k};tempPy=Py{k};tempP=P{k}; f14{k}=0;
   for i=1:Ng
       for j=1:Ng
         if (tempPx(i)<=9*10^-6)
            tempPx(i)=epsilon; 
         end
     if (tempPy(k)<=9*10^-6)
            tempPy(k)=epsilon;
     end
     Q(i,j)=(tempP(i,k)*tempP(j,k))/(tempPx(i)*tempPy(k));
       end
   end
     temp1=sum(sum(Q));
     
     f14{k}=sqrt(temp1);
  end
    

   for k=1:4
      tempf=f1{k}; fonksiyonlar{1,k,1}=tempf;  tempf=f2{k}; fonksiyonlar{1,k,2}=tempf;
       tempf=f3{k}; fonksiyonlar{1,k,3}=tempf;  tempf=f4{k}; fonksiyonlar{1,k,4}=tempf;
      tempf=f5{k}; fonksiyonlar{1,k,5}=tempf;  tempf=f6{k}; fonksiyonlar{1,k,6}=tempf;
      tempf=f7{k}; fonksiyonlar{1,k,7}=tempf;  tempf=f8{k}; fonksiyonlar{1,k,8}=tempf;
      tempf=f9{k}; fonksiyonlar{1,k,9}=tempf;  tempf=f10{k}; fonksiyonlar{1,k,10}=tempf;
      tempf=f11{k}; fonksiyonlar{1,k,11}=tempf;  tempf=f12{k}; fonksiyonlar{1,k,12}=tempf;
      tempf=f13{k}; fonksiyonlar{1,k,13}=tempf;  tempf=f14{k}; fonksiyonlar{1,k,14}=tempf;
   end
 
    tempfa=f1{1};tempfb=f1{2};tempfc=f1{3};tempfd=f1{4}; tempmean=mean([tempfa tempfb tempfc tempfd]);sonfonks(1,1,1)=tempmean;
      rang=(max([tempfa tempfb tempfc tempfd])-min([tempfa tempfb tempfc tempfd]));sonfonks(1,2,1)=rang;
      
      tempfa=f2{1};tempfb=f2{2};tempfc=f2{3};tempfd=f2{4}; tempmean=mean([tempfa tempfb tempfc tempfd]);sonfonks(1,1,2)=tempmean;
      rang=(max([tempfa tempfb tempfc tempfd])-min([tempfa tempfb tempfc tempfd]));sonfonks(1,2,2)=rang;
      
       tempfa=f3{1};tempfb=f3{2};tempfc=f3{3};tempfd=f3{4}; tempmean=mean([tempfa tempfb tempfc tempfd]);sonfonks(1,1,3)=tempmean;
       rang=(max([tempfa tempfb tempfc tempfd])-min([tempfa tempfb tempfc tempfd]));sonfonks(1,2,3)=rang;
      
       tempfa=f4{1};tempfb=f4{2};tempfc=f4{3};tempfd=f4{4}; tempmean=mean([tempfa tempfb tempfc tempfd]);sonfonks(1,1,4)=tempmean;
       rang=(max([tempfa tempfb tempfc tempfd])-min([tempfa tempfb tempfc tempfd]));sonfonks(1,2,4)=rang;
      
      tempfa=f5{1};tempfb=f5{2};tempfc=f5{3};tempfd=f5{4}; tempmean=mean([tempfa tempfb tempfc tempfd]);sonfonks(1,1,5)=tempmean;
      rang=(max([tempfa tempfb tempfc tempfd])-min([tempfa tempfb tempfc tempfd]));sonfonks(1,2,5)=rang;
      
      tempfa=f6{1};tempfb=f6{2};tempfc=f6{3};tempfd=f6{4}; tempmean=mean([tempfa tempfb tempfc tempfd]);sonfonks(1,1,6)=tempmean;
      rang=(max([tempfa tempfb tempfc tempfd])-min([tempfa tempfb tempfc tempfd]));sonfonks(1,2,6)=rang;
      
      tempfa=f7{1};tempfb=f7{2};tempfc=f7{3};tempfd=f7{4}; tempmean=mean([tempfa tempfb tempfc tempfd]);sonfonks(1,1,7)=tempmean;
      rang=(max([tempfa tempfb tempfc tempfd])-min([tempfa tempfb tempfc tempfd]));sonfonks(1,2,7)=rang;
      
      tempfa=f8{1};tempfb=f8{2};tempfc=f8{3};tempfd=f8{4}; tempmean=mean([tempfa tempfb tempfc tempfd]);sonfonks(1,1,8)=tempmean;
      rang=(max([tempfa tempfb tempfc tempfd])-min([tempfa tempfb tempfc tempfd]));sonfonks(1,2,8)=rang;
      
      tempfa=f9{1};tempfb=f9{2};tempfc=f9{3};tempfd=f9{4}; tempmean=mean([tempfa tempfb tempfc tempfd]);sonfonks(1,1,9)=tempmean;
      rang=(max([tempfa tempfb tempfc tempfd])-min([tempfa tempfb tempfc tempfd]));sonfonks(1,2,9)=rang;
      
      tempfa=f10{1};tempfb=f10{2};tempfc=f10{3};tempfd=f10{4}; tempmean=mean([tempfa tempfb tempfc tempfd]);sonfonks(1,1,10)=tempmean;
      rang=(max([tempfa tempfb tempfc tempfd])-min([tempfa tempfb tempfc tempfd]));sonfonks(1,2,10)=rang;
      
     tempfa=f11{1};tempfb=f11{2};tempfc=f11{3};tempfd=f11{4}; tempmean=mean([tempfa tempfb tempfc tempfd]);sonfonks(1,1,11)=tempmean;
      rang=(max([tempfa tempfb tempfc tempfd])-min([tempfa tempfb tempfc tempfd]));sonfonks(1,2,11)=rang;
      
      tempfa=f12{1};tempfb=f12{2};tempfc=f12{3};tempfd=f12{4}; tempmean=mean([tempfa tempfb tempfc tempfd]);sonfonks(1,1,12)=tempmean;
      rang=(max([tempfa tempfb tempfc tempfd])-min([tempfa tempfb tempfc tempfd]));sonfonks(1,2,12)=rang;
      
      tempfa=f13{1};tempfb=f13{2};tempfc=f13{3};tempfd=f13{4}; tempmean=mean([tempfa tempfb tempfc tempfd]);sonfonks(1,1,13)=tempmean;
      rang=(max([tempfa tempfb tempfc tempfd])-min([tempfa tempfb tempfc tempfd]));sonfonks(1,2,13)=rang;
      
      tempfa=f14{1};tempfb=f14{2};tempfc=f14{3};tempfd=f14{4}; tempmean=mean([tempfa tempfb tempfc tempfd]);sonfonks(1,1,14)=tempmean;
      rang=(max([tempfa tempfb tempfc tempfd])-min([tempfa tempfb tempfc tempfd]));sonfonks(1,2,14)=rang;
      
  
 
 yeni1=zeros(1,14);yeni2=yeni1;
for i =1:14
        x=sonfonks(1,1,i);y=sonfonks(1,2,i);
        yeni1(i)=x;yeni2(i)=y;
end


        dokular=[yeni1 yeni2];
 
end
 
 
 
 