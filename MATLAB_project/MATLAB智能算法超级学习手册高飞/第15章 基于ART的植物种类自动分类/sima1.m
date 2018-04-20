function [nw,a1,i] = sima1(w,p,lr,rho,pf)
%SIMA1    ART1 simulation function.
%	  Each input vector is presented to the network one at a time.
%         (See COMPET, HARDLIM)
% 
%         [NW,A1,i] = SIMA(W,P,lr,rho,pf)
%           W   - S2xS1 weight matrix of learned (row) vectors.
%           P   - S1xQ matrix of input vectors.
%           lr  - the learning rate.
%           rho - the vigilance parameter.
%           pf  - (Optional) Printing flag. Any value of pf
%                 enables printing of events.
%         Returns:
%           NW - the new weight matrix.
%           A1 - the vectors recalled on layer 1.
%           i  - the winning neurons in layer 2.

%         M.H. Beale & H.B. Demuth, 1-31-92
%         Copyright (c) 1992 by the MathWorks, Inc.

if nargin < 4 | nargin > 5
  error('Wrong number of input arguments.');
  end

[R,Q] = size(p);
[S2,S1] = size(w);
if R ~= S1
   error ('P should have as many rows as W has columns.');
   end

% NETWORK PARAMETERS
nw = w;
W1 = nw';
W2 = normr(w);

% INITIALIZE RETURN VARIABLES
a1 = zeros(S1,Q);
i = zeros(1,Q);

% PRESENT EACH NON-ZERO INPUT VECTOR
for q=1:Q
  if any(p(:,q) ~= 0)

    % SET ALL LAYER 2 BIASES TO 1
    B2 = zeros(S2,1);

    % REPEAT UNTIL: LAYERS 1 & 2 RESONATE
    done = 0;
    while ~done
      
      % INITIALLY A1 = P, CALCULATE WINNING NEURON IN A2
      A2 = compet(W2*p(:,q)+B2);
      i(q) = find(A2 == 1);

      % RECALCULATE A1 WITH FEEDBACK FROM A2
      a1(:,q) = (p(:,q) & W1(:,i(q)));

      % RESET NEURON FIRES IF NEW A1 TO DIFFERENT FROM P
      reset = hardlim(rho*sum(p(:,q))-sum(a1(:,q)));

      % IF RESET NEURON FIRES TAKE WINNING NEURON IN A2 OUT OF COMPETITION
      if reset
        B2(i(q)) = -10;
        if nargin == 5
          fprintf('Vector %0.f resets layer-2 neuron %0.f.\n',q,i(q));
          end

        % IF ALL NEURONS IN A2 OUT OF COMPETITION ADD NEURON TO LAYER 2
        if all(B2 == -10)
          if nargin == 5
             fprintf('New Layer-2 neuron created.\n',q);
          end
          nw = [nw; ones(1,S1)];
          W2 = normr(nw);
          W1 = nw';
          B2 = [B2; 0];
          S2 = S2 + 1;
       end

      % IF RESET NEURON DOES NOT FIRE: LAYERS 1 & 2 RESONATE 
      else
        if nargin == 5
           fprintf('Vector %0.f resonates Layer-2 neuron %0.f.\n',q,i(q));
        end
        done = 1;
     end
  end

    % LEARNING TAKES PLACE DURING RESONATION
    nntwarn off;
    %if A2==1
       
       dW = learnk(nw,p(:,q),A2,lr);
       nw = nw + dW;
     %  end
    
    W1 = nw';
    W2 = normr(nw);
 end
    if nargin == 5 
       disp('')
    end
 end
