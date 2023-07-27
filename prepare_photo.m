function sir = prepare_photo (im)
  %initializare sirul final.
  sir = zeros (1, 784);
  
  # Inversarea pixel cu pixel prin aducerea la culoarea complementara
  
  [m, n]=size(im);
  for i=1:m
    for j=1:n
      im(i,j)=255-im(i,j);
    endfor
  endfor
  
  im=im';
  sir=reshape(im, 1, 784);
endfunction
