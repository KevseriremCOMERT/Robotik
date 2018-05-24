fprintf('Link uzunluklar�n� giriniz. \n');
% a ve b link uzunluklar�d�r.
a = input('');
b = input('');

fprintf('Kinematik i�in biri, Ters Kinematik i�in ikiyi Se�iniz. \n');
secim = input('');

if secim == 1
    %se�im 1 oldu�u zaman ileri kinematik denklemler kullan�l�r.
    
    fprintf('theta 1, theta 2, theta 3 a��lar�n� giriniz. \n');
    % t1, t2 a�� de�erleridir.
    t1 = input('');
    t2 = input('');

    % jointlerin ba�lang�� noktalar� belirlenir.
    x = [0 a a+b ];
    y = [0 0 0 ];
 
    grid on;
    l = line(x, y);
    hold on;
    l1 = plot(x(1), y(1), '-');
    l2 = plot(x(2), y(2), '-');
    l3 = plot(x(3), y(3), '-');
    l5 = plot(x(1), y(1), 's');
    l6 = plot(x(2), y(2), 's');
    l7 = plot(x(3), y(3), 's');
   
 
    % axes boyutlar� belirlenir.
    axis([-50 50 -50 50]);
    
    t1 = t1 * (pi / 180);
    t2 = t2 * (pi / 180);
    theta1 = t1;
    theta2 = t2;
    theta = theta1 * theta2;
    
    % a�� negatif ise pozitife �evrilir.
    if theta < 0
         theta = -theta;
    end
 
    for i = 0 : 0.003 : theta
    
        tt1 = (i * theta1) ./ (theta);
        tt2 = (i * theta2) ./ (theta);
       
        % rotasyon matrisi
        R1 = Rotate(tt1);
        R2 = Rotate(tt2);
        T2 = Translate(a);
        T3 = Translate(b);
        Y = R1 * T2;
    
        % yeni koordinatlar belirlenir
        Y1 = Y * [0; 0; 0; 1];
        x(2) = Y1(1);
        y(2) = Y1(2);
        Y = R1 * T2 * R2 * T3;
        
        Y1 = Y * [0; 0; 0; 1];
        x(3) = Y1(1);
        y(3) = Y1(2);
        %eski �izimin silinir.
        delete(l);
        delete(l5);
        delete(l6);
        delete(l7);
 
        % �izim tekrar yap�l�r.
        l = line(x, y);
        hold on;
        l1 = plot(x(1), y(1), 'r.');
        l2 = plot(x(2), y(2), 'r.');
        l3 = plot(x(3), y(3), 'r.');
        l1.MarkerSize = 1;
        l2.MarkerSize = 1;
        l3.MarkerSize = 1;
        l4.MarkerSize = 5;
        l5 = plot(x(1), y(1), 'gs');
        l6 = plot(x(2), y(2), 'gs');
        l7 = plot(x(3), y(3), 'gs');
      
        axis([-50 50 -50 50]);
        pause(0.01);
    end
end

if secim == 2
      fprintf('Gidilecek koordinat� giriniz. \n');
    % se�im 2 ise ters kinematik d�n���mler kullan�l�r.
    x1 = input('');
    y1 = input('');
    %x1 ve y1 girilir.
    x = [0 a a+b];
    y = [0 0 0];
 
    grid on;
    l = line(x, y);
    hold on;
    l1 = plot(x(1), y(1), '-');
    l2 = plot(x(2), y(2), '-');
    l3 = plot(x(3), y(3), '-');
    l5 = plot(x(1), y(1), 's');
    l6 = plot(x(2), y(2), 's');
    l7 = plot(x(3), y(3), 's');

 
    axis([-50 50 -50 50]);
    %ters kinematik denklemlerden teta1 ve teta2 bulunarak �izim yap�l�r.
    teta2=acos((x1^2 + y1^2-a^2-b^2)/(2*a*b));
    teta1=atan(y1/x1)-atan(b*sin(teta2)/(a+b*cos(teta2)));    
    teta=teta1*teta2;
    for i = 0 : 0.003 : teta
    
        t1 = (i * teta1) ./ (teta);
        t2 = (i * teta2) ./ (teta);
        R1 = Rotate(t1);
        R2 = Rotate(t2);
        T2 = Translate(a);
        T3 = Translate(b);
        Y = R1 * T2;
        Y1 = Y * [0; 0; 0; 1];
        x(2) = Y1(1);
        y(2) = Y1(2);
        Y = R1 * T2 * R2 * T3;
        Y1 = Y * [0; 0; 0; 1];
        x(3) = Y1(1);
        y(3) = Y1(2);
    

        delete(l);
        delete(l5);
        delete(l6);
        delete(l7);
      
        l = line(x, y);
        hold on;
        l1 = plot(x(1), y(1), 'r.');
        l2 = plot(x(2), y(2), 'r.');
        l3 = plot(x(3), y(3), 'r.');
        
        l1.MarkerSize = 1;
        l2.MarkerSize = 1;
        l3.MarkerSize = 1;
        l4.MarkerSize = 5;
        l5 = plot(x(1), y(1), 'gs');
        l6 = plot(x(2), y(2), 'gs');
        l7 = plot(x(3), y(3), 'gs');

        axis([-50 50 -50 50]);
     
        pause(0.01);
    end

end
    
