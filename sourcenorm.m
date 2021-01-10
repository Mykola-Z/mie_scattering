function [av1,av2] = sourcenorm(IDmir,range)




figure
for pp = range(1):range(2)
    subplot 221
    plot(IDmir(pp,:)./max(IDmir(pp,:)));
    av2(pp,:) = IDmir(pp,:)./max(IDmir(pp,:));
    hold on
    subplot 222
    plot(IDmir(pp,:));
    hold on
    pause(0.1)
end

subplot 221
ylabel('normalised intensity')
xlabel('k')
title('mirror')
subplot 222
ylabel('intensity')
xlabel('k')
title('mirror')
% 
av1 = mean(IDmir(range(1):range(2),:),1);
av1 = av1./max(av1);
av2 = mean(av2(range(1):range(2),:),1);

    subplot 223
    plot(av2);
    title('average of normalised intensity')
    hold on
    subplot 224
    plot(av1);
    title('average of intensity')

end

