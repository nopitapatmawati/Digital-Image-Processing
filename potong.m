function res = potong(a)
valx1 = str2num(get(handles.valx,'string'));
valy1 = str2num(get(handles.valy,'string'));
valx2 = str2num(get(handles.valx2,'string'));
valy2 = str2num(get(handles.valy2,'string'));
res(:, :, 1)=a(valx1:valx2, valy1:valy2,1);
res(:, :, 2)=a(valx1:valx2, valy1:valy2,2);
res(:, :, 3)=a(valx1:valx2, valy1:valy2,3);