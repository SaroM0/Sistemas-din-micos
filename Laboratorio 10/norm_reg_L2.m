function J = norm_reg_L2(theta,Y,H,gamma)
    J=0;
    for i=1:46
        
        J=J+(Y(i)-(theta(1)*H(i,1)+theta(2)*H(i,2)+theta(3)*H(i,3)))^2;
    end
    J=J+(gamma*norm(theta,2));
end