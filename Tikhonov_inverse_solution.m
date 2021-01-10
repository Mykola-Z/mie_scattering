function [ Tikhonov_inv ] = Tikhonov_inverse_solution(dd,kk,A,b,alpha_L,p_value_tikh )
%

[U,S,V] = svd(A);

    p = p_value_tikh;
    % create smaller S V U matrices based on size of 'p'
    Sp = S(1:p,1:p);
    Vp = V(1:dd,1:p);
    Up = U(1:kk,1:p);

%   Detailed explanation goes here

I = ones(1,p_value_tikh);

    for i = 1:p_value_tikh
        I(1,i) = Sp(i,i)^2/(Sp(i,i)^2+ alpha_L^2);
    end
    
Fi = diag(I);

Tikhonov_inv = (Vp*Fi*inv(Sp)*Up.'*b);







end

