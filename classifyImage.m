function prediction = classifyImage (im, train_mat, train_val, pcs)
  % initializare predictie.
  prediction = -1;
  
  im=cast(im, 'double');
  
  # Initializam argumentele functiei magic_with_pca si aplicam functia
  [m, n]=size(train_mat);
  train = zeros(m, n);
  miu = zeros(1, n);
  Y = zeros(m, pcs);
  Vk = zeros(n, pcs);
  
  [train, miu, Y, Vk] = magic_with_pca(train_mat, pcs);
  
  im=im-miu;
  
  # Schimbarea bazei
  
  im=im*Vk;
  
  # Calculam predictia pentru k=5
  
  prediction=KNN(train_val,Y,im,5);
endfunction
