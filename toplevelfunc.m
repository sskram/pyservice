function res = toplevelfunc(inputArg1)
%TOPLEVELFUNC Summary of this function goes here
% find a nearby prime integer from the input

    v1 = fix(inputArg1);
    if checkprime(v1)
        res = v1;
    else
        next = nextprime(v1);
        prev = prevprime(v1);
        if isempty(prev) || next-v1<v1-prev
            res = next;
        else
            res = prev;
        end
    end
    
    if ~isprime(res)
        res=-res; % to indicate mistake 
    end

end

function flg = checkprime(num)
    persistent cacheprimes;
    if isempty(cacheprimes)
        cacheprimes = [1,2,3,5,7];
    end
    flg_e = ismember(num,cacheprimes);
    if flg_e
        flg = true;
        return
    end
    flg1 = rem(num^2-1,24)==0;  % true for primes, but not exclusively
    flg2 = rem(num-1,6)==0 || rem(num+1,6)==0; % primes are next to a multiple of 6, but not exclusively
    flg3 = rem(num,5)>0 && rem(num,7)>0;    % non-multiples of 5 and 7 (any number actually)    
    flg4 = true;
    flg5 = true;
    if num > 15 && flg1 && flg2 && flg3
        rt = sqrt(num);
        flg4 = floor(rt)^2<num; % squares (why not cubes, etc)        
        flg5 = rem(num,prevprime(rt))>0 && rem(num,nextprime(rt))>0;     
        % fails for 209 = 11 * 19 (rt =14.4, prev=13, next=17)
        % also 253 = 11 * 23 (rt = 15.9)
    end
    flg = flg1 && flg2 && flg3 && flg5 && flg4;
    if flg
        cacheprimes=[cacheprimes,num];
    end
end

function out = nextprime(num)
    out = [];
    last = 2*ceil(num/2)+1;
    while isempty(out)
        if ~checkprime(last)
            last=last+2;
            continue
        else
            out = last;
            return
        end
    end
end

function out = prevprime(num)
    out = [];
    last = 2*floor(num/2)-1;
    while last > 0
        if ~checkprime(last)
            last=last-2;
            continue
        else
            out = last;
            return
        end
    end
end
