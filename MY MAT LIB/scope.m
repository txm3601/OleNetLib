function myscope(ScopeData)
input=ScopeData;
a=size(input.signals);
b=a(1,2);%b为信号的个数
c=1;%c为循环变量
while c<=b;
subplot(b,1,c)
plot(input.time,input.signals(1,c).values,'LineWidth',2.0)
set(gca,'FontSize',12,'FontName','TimesNewRoman','FontWeight','bold','LineWidth',2.0,'color','none')
xlabel('Time(s)','FontSize',12,'FontName','TimesNewRoman','FontWeight','bold')
ylabel('x1,y1','FontSize',12,'FontName','TimesNewRoman','FontWeight','bold')
title('#####','FontSize',12,'FontName','TimesNewRoman','FontWeight','bold');
c=c+1;
grid on;
legend('Y1','Y2','Y3')
set(h,'color','white');
end