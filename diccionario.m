function [A]=diccionario(tex,k)
%Transforma los caracteres a sus equivalencias en código morse
for i = 1:k
    if tex(i)=='A'
    A(i)=".-";
    elseif tex(i)=='B'
    A(i)= "-...";
    elseif tex(i)=='C'
    A(i)= "-.-.";
    elseif tex(i)=='D'
    A(i)= "-..";
    elseif tex(i)=='E'
    A(i)= ".";
    elseif tex(i)=='F'
    A(i)= "..-.";
    elseif tex(i)=='G'
    A(i)= "--.";
    elseif tex(i)=='H'
    A(i)= "....";
    elseif tex(i)=='I'
    A(i)= "..";
    elseif tex(i)=='J'
    A(i)= ".---";
    elseif tex(i)=='K'
    A(i)= "-.-";
    elseif tex(i)=='L'
    A(i)= ".-..";
    elseif tex(i)=='M'
    A(i)= "--";
    elseif tex(i)=='N'
    A(i)= "-.";
    elseif tex(i)=='O'
    A(i)= "---";
    elseif tex(i)=='P'
    A(i)= ".--.";
    elseif tex(i)=='Q'
    A(i)= "--.-";
    elseif tex(i)=='R'
    A(i)= ".-.";
    elseif tex(i)=='S'
    A(i)= "...";
    elseif tex(i)=='T'
    A(i)= "-";
    elseif tex(i)=='U'
    A(i)= "..-";
    elseif tex(i)=='V'
    A(i)= "...-";
    elseif tex(i)=='W'
    A(i)= ".--";
    elseif tex(i)=='X'
    A(i)= "-..-";
    elseif tex(i)=='Y'
    A(i)= "-.--";
    elseif tex(i)=='Z'
    A(i)= "--..";
    elseif tex(i)=='1'
    A(i)= ".----";
    elseif tex(i)=='2'
    A(i)= "..---";
    elseif tex(i)=='3'
    A(i)= "...--";
    elseif tex(i)=='4'
    A(i)= "....-";
    elseif tex(i)=='5'
    A(i)= ".....";
    elseif tex(i)=='6'
    A(i)= "-....";
    elseif tex(i)=='7'
    A(i)= "--...";
    elseif tex(i)=='8'
    A(i)= "---..";
    elseif tex(i)=='9'
    A(i)= "----.";
    elseif tex(i)=='0'
    A(i)= "-----";
    elseif tex(i)=='.'
    A(i)= ".-.-.-";
    elseif tex(i)==','
    A(i)="--..--";
    elseif tex(i)=='?'
    A(i)= "..--..";
    elseif tex(i)==' '
    A(i)="/";
end
end




