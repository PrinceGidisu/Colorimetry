load('spectral_data.mat');

%%
figure;
% Graph 1
plot(lambda,reflectances);
ylim([0,1]);
xlim([350,800]);
xlabel('Wavelenght(nm)');
ylabel('Reflectance');
title('Graph 1 of Reflectance of three unknown object Against Wavelength')

figure;
% Graph 2
plot(lambda(:,:),reflectances(:,1),'blue',lambda(:,:),reflectances(:,2),'g',lambda(:,:),reflectances(:,3),'red');
ylim([0,1]);
xlim([350,800]);
xlabel('Wavelenght(nm)');
ylabel('Reflectance');
title('Graph 2 of Reflectance of three object Against Wavelength')
legend('blue','green','red')

% From the "Graph 1"ploted I noticed a peak at the lambda 450 nm which is
% close to the color Blue and the second line proudeced a peak at 550nm
% which I can attribute to Green and the third line peaked from 650 -
% 800m, which I attribute to red. The plot was redrawn for the lines to
% represents their matching wavelength in Graph 2

%%
load("CMFs.mat")

x2deg = cmf2deg(:,1)./(cmf2deg(:,1) + cmf2deg(:,2) +  cmf2deg(:,3));
y2deg = cmf2deg(:,2)./(cmf2deg(:,1) + cmf2deg(:,2) +  cmf2deg(:,3));
x10deg = cmf10deg(:,1)./(cmf10deg(:,1) + cmf10deg(:,2) +  cmf10deg(:,3));
y10deg = cmf10deg(:,2)./(cmf10deg(:,1) + cmf10deg(:,2) +  cmf10deg(:,3));

figure;

plot(x2deg,y2deg,'blue',[x2deg(1,1),x2deg(end,1)],[y2deg(1,1),y2deg(end,1)],'blue',x10deg,y10deg,'red',[x10deg(1,1),x10deg(end,1)],[y10deg(1,1),y10deg(end,1)],'red')
title('Graph 3 The spectrum locus Chromacity Diagram')
xlabel('x');
ylabel('y');
legend('CIE 1931 2°','','CIE 1964 10°','')

%%
load ("illuminants.mat")

figure;plotChromaticity;
% illuminant A = Tungsten Bulb 
% illuminat D50 = Daylight in the morning 
%illuminant D65 = Daylight in the afternoon
%illuminant F12 = a certain filament Bulb 
XYZillA = 683*illA'*cmf2deg;
%XYZillA = 683*illA'*cmf2deg;
XYZillA = XYZillA./XYZillA(:,2);
xillA(:,1) = XYZillA(:,1)/(XYZillA(:,1)+ XYZillA(:,2) + XYZillA(:,3));
yillA(:,2) = XYZillA(:,1)/(XYZillA(:,1)+ XYZillA(:,2) + XYZillA(:,3));
hold on 

XYZillD50 = 683*illD50'*cmf2deg;
XYZillD50 = XYZillD50./XYZillD50(:,2);
xillD50(:,1) = XYZillD50(:,1)/(XYZillD50(:,1)+ XYZillD50(:,2) + XYZillD50(:,3));
yillD50(:,2) = XYZillD50(:,1)/(XYZillD50(:,1)+ XYZillD50(:,2) + XYZillD50(:,3));

XYZillD65 = 683*illD65'*cmf2deg;
XYZillD65 = XYZillD65./XYZillD65(:,2);
xillD65(:,1) = XYZillD65(:,1)/(XYZillD65(:,1)+ XYZillD65(:,2) + XYZillD65(:,3));
yillD65(:,2) = XYZillD65(:,1)/(XYZillD65(:,1)+ XYZillD65(:,2) + XYZillD65(:,3));

XYZillF12 = 683*illF12'*cmf2deg;
XYZillF12 = XYZillF12./XYZillD65(:,2);
xillF12(:,1) = XYZillF12(:,1)/(XYZillF12(:,1)+ XYZillF12(:,2) + XYZillF12(:,3));
yillF12(:,2) = XYZillF12(:,1)/(XYZillF12(:,1)+ XYZillF12(:,2) + XYZillF12(:,3));


scatter(xillA(:,1),yillA(:,2),'ko');
scatter(xillD50(:,1),yillD50(:,2),'b^');
scatter(xillD65(:,1),yillD65(:,2),'rs');
scatter(xillF12(:,1),yillF12(:,2),'rp');
title('Graph 4 The spectrum locus Chromacity Diagram with Specific illuminants')
xlabel('x');
ylabel('y');
legend('illuminace F12','illuminance A','illuminace D50','illuminace D65')
%%

load("planckian_locus.mat")

radA = reflectances.*illA;

XYZradA=683*radA'*cmf2deg;
xradA(:,1)= XYZradA(:,1)./(XYZradA(:,1)+XYZradA(:,2)+XYZradA(:,3));
yradA(:,2)= XYZradA(:,2)./(XYZradA(:,1)+XYZradA(:,2)+XYZradA(:,3));
figure;plotChromaticity;  
hold on;
scatter(xradA(:,1),yradA(:,2),'mo','filled');
plot(xradA(:,1),xyradA(:,2),'m',[xradA(1,1),xradA(end,1)],[yradA(1,1),yradA(end,1)],'m')
%line(planckian_locus(:,2),planckian_locus(:,3), 'Color','black');

% Radiance of D50
radD50 = reflectances.*illD50;

