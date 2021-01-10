function [ Tikh_inverse_sol,norm_Tikh_residual, norm_Tikh_sol,alpha] = Tikhonov_reg(U,S,V,dd,kk,b,A, p_value_tikh)
%  Tikhonov regularisation


    p = p_value_tikh;
    % create smaller S V U matrices based on size of 'p'
    Sp = S(1:p,1:p);
    Vp = V(1:dd,1:p);
    Up = U(1:kk,1:p);
    
    for a = 1:20
        alpha(a,1) = 10^((-a+2));
      
   
               
        for j = 1:p
         % find inverse solution 
            fi(a,j) = (Sp(j,j)^2/(Sp(j,j)^2+ alpha(a,1)^2));   
         
            Tikh_inverse_sol(:,j) = fi(a,j)*((dot(Up(:,j),b))/Sp(j,j))*Vp(:,j);
            
        end
        
        Tikh_inv_sol_sum(:,a) = sum(Tikh_inverse_sol,2);  % sum rows together
        
        norm_Tikh_sol(a,1) = norm(Tikh_inv_sol_sum(:,a));
        
        norm_Tikh_residual(a,1) = norm(A*Tikh_inv_sol_sum(:,a)-b);
        
        
    end
    

    

% plot the norm(model) vs norm(residual) solution vector        
loglog(norm_Tikh_residual,norm_Tikh_sol,'-s')

label = num2str(alpha);
%label = strcat('alpha=',label);
xlabel('Tikh residual norm')
ylabel('solution norm')
text(norm_Tikh_residual,norm_Tikh_sol,label);

hold off
    

    

end

