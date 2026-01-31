%%
load("testData.mat");
XYZtest=rad2XYZ(radTest,lambda_test',2);
xytest = XYZ2xy(XYZtest);
uvtest = xy2uv(xytest);
cctTest = xy2CCT(xytest);
%%
load("spectral_data.mat");
normRefs = refs./100;

figure();
plot(lambda_ref,normRefs(:,1),"k",lambda_ref,normRefs(:,2),"r",lambda_ref,normRefs(:,3),"y",lambda_ref,normRefs(:,4),"g",lambda_ref,normRefs(:,5),"b");
title("A Graph  to observe Materism of different objects");
xlabel("wavelength (nm)");
ylabel("Reflectance");
legend();
grid on
 
%%
load("illuminants.mat");

figure();
plot (lambda_ill,illA,"r",lambda_ill,illD65,"g",lambda_ill,illF11,"b");
xlabel("wavelengths");
ylabel("Relative spectral power distribution");
legend('',"illA","illD65","illF11","Location","best");
grid on
%%
illA_int = interp1(lambda_ill,illA,lambda_ref,"spline");
XYZradA = ref2XYZ(normRefs,illA_int,lambda_ref,2);
xyradA = XYZ2xy(XYZradA);

illD65_int = interp1(lambda_ill,illD65,lambda_ref,"spline");
XYZradD65 = ref2XYZ(normRefs,illD65_int,lambda_ref,2);
xyradD65 = XYZ2xy(XYZradD65);

illF11_int = interp1(lambda_ill,illF11,lambda_ref,"spline");
XYZradF11 = ref2XYZ(normRefs,illF11_int,lambda_ref,2);
xyradF11 = XYZ2xy(XYZradF11);
figure();plotChromaticity;

hold on 
scatter(xyradA(:,1),xyradA(:,2),"ko")
scatter(xyradD65(:,1),xyradD65(:,2),"r^")
scatter(xyradF11(:,1),xyradF11(:,2),"b>")
legend("","illA","illD65","illF11","Location","best");


%%
uvradA = xy2uv(xyradA);
uvradD65 = xy2uv(xyradD65);
uvradF11 = xy2uv(xyradF11);
figure;plotChromaticity;
hold on 
scatter(uvradA(:,1),uvradA(:,2),"ko")
scatter(uvradD65(:,1),uvradD65(:,2),"r^")
scatter(uvradF11(:,1),uvradF11(:,2),"b>")
legend("","illA","illD65","illF11","Location","best");

%%

LABradA = XYZ2Lab(XYZradA, ref2XYZ(ones(41,1), illA_int, lambda_ref,2));
LABradA;

DEradA = zeros([5 5]);

for i = 1:5
    for j = 1:5
        DEradA(i,j) = sqrt((LABradA(j,1)- LABradA(i,1)).^2 +(LABradA(j,2)- LABradA(i,2)).^2 + (LABradA(j,3)- LABradA(i,3)).^2);
    end
end

DEradA

%%
LABradD65 = XYZ2Lab(XYZradD65, ref2XYZ(ones(41,1), illD65_int, lambda_ref,2));
DEradD65 = zeros([5 5]);

for i = 1:5
    for j = 1:5
        DEradD65(i,j) = sqrt((LABradD65(j,1)- LABradD65(i,1)).^2 +(LABradD65(j,2)- LABradD65(i,2)).^2 + (LABradD65(j,3)- LABradD65(i,3)).^2);
        
    end
end

DEradD65

%%
LABradF11 = XYZ2Lab(XYZradF11, ref2XYZ(ones(41,1), illF11_int, lambda_ref,2));
DEradF11 = zeros([5 5]);
for i = 1:5
    for j = 1:5
        DEradF11(i,j) = sqrt((LABradF11(j,1)- LABradF11(i,1)).^2 +(LABradF11(j,2)- LABradF11(i,2)).^2 + (LABradF11(j,3)- LABradF11(i,3)).^2);
    end
end

DEradF11

%%


