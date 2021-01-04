sm = rand(500,1);

sm = smooth(sm, 100);

sm1 = smooth(sm,500);
sm2 = smooth(sm,400);
sm3 = smooth(sm,300);
sm4 = smooth(sm,200);
sm5 = smooth(sm,100);
sm6 = smooth(sm,50);
sm7 = smooth(sm,25);
sm8 = smooth(sm,1);

figure1 = figure;
hold all;
plot(sm1,'DisplayName','sm1');
plot(sm2,'DisplayName','sm2');
plot(sm3,'DisplayName','sm3');
plot(sm4,'DisplayName','sm4');
plot(sm5,'DisplayName','sm5');
plot(sm6,'DisplayName','sm6');
plot(sm7,'DisplayName','sm7');
plot(sm,'DisplayName','var');
xlabel({'Configuration Space'});
ylabel({'Distance'});
legend('show');
hold off;

sm1 = sm1 + (7*0.02);
sm2 = sm2 + (6*0.02);
sm3 = sm3 + (5*0.02);
sm4 = sm4 + (4*0.02);
sm5 = sm5 + (3*0.02);
sm6 = sm6 + (2*0.02);
sm7 = sm7 + (1*0.02);

figure2 = figure;
hold all;
plot(sm1,'DisplayName','sm1');
plot(sm2,'DisplayName','sm2');
plot(sm3,'DisplayName','sm3');
plot(sm4,'DisplayName','sm4');
plot(sm5,'DisplayName','sm5');
plot(sm6,'DisplayName','sm6');
plot(sm7,'DisplayName','sm7');
plot(sm,'DisplayName','var');
xlabel({'Configuration Space'});
ylabel({'Distance'});
legend('show');
hold off;