function [ warpedImg ] = imwarp( frame, imgToEmbed, H, cornerPoints )
%This function warps an image onto another within corner points using the
% homography matrix H
%   Input Parameters : frame - image on which another image is to be warped
%                      imgToEmbed - image to be warped on frame
%                      H - Homography matrix
%                      cornerPts - corner points on frame in which warped
%                      image will be embed
%   Output Parameters: warpedImg - final image after warping
% corner1 = datestr(now,'dd-mm-yyyy HH:MM:SS FFF')
cornerPoints = round(cornerPoints);
% corner2 = datestr(now,'dd-mm-yyyy HH:MM:SS FFF')
min_X = min(cornerPoints(:,1));
max_X = max(cornerPoints(:,1));
min_Y = min(cornerPoints(:,2));
max_Y = max(cornerPoints(:,2));
[dimx dimy dimz] = size(imgToEmbed);

b = zeros(3,1);

 for i = min_X : max_X  
    loop1 = datestr(now,'dd-mm-yyyy HH:MM:SS FFF')
    for j = min_Y : max_Y   
        
        for k = 1:3
            a = [i;j;1];
            b = H\a;% applying inverse transformation            
            x = b(1,1)/b(3,1);
            y = b(2,1)/b(3,1); 
            if (~(isinteger(x) && isinteger(y))) % if both coordinates are not integers
                %bilinearly interpolate
                x_dash = floor(x);
                y_dash = floor(y);

                x_bar = x_dash + 1;      
                y_bar = y_dash + 1;

                Ex_bar = x_bar - x;
                Ey_bar = y_bar - y;
                Ex_dash = x - x_dash;
                Ey_dash = y - y_dash;
                if(x_dash > 0 && x_bar < dimx && y_dash > 0 && y_bar < dimy)
                    tmp = Ex_bar * Ey_bar * imgToEmbed(x_dash,y_dash,k);
                    tmp = tmp + Ex_dash * Ey_bar * imgToEmbed(x_bar,y_dash,k);
                    tmp = tmp + Ex_bar * Ey_dash * imgToEmbed(x_dash,y_bar,k);
                    tmp = tmp + Ex_dash * Ey_dash * imgToEmbed(x_bar,y_bar,k);
                    frame(j,i,k) = tmp;
                end
            else
                frame(j,i,k) = imgToEmbed(x, y, k);
            end
        end
        
    end
    loop2 = datestr(now,'dd-mm-yyyy HH:MM:SS FFF')
 end

warpedImg = frame;
%imshow(frame);
end

