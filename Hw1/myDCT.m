function output = myDCT(input)
%myDCTSummary of this function goes here
%   Detailed explanation goes here
    input = im2double(input);
    
    Tpq = blockDivide(8);
     
    func = @(block_struct) Tpq * block_struct.data * Tpq';
    output = blockproc(input, [8, 8], func);
end