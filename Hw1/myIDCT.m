function output = myIDCT(input , n)
%myIDCT Summary of this function goes here
%   Detailed explanation goes here
    Tpq = blockDivide(8);
    mask = zeros(8,8);
    for i = 1 : n;
        for j = 1 : n;
            mask(i, j) = 1;
        end
    end
    func_mask = @(block_struct)mask .* block_struct.data;
    input_mask = blockproc(input, [8, 8], func_mask);
    
    func = @(block_struct)Tpq' * block_struct.data * Tpq;
    output = blockproc(input_mask, [8, 8], func);
end

