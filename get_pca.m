function principal_component_analysis = get_pca(img)
imgT = img.';
E = Eigen_Build(imgT);
EE = Eigen_Deflate(E,'keepf',0.85);
principal_component_analysis = Eigen_Project(imgT, EE)';

% totalenergy=sum(abs(E.val));
% rank = 1;
% for i=1:size(E.vct,2)
%     currentvariance(i, 1)=sum(E.val(1:rank,1))/totalenergy;
%     rank = rank + 1;
% end

% totalenergy=sum(abs(eigen.val));
% rank = 1;
% for i=1:size(eigen.vct,2)
%     currentvariance(i, 1)=sum(eigen.val(1:rank,1))/totalenergy;
%     rank = rank + 1;
% end

% %% Uncomment for Elbow Graph
% plot(1:64, currentvariance)
% xlabel('Number of Eigenvectors')
% ylabel('Variance %')
% title("Explained Variance by Eigenvectors")
% legend('varaince', 'treshold', 'optimal number of dimensions')
% yline(0.97, 'r--')
% xline(35, 'm--')
% legend('varaince', 'treshold', 'optimal number of dimensions')
% return;