XYZradD50=683*radD50'*cmf2deg;
xradD50(:,1)= XYZradD50(:,1)./(XYZradD50(:,1)+XYZradD50(:,2)+XYZradD50(:,3));
yradD50(:,2)= XYZradD50(:,2)./(XYZradD50(:,1)+XYZradD50(:,2)+XYZradD50(:,3));


scatter(xradD50(:,1),yradD50(:,2),'b<','filled');
plot(xradD50(:,1),yradD50(:,2),'b',[xradD50(1,1),xradD50(end ,1)],[yradD50(1,1),yradD50(end,1)],'b')

%line(planckian_locus(:,2),planckian_locus(:,3), 'Color','blue');

% Radiance of D65
radD65 = reflectances.*illD65;

XYZradD65=683*radD65'*cmf2deg;
xradD65(:,1)= XYZradD65(:,1)./(XYZradD65(:,1)+XYZradD65(:,2)+XYZradD65(:,3));
yradD65(:,2)= XYZradD65(:,2)./(XYZradD65(:,1)+XYZradD65(:,2)+XYZradD65(:,3));

scatter(xradD65(:,1),yradD65(:,2),'^r' ,'filled');

%line(planckian_locus(:,2),planckian_locus(:,3), 'Color','red');

% Radiance of F12
radF12 = reflectances.*illF12;

XYZradF12=683*radF12'*cmf2deg;
xradF12(:,1)= XYZradF12(:,1)./(XYZradF12(:,1)+XYZradF12(:,2)+XYZradF12(:,3));
yradF12(:,2)= XYZradF12(:,2)./(XYZradF12(:,1)+XYZradF12(:,2)+XYZradF12(:,3));

scatter(xradF12(:,1),yradF12(:,2),'g^','filled');
plot(xradF12(:,1),xyradF12(:,2),'g',[xradF12(1,1),xradF12(end,1)],[yradF12(1,1),yradF12(end,1)],'g')

line(planckian_locus(:,2),planckian_locus(:,3), 'Color','black'); 

title('Graph 5 The spectrum locus Chromacity Diagram with Specific illuminants and the Planckian Locus')
xlabel('x');
ylabel('y');
legend('illuminat D50','','illluminant A','','','illuminat D50','','illuminant D65','','','illuminant F12','Planckian Locus')
%%
% for radA
% This plot is to demonstrate how the 3 know colors determine in Graph may
% appear under the illuminace A 

figure;
plot(lambda(:,:),radA(:,1),'blue',lambda(:,:),radA(:,2),'g',lambda(:,:),radA(:,3),'red');

xlim([350,800]);
xlabel('Wavelenght(nm)');
ylabel('Reflectance Under illA');
title('Graph 6 of Reflectance of three unknown Under illA object Against Wavelength')
legend('blue','green','red')
%%

% for radD50
                                
% This plot is to demonstrate how the 3 know colors determine in Graph may
% appear under the illuminace D50

figure;
plot(lambda(:,:),radD50(:,1),'blue',lambda(:,:),radD50(:,2),'g',lambda(:,:),radD50(:,3),'red');

xlim([350,800]);
xlabel('Wavelenght(nm)');
ylabel('Reflectance Under illA');
title('Graph 7 of Reflectance of three unknown Under illD50 object Against Wavelength')
legend('blue','green','red')

%%
%for radD65
% This plot is to demonstrate how the 3 know colors determine in Graph may
% appear under the illuminace D65

figure;
plot(lambda(:,:),radD65(:,1),'blue',lambda(:,:),radD65(:,2),'g',lambda(:,:),radD65(:,3),'red');
xlim([350,800]);
xlabel('Wavelenght(nm)');
ylabel('Reflectance Under illA');
title('Graph 8 of Reflectance of three unknown Under illD65 object Against Wavelength')
legend('blue','green','red')
%%

%for radF12

radF12 = reflectances.*illF12;
% This plot is to demonstrate how the 3 know colors determine in Graph may
% appear under the illuminace D50

figure;
plot(lambda(:,:),radF12(:,1),'blue',lambda(:,:),radF12(:,2),'g',lambda(:,:),radF12(:,3),'red');
xlim([350,800]);
xlabel('Wavelenght(nm)');
ylabel('Reflectance Under illA');
title('Graph 9 of Reflectance of three unknown Under illF12 object Against Wavelength')
legend('blue','green','red')

%%
%u' v' white values of the reference

% for illuminace A

LABradA = xyz2lab(XYZradA./max(max(XYZradA)));

uvillA(:,1) = 4*xyillA(:,1)/(-2*xyillA(:,1)+12*xyillA(:,2)+3);
uvillA(:,2) = 9*xyillA(:,2)/(-2*xyillA(:,1)+12*xyillA(:,2)+3);

LuvradA(:,1) = LABradA(:,1);

uvradA(:,1) = 4.*xyradA(:,1)./(-2*xyradA(:,1)+12*xyradA(:,2)+3);
uvradA(:,2) = 9.*xyradA(:,2)./(-2*xyradA(:,1)+12*xyradA(:,2)+3);

LuvradA(:,1) = LABradA(:,1);
LuvradA(:,2) = 13*LuvradA(:,1).*(uvradA(:,1)-uvillA(:,1));
LuvradA(:,3) = 13*LuvradA(:,1).*(uvradA(:,2)-uvillA(:,2));

figure;
plotChromaticity('ColorSpace', 'uv');
hold on
scatter(uvradA(:,1), uvradA(:,2), 'ko');

