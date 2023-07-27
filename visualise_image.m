function im = visualise_image (train_mat, number)
  % Initializare matrice finala.
  im = zeros (28, 28);
  
  # Selectarea primelor number linii
  A = train_mat(number, :);
  
  # Transformarea unei bucati continue din memorie intr o matrice 28x28
  im = reshape(A, 28, 28);
  im=im';
  
  im = cast(im, 'uint8');

endfunction
