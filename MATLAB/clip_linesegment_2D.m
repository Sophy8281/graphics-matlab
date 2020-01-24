
% parametric line clipping using homogeneous co-ordinates and cohen
% sudherland outcodes

% Clipping against four planes (leaving zNear and zFar
function [ p0, p1, is_clipped, is_removed] = clip_linesegment_CS_2D(p0, p1)

 w1 =  p0(4);
 w2 =  p1(4);
  
  if (w1<0)&&(w2<0) % both points behind the camera/eye
      is_removed = 1;
      return;
  end   
  
RegionCodes = [1; 2; 4; 8;] ; % order: left, right, bottom, top
RegionIndex = [1; 1; 2; 2;];
RegionSign = [1; -1; 1; -1;];
is_removed = 0;
is_clipped = 0;

% outcode = TBRL {Top Bottom Right Left}
outcode0 = ComputeOutCodes_2D(p0, RegionCodes); 
outcode1 = ComputeOutCodes_2D(p1, RegionCodes);

if  not(bitor(outcode0, outcode1))  % trivial accept        
         return;
elseif  bitand(outcode0, outcode1)  % trivial reject    
     is_removed = 1;
     return;
end

done = 0;
p = zeros(4, 1);

while (done~=1)   
       
    if  not(bitor(outcode0, outcode1))  % accept        
         is_clipped = 1; 
         done = 1;     % stop processing  
    else
        % start with first non zero outcode (order 0 to 1)
         if (outcode0) 
             outcodeOut = outcode0; 
         else
             outcodeOut = outcode1;
         end
         
         % order of edges based on priority 
         if bitand(outcodeOut , RegionCodes(1)) 
                 d1 =  p0(4) + RegionSign(1)*p0(RegionIndex(1));
                 d2  = p1(4) + RegionSign(1)*p1(RegionIndex(1));            
                 t =  d1/(d1-d2);         
                 p(1:3, :)= p0(1:3, :) + t*(p1(1:3, :) - p0(1:3, :)); 
                 
                 % avoids recomputing w 
                 % It makes ComputeOutCodes easier by avoiding infinite
                 % loop condition. The new point is perfectly on plane and 
                 % so already processed intersection is removed from
                 % computations.
                 % Moreovoer w is always greater than 1. It is ensured
                 % by cliping points with w =0 plane done initially.
                 % So w is always positive and equal to one of the
                 % co-ordinates after clipping
                 p(4) = abs(p(RegionIndex(1)));  
                 
         elseif bitand(outcodeOut , RegionCodes(2)) 
                 d1 =  p0(4) + RegionSign(2)*p0(RegionIndex(2));
                 d2  = p1(4) + RegionSign(2)*p1(RegionIndex(2));            
                 t =  d1/(d1-d2);         
                  p(1:3, :)= p0(1:3, :) + t*(p1(1:3, :) - p0(1:3, :)); 
                 p(4) = abs(p(RegionIndex(2)));  % avoid recomputing w 
                 
         elseif bitand(outcodeOut , RegionCodes(3)) 
                 d1 =  p0(4) + RegionSign(3)*p0(RegionIndex(3));
                 d2  = p1(4) + RegionSign(3)*p1(RegionIndex(3));            
                 t =  d1/(d1-d2);         
                 p(1:3, :)= p0(1:3, :) + t*(p1(1:3, :) - p0(1:3, :)); 
                 p(4) = abs(p(RegionIndex(3)));  % avoid recomputing w 
                 
          elseif bitand(outcodeOut , RegionCodes(4))  
                 d1 =  p0(4) + RegionSign(4)*p0(RegionIndex(4));
                 d2  = p1(4) + RegionSign(4)*p1(RegionIndex(4));            
                 t =  d1/(d1-d2);         
                  p(1:3, :)= p0(1:3, :) + t*(p1(1:3, :) - p0(1:3, :)); 
                 p(4) = abs(p(RegionIndex(4)));  % avoid recomputing w  
         end        
         
       if (outcodeOut == outcode0) % update p0 and recompute new outcode
           outcode0 = ComputeOutCodes_2D(p, RegionCodes);           
            p0 = p;
           
       else % update p1 and recompute new outcode
           outcode1 = ComputeOutCodes_2D(p, RegionCodes); 
           p1 = p; 
       end         
    end
end







