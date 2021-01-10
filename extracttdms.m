function [Ch0data,Ch1data] = extracttdms(pt_per_A,A_per_B,B_per_dat,filenam0,filenam1,filen)
% extract data from tdms files, AND RESHAPE so that each column is an epoch

    insert = num2str(filen);

    filename0 = join([filenam0,insert,'.tdms']);
    A = TDMS_getStruct(filename0);
    temp0 = double(A.Untitled.Ch0.data)';
    Ch0data = reshape(temp0,pt_per_A*A_per_B,B_per_dat);

    filename1 = join([filenam1,insert,'.tdms']);
    A = TDMS_getStruct(filename1);
    temp1 = double(A.Untitled.Ch1.data)';
    Ch1data = reshape(temp1,pt_per_A*A_per_B,B_per_dat);
    
    
end

