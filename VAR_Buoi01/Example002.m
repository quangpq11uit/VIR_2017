function Example002()
    strMessage = '\n Nhap m:';
    m = input(strMessage);
    strMessage = '\n Nhap n:';
    n = input(strMessage);
    a = ones(m, n);
    fprintf('\na:\n');
    fprintf([repmat('%f\t', 1, size(a, 2)) '\n'], a');
    b = zeros(m, n);
    fprintf('\nb:\n');
    fprintf([repmat('%f\t', 1, size(b, 2)) '\n'], b');
    c = eye(m, n);    
    fprintf('\nc:\n');
    fprintf([repmat('%f\t', 1, size(c, 2)) '\n'], c');
    d = randi([-10, 10], m, n);
    fprintf('\nd:\n');
    fprintf([repmat('%f\t', 1, size(d, 2)) '\n'], d');
    a(1, 1) = 5;
    fprintf('\na:\n');
    fprintf([repmat('%f\t', 1, size(a, 2)) '\n'], a');
    e = size(a);
    fprintf('\ne: %d', e);
end